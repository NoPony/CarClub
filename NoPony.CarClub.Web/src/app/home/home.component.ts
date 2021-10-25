import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';

import { AuthVerifyComponent } from 'src/app/auth/verify/auth-verify.component';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  public emailVerify: string | null = null;

  constructor(private actRoute: ActivatedRoute, private dialog: MatDialog) {
  }

  ngOnInit(): void {
    this.actRoute.paramMap.subscribe(params => {
      this.emailVerify = params.get('verify');

      if (this.emailVerify != null) {
        const dialogRef = this.dialog.open(AuthVerifyComponent, {
          width: '400px',
          data: {
            key: this.emailVerify,
          }
        });

        dialogRef.afterClosed().subscribe();
      }
    });
  }

}
