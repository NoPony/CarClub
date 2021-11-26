import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FlexLayoutModule } from '@angular/flex-layout';
import { MatButtonModule } from '@angular/material/button';
import { MatDialogModule } from '@angular/material/dialog';

import { BoardModule } from '../board/board.module';

import { ForumComponent } from './forum.component';

@NgModule({
  declarations: [
    ForumComponent,
  ],
  imports: [
    CommonModule,

    FlexLayoutModule,
    MatButtonModule,
    MatDialogModule,

    BoardModule,
  ],
  exports: [
    ForumComponent,
  ]
})
export class ForumModule { }
