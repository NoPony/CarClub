import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';

import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

import { PostService } from '../post.service';
import { PostCreateDto } from '../dto/post-create-dto.interface';

@Component({
  selector: 'app-post-create',
  templateUrl: './post-create.component.html',
  styleUrls: ['./post-create.component.scss'],
})
export class PostCreateComponent implements OnInit {
  public titleControl: FormControl = new FormControl('', [Validators.required]);

  public contentControl: FormControl = new FormControl('', [
    Validators.required,
  ]);

  public status = 'INITIAL';

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<PostCreateComponent>,
    private postService: PostService
  ) {}

  ngOnInit(): void {
    this.status = 'IDLE';
  }

  public create(): void {
    this.status = 'POSTING';

    const request: PostCreateDto = {
      key: this.data.boardKey,
      title: this.titleControl.value,
      content: this.contentControl.value,
    };

    this.postService.create(request).subscribe(
      () => {
        this.dialogRef.close();
      },
      (e) => {
        console.log(`Error ${e}`);
      }
    );
  }
}
