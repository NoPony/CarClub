import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { FlexLayoutModule } from '@angular/flex-layout';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import {MatDialogModule} from '@angular/material/dialog';

import { LogoComponent } from './logo/logo.component'
import { HeaderComponent } from './header.component';
import { MenuLargeComponent } from './menu-large/menu-large.component';
import { MenuSmallComponent } from './menu-small/menu-small.component';

@NgModule({
  declarations: [
    HeaderComponent,

    LogoComponent,
    MenuLargeComponent,
    MenuSmallComponent,
  ],
  imports: [
    CommonModule,
    RouterModule,

    FlexLayoutModule,
    MatToolbarModule,
    MatMenuModule,
    MatButtonModule,
    MatIconModule,
    MatDialogModule,
  ],
  exports: [
    HeaderComponent,
  ]
})
export class HeaderModule { }
