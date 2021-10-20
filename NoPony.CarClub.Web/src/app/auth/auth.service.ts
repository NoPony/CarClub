import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { environment } from 'src/environments/environment';
import { UserModel } from '../common/model/user-model.interface';
import { AuthRegisterRequestDto } from '../common/dto/auth-register-request-dto.interface';
import { AuthLoginRequestDto } from '../common/dto/auth-login-request-dto.interface';
import { AuthLoginResponseDto } from '../common/dto/auth-login-response-dto.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private baseUrl: string = environment.apiUrl;

  private currentUserSubject: BehaviorSubject<UserModel | null>;
  public currentUser: Observable<UserModel | null>;

  constructor(private http: HttpClient) {
    const storedUser = localStorage.getItem('currentUser');

    if (storedUser != null)
      this.currentUserSubject = new BehaviorSubject<UserModel | null>(JSON.parse(storedUser));

    else
      this.currentUserSubject = new BehaviorSubject<UserModel | null>(null);

    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): UserModel | null {
    return this.currentUserSubject.value;
  }

  public register(request: AuthRegisterRequestDto) {
    return this.http
      .post(`${this.baseUrl}Auth/Register`, request);
  }

  public verify(key: string) {
    return this.http
      .get(`${this.baseUrl}Auth/EmailVerify/${key}`);
  }

  public login(request: AuthLoginRequestDto): Observable<AuthLoginResponseDto> {
    console.log("Login()");

    return this.http
      .post<AuthLoginResponseDto>(`${this.baseUrl}Auth/Login`, JSON.stringify(request))
      .pipe(map(user => {
        localStorage.setItem('currentUser', JSON.stringify(user));

        this.currentUserSubject.next(user);

        return user;
      }));
  }

  public logout() {
    localStorage.removeItem('currentUser');
    this.currentUserSubject.next(null);
  }
}
