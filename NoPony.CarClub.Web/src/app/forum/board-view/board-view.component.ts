import { Component, OnInit, ViewChild } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, PageEvent } from '@angular/material/paginator';

import { BoardViewService } from './board-view.service';
import { BoardDto } from './board-dto.interface';
import { PostCreateComponent } from '../post-create/post-create.component';
import { PostSearchDto } from '../dto/post-search-dto.interface';
import { PostDto } from '../dto/post-dto.interface';
import { PageResponseDto } from 'src/app/common/dto/page-response-dto.interface';

@Component({
  selector: 'app-board-view',
  templateUrl: './board-view.component.html',
  styleUrls: ['./board-view.component.scss'],
})
export class BoardViewComponent implements OnInit {
  @ViewChild('paginatorTop', { static: false }) paginatorTop!: MatPaginator;
  @ViewChild('paginatorBottom', { static: false }) paginatorBottom!: MatPaginator;

  public pageSizeOptions: number[] = [5, 10, 25, 100];
  public pageSize = 10;
  public pageNumber = 1;
  public model: PageResponseDto<PostSearchDto> | null = null;

  public boardKey: string | null = null;
  public board: BoardDto | null = null;

  constructor(
    private router: Router,
    private actRoute: ActivatedRoute,
    private service: BoardViewService,
    private dialog: MatDialog
  ) {
  }

  ngOnInit(): void {
    this.boardKey = this.actRoute.snapshot.params.key;

    if (!!this.boardKey) {
      const key: string = this.boardKey;

      this.service.board(key).subscribe(
        (i) => {
          this.board = i;
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );

      this.service.postList(key, this.pageNumber, this.pageSize).subscribe(
        (i) => {
          this.postList = i;
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
    }
  }

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
    this.service
      .postList(this.boardKey, this.pageNumber, this.pageSize)
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

  public createPost(): void {
    const dialogRef = this.dialog.open(PostCreateComponent, {
      width: '400px',
      data: {
        boardKey: this.boardKey,
      }
    });

    dialogRef.afterClosed().subscribe();
  }

  public showPost(post: PostSearchDto): void {
    this.router.navigate([`/post/${post.key}`]);
  }
}
