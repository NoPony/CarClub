import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, PageEvent } from '@angular/material/paginator';

import { PageResponseDto } from 'src/app/common/dto/page-response-dto.interface';
import { PostService } from '../post.service';
import { PostSearchDto } from '../dto/post-search-dto.interface';

@Component({
  selector: 'app-post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.scss'],
})
// export class PostListComponent implements OnInit {
export class PostListComponent {
  @ViewChild('paginatorTop', { static: false }) paginatorTop!: MatPaginator;
  @ViewChild('paginatorBottom', { static: false })
  paginatorBottom!: MatPaginator;

  public pageSizeOptions: number[] = [5, 10, 25, 100];
  public pageSize = 10;
  public pageNumber = 1;
  public model: PageResponseDto<PostSearchDto> | null = null;

  constructor(
    private router: Router,
    private dialog: MatDialog,
    private postService: PostService
  ) {
    this.fetchPage();
  }

  // ngOnInit(): void {}

  public showPageTop(event: PageEvent): void {
    this.pageNumber = event.pageIndex + 1;
    this.pageSize = event.pageSize;

    this.paginatorBottom.pageIndex = event.pageIndex;
    this.paginatorBottom.pageSize = event.pageSize;

    this.fetchPage();
  }

  public showPageBottom(event: PageEvent): void {
    this.pageNumber = event.pageIndex + 1;
    this.pageSize = event.pageSize;

    this.paginatorTop.pageIndex = event.pageIndex;
    this.paginatorTop.pageSize = event.pageSize;

    this.fetchPage();
  }

  private fetchPage(): void {
    this.postService
      .search({ page: this.pageNumber, size: this.pageSize })
      .subscribe(
        (x) => {
          this.model = x;
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
  }

  public showPost(post: PostSearchDto): void {
    this.router.navigate([`/post/${post.key}`]);
  }
}
