import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';

import { AuthService } from 'src/app/auth/auth.service';
import { UserModel } from 'src/app/common/model/user-model.interface';
import { AuthLoginComponent } from 'src/app/auth/login/auth-login.component';
import { AuthRegisterComponent } from 'src/app/auth/register/auth-register.component';

@Component({
  selector: 'app-menu-large',
  templateUrl: './menu-large.component.html',
  styleUrls: ['./menu-large.component.scss']
})
export class MenuLargeComponent implements OnInit {
  currentUser: UserModel | null = null;

  constructor(private router: Router, private dialog: MatDialog, private authService: AuthService) { 
    this.authService.currentUser.subscribe(x => this.currentUser = x);
  }

  ngOnInit(): void {
  }

  loginDialog(): void {
    const dialogRef = this.dialog.open(AuthLoginComponent, {
      width: '400px',
    });

    dialogRef.afterClosed().subscribe();
  }

  registerDialog(): void {
    const dialogRef = this.dialog.open(AuthRegisterComponent, {
      width: '400px',
    });

    dialogRef.afterClosed().subscribe();
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/home']);
  }
}
