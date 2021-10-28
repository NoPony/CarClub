import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { FlexLayoutModule } from '@angular/flex-layout';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDialogModule } from '@angular/material/dialog';
import { MatListModule } from '@angular/material/list';

import { SidenavComponent } from './sidenav/sidenav.component';
import { TopnavComponent } from './topnav/topnav.component';
import { MenuComponent } from './menu/menu.component';

@NgModule({
  declarations: [
    SidenavComponent,
    TopnavComponent,
    MenuComponent
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
    MatListModule,
  ],
  exports: [
    SidenavComponent,
    TopnavComponent,
  ]
})
export class NavigationModule { }
