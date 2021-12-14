import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, interval } from 'rxjs';
import { map } from 'rxjs/operators';

import { environment } from 'src/environments/environment';

import { AuthRegisterRequestDto } from '../common/dto/auth-register-request-dto.interface';
import { AuthLoginRequestDto } from '../common/dto/auth-login-request-dto.interface';
import { AuthLoginResponseDto } from '../common/dto/auth-login-response-dto.interface';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private baseUrl: string = environment.apiUrl;

  private authenticatedSubject: BehaviorSubject<boolean>;
  public Authenticated: Observable<boolean>;

  public AccessToken: string | null;

  // private refreshTokenTimeout: NodeJS.Timeout | undefined;

  constructor(private http: HttpClient) {
    const refreshToken = localStorage.getItem('refreshToken');

    if (refreshToken != null) {
      this.AccessToken = JSON.parse(refreshToken);
      this.authenticatedSubject = new BehaviorSubject<boolean>(true);
    } else {
      this.AccessToken = null;
      this.authenticatedSubject = new BehaviorSubject<boolean>(false);
    }

    this.Authenticated = this.authenticatedSubject.asObservable();
  }

  public get AuthenticatedCurrent(): boolean {
    return this.authenticatedSubject.value;
  }

  public register(request: AuthRegisterRequestDto): Observable<object> {
    return this.http.post(`${this.baseUrl}Auth/Register`, request);
  }

  public verify(key: string): Observable<object> {
    return this.http.get(`${this.baseUrl}Auth/EmailVerify/${key}`);
  }

  public login(request: AuthLoginRequestDto): Observable<AuthLoginResponseDto> {
    return this.http
      .post<AuthLoginResponseDto>(
        `${this.baseUrl}Auth/Login`,
        JSON.stringify(request)
      )
      .pipe(
        map((response) => {
          localStorage.setItem(
            'refreshToken',
            JSON.stringify(response.refreshToken)
          );

          this.AccessToken = response.accessToken;
          this.authenticatedSubject.next(true);

          this.startRefreshTimer();

          return response;
        })
      );
  }

  public logout(): void {
    localStorage.removeItem('refreshToken');

    this.AccessToken = null;
    this.authenticatedSubject.next(false);
  }

  public refresh(): void {
    this.http
      .get<AuthLoginResponseDto>(`${this.baseUrl}Auth/Refresh`)
      .subscribe((response) => {
        localStorage.setItem(
          'refreshToken',
          JSON.stringify(response.refreshToken)
        );

        this.AccessToken = response.accessToken;
        this.authenticatedSubject.next(true);

        this.startRefreshTimer();
      });
  }

  private startRefreshTimer(): void {
    if (this.AccessToken) {
      const tokenBody = JSON.parse(atob(this.AccessToken.split('.')[1]));

      const tokenExpires = new Date(tokenBody.exp * 1000);
      const timeout = tokenExpires.getTime() - Date.now() - 60 * 1000;

      interval(timeout).subscribe(() => {
        if (this.AuthenticatedCurrent) {
          console.log('Refreshing token');

          this.refresh();
        }
      });
    }
  }

  // private stopRefreshTimer() {
  //   if (!!this.refreshTokenTimeout)
  //     clearTimeout(this.refreshTokenTimeout);
  // }
}
