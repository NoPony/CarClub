import { Component, OnInit } from '@angular/core';

import { MatDialog } from '@angular/material/dialog';
import { BoardCreateComponent } from '../board/board-create/board-create.component';

@Component({
  selector: 'app-forum',
  templateUrl: './forum.component.html',
  styleUrls: ['./forum.component.scss']
})
export class ForumComponent implements OnInit {
  constructor(private dialog: MatDialog) {
  }

  ngOnInit(): void {
  }

  public createBoard(): void {
    const dialogRef = this.dialog.open(BoardCreateComponent, {
      width: '400px',
    });

    dialogRef.afterClosed().subscribe();
  }
}
