import { Injectable } from '@angular/core';

import { MatDialog } from '@angular/material/dialog';
import { BehaviorSubject, Observable } from 'rxjs';

import { MenuModel } from './menu-model.interface';
import { AuthLoginComponent } from '../auth/login/auth-login.component';
import { AuthRegisterComponent } from '../auth/register/auth-register.component';
import { AuthService } from '../auth/auth.service';

@Injectable({
  providedIn: 'root'
})
export class NavigationService {
  private itemsSubject: BehaviorSubject<MenuModel[]>;
  public Menus: Observable<MenuModel[]>;

  constructor(private dialog: MatDialog, private authService: AuthService) {
    this.itemsSubject = new BehaviorSubject<MenuModel[]>(
      [
        { Icon: "home", Label: "Home", RouterLink: "/home" },

        { Icon: "login", Label: "Login", Click: () => { 
          const dialogRef = this.dialog.open(AuthLoginComponent, {
            width: '400px',
          });
      
          dialogRef.afterClosed().subscribe();
        } },
        
        { Icon: "app_registration", Label: "Join", Click:  () => { 
          const dialogRef = this.dialog.open(AuthRegisterComponent, {
            width: '400px',
          });
      
          dialogRef.afterClosed().subscribe();
        } },

        { Icon: "forum", Label: "Forum", RouterLink: "/forum" },
        
        { Icon: "logout", Label: "Logout", RouterLink: "/home", Click: () => { 
          authService.logout();
        } },
      ]
    );

    this.Menus = this.itemsSubject.asObservable();
  }

  public get ItemsValue(): MenuModel[] {
    return this.itemsSubject.value;
  }
}
