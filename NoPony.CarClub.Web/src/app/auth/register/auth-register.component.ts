import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';

import { AuthService } from '../auth.service';
import { AuthRegisterRequestDto } from '../../common/dto/auth-register-request-dto.interface';

@Component({
  selector: 'app-auth-register',
  templateUrl: './auth-register.component.html',
  styleUrls: ['./auth-register.component.scss']
})
export class AuthRegisterComponent implements OnInit {
  public hidePassword: boolean = true;

  public stateIdle: number = 0;
  public stateBusy: number = 1;
  public stateSuccess: number = 2;
  public stateError: number = 3;

  public state: number = this.stateIdle;

  public email: string = '';

  constructor(private dialogRef: MatDialogRef<AuthRegisterComponent>, private authService: AuthService) {
  }

  ngOnInit(): void {
  }

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

  public join(): void {
    if (!this.emailControl.valid)
      return;

    if (!this.passwordControl.valid)
      return;

    if (!this.verifyControl.valid)
      return;

    this.state = this.stateBusy;

    const request: AuthRegisterRequestDto = {
      email: this.emailControl.value,
      password: this.passwordControl.value,
      verify: this.verifyControl.value,
    };

    this.email = this.emailControl.value;

    this.authService.register(request)
      .subscribe(
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
