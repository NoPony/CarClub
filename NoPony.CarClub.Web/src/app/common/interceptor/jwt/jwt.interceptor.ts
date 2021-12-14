import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';
import { AuthService } from 'src/app/auth/auth.service';

@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService) { }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const authenticated = this.authService.AuthenticatedCurrent;
    const accessToken = this.authService.AccessToken;
    const isApiUrl = request.url.startsWith(environment.apiUrl);

    if (authenticated && isApiUrl) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${accessToken ?? ''}`
        }
      });
    }

    return next.handle(request);
  }
}
