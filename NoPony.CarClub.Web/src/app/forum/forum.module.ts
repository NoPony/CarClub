import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { FlexLayoutModule } from '@angular/flex-layout';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatProgressBarModule } from '@angular/material/progress-bar';

import { ForumViewComponent } from './forum-view/forum-view.component';
import { BoardCreateComponent } from './board-create/board-create.component';
import { PostCreateComponent } from './post-create/post-create.component';
import { PostListComponent } from './_post-list/post-list.component';
import { PostViewComponent } from './post-view/post-view.component';

@NgModule({
  declarations: [
    ForumViewComponent,
    BoardCreateComponent,
    PostCreateComponent,
    PostListComponent,
    PostViewComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule,

    FlexLayoutModule,
    MatButtonModule,
    MatCardModule,
    MatDialogModule,
    MatFormFieldModule,
    MatIconModule,
    MatInputModule,
    MatPaginatorModule,
    MatProgressSpinnerModule,
    MatProgressBarModule,
  ],
  exports: [
    ForumViewComponent,
    BoardCreateComponent,
    PostCreateComponent,
    PostListComponent,
  ]
})
export class ForumModule { }
