import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';

import { AuthService } from '../auth.service';
import { AuthRegisterRequestDto } from '../../common/dto/auth-register-request-dto.interface';

@Component({
  selector: 'app-auth-register',
  templateUrl: './auth-register.component.html',
  styleUrls: ['./auth-register.component.scss'],
})
// export class AuthRegisterComponent implements OnInit {
export class AuthRegisterComponent {
  public hidePassword = true;

  public stateIdle = 0;
  public stateBusy = 1;
  public stateSuccess = 2;
  public stateError = 3;

  public state = this.stateIdle;

  public email = '';

  public emailControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  public passwordControl = new FormControl('', [
    Validators.required,
    Validators.minLength(8),
  ]);

  public verifyControl = new FormControl('', [
    Validators.required,
    Validators.pattern(this.passwordControl.value),
  ]);

  constructor(
    private dialogRef: MatDialogRef<AuthRegisterComponent>,
    private authService: AuthService
  ) {}

  // ngOnInit(): void {
  // }

  public join(): void {
    if (!this.emailControl.valid) {
      return;
    }

    if (!this.passwordControl.valid) {
      return;
    }

    if (!this.verifyControl.valid) {
      return;
    }

    this.state = this.stateBusy;

    const request: AuthRegisterRequestDto = {
      email: this.emailControl.value,
      password: this.passwordControl.value,
      verify: this.verifyControl.value,
    };

    this.email = this.emailControl.value;

    this.authService.register(request).subscribe(
      () => {
        this.state = this.stateSuccess;
      },

      () => {
        this.state = this.stateError;
      }
    );
  }

  public close(): void {
    this.dialogRef.close();
  }
}
