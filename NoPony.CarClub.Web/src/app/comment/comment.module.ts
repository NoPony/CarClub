import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CommentCreateComponent } from './comment-create/comment-create.component';
import { CommentListComponent } from './comment-list/comment-list.component';



@NgModule({
  declarations: [
    CommentCreateComponent,
    CommentListComponent
  ],
  imports: [
    CommonModule
  ]
})
export class CommentModule { }
