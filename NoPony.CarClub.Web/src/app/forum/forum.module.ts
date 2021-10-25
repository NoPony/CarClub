import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MatCardModule } from '@angular/material/card';

import { ForumComponent } from './forum.component';
import { BoardListComponent } from './board-list/board-list.component';
import { BoardListRowComponent } from './board-list-row/board-list-row.component';

@NgModule({
  declarations: [
    ForumComponent,
    BoardListComponent,
    BoardListRowComponent
  ],
  imports: [
    CommonModule,
    MatCardModule
  ]
})
export class ForumModule { }
