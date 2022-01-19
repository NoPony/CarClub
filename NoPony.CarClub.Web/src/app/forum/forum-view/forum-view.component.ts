import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatDialog } from '@angular/material/dialog';

import { BoardCreateComponent } from '../board-create/board-create.component';
import { ForumViewService } from './forum-view.service';
import { PageResponseDto } from 'src/app/common/dto/page-response-dto.interface';
import { BoardListResponseDto } from './board-list-response-dto.interface';

@Component({
  selector: 'app-forum-view',
  templateUrl: './forum-view.component.html',
  styleUrls: ['./forum-view.component.scss'],
})
export class ForumViewComponent implements OnInit {
  @ViewChild('paginatorTop', { static: false }) paginatorTop!: MatPaginator;
  @ViewChild('paginatorBottom', { static: false }) paginatorBottom!: MatPaginator;

  public pageSizeOptions: number[] = [5, 10, 25, 100];
  public pageSize = 10;
  public pageNumber = 1;
  public model: PageResponseDto<BoardListResponseDto> | null = null;

  constructor(private router: Router, private service: ForumViewService, private dialog: MatDialog) {}

  ngOnInit(): void {
    this.fetchPage();
  }

  public createBoard(): void {
    const dialogRef = this.dialog.open(BoardCreateComponent, {
      width: '400px',
    });

    dialogRef.afterClosed().subscribe(()=> this.fetchPage());
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
      .boardList({ page: this.pageNumber, size: this.pageSize })
      .subscribe(
        (x) => {
          this.model = x;
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
  }

  public showBoard(board: BoardListResponseDto): void {
    this.router.navigate([`/board/${board.key}`]);
  }
}
