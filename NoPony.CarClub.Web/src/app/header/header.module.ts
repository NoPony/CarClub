import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { FlexLayoutModule } from '@angular/flex-layout';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDialogModule } from '@angular/material/dialog';

import { NavigationModule } from '../navigation/navigation.module';
import { LogoComponent } from './logo/logo.component';
import { HeaderComponent } from './header.component';
import { MenuTopComponent } from './menu-top/menu-top.component';
import { MenuSideComponent } from './menu-side/menu-side.component';

@NgModule({
  declarations: [
    HeaderComponent,

    LogoComponent,
    MenuTopComponent,
    MenuSideComponent,
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

    NavigationModule,
  ],
  exports: [
    HeaderComponent,
  ]
})
export class HeaderModule { }
