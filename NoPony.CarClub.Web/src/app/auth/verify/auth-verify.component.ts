import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

import { AuthService } from '../auth.service';

@Component({
  selector: 'app-auth-verify',
  templateUrl: './auth-verify.component.html',
  styleUrls: ['./auth-verify.component.scss']
})
export class AuthVerifyComponent implements OnInit {
  public busy = true;
  public success = false;
  public fail = false;

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogRef: MatDialogRef<AuthVerifyComponent>,
    private authService: AuthService) { }

  ngOnInit(): void {
    this.authService.verify(this.data.key)
      .subscribe(
        () => {
          this.busy = false;
          this.success = true;
        },
        () => {
          this.busy = false;
          this.fail = true;
        }
      );
  }

  public close(): void {
    this.dialogRef.close();
  }
}
