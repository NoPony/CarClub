import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute } from '@angular/router';

import { PostService } from '../post.service';
import { CommentCreateComponent } from '../comment-create/comment-create.component';
import { PostDto } from '../dto/post-dto.interface';

@Component({
  selector: 'app-post-view',
  templateUrl: './post-view.component.html',
  styleUrls: ['./post-view.component.scss'],
})
// export class PostViewComponent implements OnInit {
export class PostViewComponent {
  public postKey: string | null = null;
  public post: PostDto | null = null;
  public comments: string[] | null = null;

  constructor(
    private actRoute: ActivatedRoute,
    private postService: PostService,
    private dialog: MatDialog
  ) {
    this.postKey = this.actRoute.snapshot.params.key;

    if (!!this.postKey) {
      const key: string = this.postKey;

      postService.read(key).subscribe(
        (i) => {
          this.post = i;
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
    }
  }

  // ngOnInit(): void {
  // }

  public createPost(): void {
    const dialogRef = this.dialog.open(CommentCreateComponent, {
      width: '400px',
      data: {
        postKey: this.postKey,
      }
    });

    dialogRef.afterClosed().subscribe();
  }
}
