import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { BoardService } from './board.service';
import { BoardReadDto } from './dto/board-read-dto.interface';

@Component({
  selector: 'app-board',
  templateUrl: './board.component.html',
  styleUrls: ['./board.component.scss']
})
export class BoardComponent implements OnInit {
  public boardKey: string | null = null;
  public board: BoardReadDto | null = null;
  public posts: string[] | null = null;

  constructor(private actRoute: ActivatedRoute, private boardService: BoardService) {
    this.boardKey = this.actRoute.snapshot.params.key;

    if (!!this.boardKey) {
      const key: string = this.boardKey;

      boardService.read(key).subscribe(
        (i) => {
          this.board = i;
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
    }
  }

  ngOnInit(): void {
  }

  public createPost(): void {

  }
}
