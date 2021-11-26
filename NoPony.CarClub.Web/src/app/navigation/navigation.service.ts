import { Injectable } from '@angular/core';

import { MatDialog } from '@angular/material/dialog';
import { BehaviorSubject, Observable } from 'rxjs';

import { NavigationModel } from './navigation-model.interface';
import { AuthLoginComponent } from '../auth/login/auth-login.component';
import { AuthRegisterComponent } from '../auth/register/auth-register.component';
import { AuthService } from '../auth/auth.service';
import { UserModel } from '../common/model/user-model.interface';

@Injectable({
  providedIn: 'root'
})
export class NavigationService {
  private itemsSubject: BehaviorSubject<NavigationModel[]>;
  public Menus: Observable<NavigationModel[]>;

  private currentUser: UserModel | null = null;

  constructor(private dialog: MatDialog, private authService: AuthService) {
    this.authService.currentUser.subscribe(x => this.currentUser = x);

    this.itemsSubject = new BehaviorSubject<NavigationModel[]>(
      [
        { Icon: "home", Label: "Home", Show: () => true, RouterLink: "/home" },

        {
          Icon: "login", Label: "Login", Show: () => !this.currentUser, Click: () => {
            const dialogRef = this.dialog.open(AuthLoginComponent, {
              width: '400px',
            });

            dialogRef.afterClosed().subscribe();
          }
        },

        {
          Icon: "app_registration", Label: "Join", Show: () => !this.currentUser, Click: () => {
            const dialogRef = this.dialog.open(AuthRegisterComponent, {
              width: '400px',
            });

            dialogRef.afterClosed().subscribe();
          }
        },

        { Icon: "forum", Label: "Forum", RouterLink: "/forum", Show: () => !!this.currentUser },

        {
          Icon: "logout", Label: "Logout", RouterLink: "/home", Show: () => this.currentUser != null, Click: () => {
            authService.logout();
          }
        },
      ]
    );

    this.Menus = this.itemsSubject.asObservable();
  }

  public get ItemsValue(): NavigationModel[] {
    return this.itemsSubject.value;
  }
}
