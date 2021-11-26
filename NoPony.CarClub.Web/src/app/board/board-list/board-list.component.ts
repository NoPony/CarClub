import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, PageEvent } from '@angular/material/paginator';

import { PageResponseDto } from 'src/app/common/dto/page-response-dto.interface';
import { BoardService } from '../board.service';
import { BoardSearchDto } from '../dto/board-search-dto.interface';

@Component({
  selector: 'app-board-list',
  templateUrl: './board-list.component.html',
  styleUrls: ['./board-list.component.scss']
})
export class BoardListComponent implements OnInit {
  @ViewChild('paginatorTop', { static: false }) paginatorTop!: MatPaginator;
  @ViewChild('paginatorBottom', { static: false }) paginatorBottom!: MatPaginator;

  public pageSizeOptions: number[] = [5, 10, 25, 100];
  public pageSize: number = 10;
  public pageNumber: number = 1;
  public model: PageResponseDto<BoardSearchDto> | null = null;

  constructor(private router: Router, private dialog: MatDialog, private boardService: BoardService) { 
    this.fetchPage();
  }

  ngOnInit(): void {
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

  private fetchPage() {
    this.boardService.search({ page: this.pageNumber, size: this.pageSize }).subscribe(
      (x) => {
        this.model = x;
      },
      (e) => {
        console.log(`Error ${e}`);
      });
  }

  public showBoard(board: BoardSearchDto): void {
    this.router.navigate([`/board/${board.key}`]);
  }
}
