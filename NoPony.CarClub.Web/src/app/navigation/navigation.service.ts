import { Injectable } from '@angular/core';

import { MatDialog } from '@angular/material/dialog';
import { BehaviorSubject, Observable } from 'rxjs';

import { NavigationModel } from './navigation-model.interface';
import { AuthLoginComponent } from '../auth/login/auth-login.component';
import { AuthRegisterComponent } from '../auth/register/auth-register.component';
import { AuthService } from '../auth/auth.service';
import { UserModel } from '../common/model/user-model.interface';

@Injectable({
  providedIn: 'root',
})
export class NavigationService {
  private menusSubject: BehaviorSubject<NavigationModel[]>;
  public Menus: Observable<NavigationModel[]>;

  private authenticated = false;

  constructor(private dialog: MatDialog, private authService: AuthService) {
    this.authService.Authenticated.subscribe((x) => (this.authenticated = x));

    this.menusSubject = new BehaviorSubject<NavigationModel[]>([
      {
        Icon: 'home',
        Label: 'Home',
        Show: () => true,
        RouterLink: '/home',
      },

      {
        Icon: 'login',
        Label: 'Login',
        Show: () => !this.authenticated,
        Click: () => {
          const dialogRef = this.dialog.open(AuthLoginComponent, {
            width: '400px',
          });

          dialogRef.afterClosed().subscribe();
        },
      },

      {
        Icon: 'app_registration',
        Label: 'Join',
        Show: () => !this.authenticated,
        Click: () => {
          const dialogRef = this.dialog.open(AuthRegisterComponent, {
            width: '400px',
          });

          dialogRef.afterClosed().subscribe();
        },
      },

      {
        Icon: 'forum',
        Label: 'Forum',
        RouterLink: '/forum',
        Show: () => this.authenticated,
      },

      {
        Icon: 'logout',
        Label: 'Logout',
        RouterLink: '/home',
        Show: () => this.authenticated,
        Click: () => {
          authService.logout();
        },
      },
    ]);

    this.Menus = this.menusSubject.asObservable();
  }

  public get MenusCurrent(): NavigationModel[] {
    return this.menusSubject.value;
  }
}
