import { Component, OnInit } from '@angular/core';
import { BoardListDto } from 'src/app/common/dto/board-list-dto.interface';

@Component({
  selector: 'app-board-list',
  templateUrl: './board-list.component.html',
  styleUrls: ['./board-list.component.scss']
})
export class BoardListComponent implements OnInit {
  public boardList: BoardListDto[] = [
    {
      Key: 'key1',
      Ordinal: 1,
      Title: 'Board 1',
      Note: 'This is board 1.  Boardy, isn\'t it?',
      Threads: 0,
      Messages: 0,
    },
    {
      Key: 'key2',
      Ordinal: 2,
      Title: 'Board 2',
      Note: 'This is board 2.  Boardy, isn\'t it?',
      Threads: 0,
      Messages: 0,
    },
  ];

  constructor() { }

  ngOnInit(): void {
  }
}
