import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';

import { AuthService } from '../auth.service';
import { AuthLoginRequestDto } from '../../common/dto/auth-login-request-dto.interface';

@Component({
  selector: 'app-auth-login',
  templateUrl: './auth-login.component.html',
  styleUrls: ['./auth-login.component.scss']
})
export class AuthLoginComponent implements OnInit {
  public emailControl: FormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  public passwordControl: FormControl = new FormControl('', [
    Validators.required,
  ]);

  public email = '';
  public password = '';
  public hidePassword = true;

  public idle = true;
  public busy = false;

  constructor(public dialogRef: MatDialogRef<AuthLoginComponent>, private authService: AuthService) {
  }

  ngOnInit(): void {
  }

  public login(): void {
    if (!this.emailControl.valid)
    {
      return;
    }

    if (!this.passwordControl.valid){
      return;
    }

    this.idle = false;
    this.busy = true;

    const request: AuthLoginRequestDto = {
      email: this.emailControl.value,
      password: this.passwordControl.value,
    };

    this.authService.login(request)
      .subscribe(
        () => {
          this.dialogRef.close();
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
  }
}
