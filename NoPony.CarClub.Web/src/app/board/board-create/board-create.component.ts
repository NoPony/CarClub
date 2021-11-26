import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';

import { MatDialogRef } from '@angular/material/dialog';

import { BoardService } from '../board.service';
import { BoardCreateDto } from '../dto/board-create-dto.interface';

@Component({
  selector: 'app-board-create',
  templateUrl: './board-create.component.html',
  styleUrls: ['./board-create.component.scss']
})
export class BoardCreateComponent implements OnInit {
  public titleControl: FormControl = new FormControl('', [
    Validators.required,
  ]);

  public descriptionControl: FormControl = new FormControl('', [
    Validators.required,
  ]);

  public idle = true;
  public busy = false;

  constructor(public dialogRef: MatDialogRef<BoardCreateComponent>, private boardService: BoardService) { }

  ngOnInit(): void {
  }

  public create(): void {
    this.idle = false;
    this.busy = true;

    const request: BoardCreateDto = {
      title: this.titleControl.value,
      note: this.descriptionControl.value,
    };

    this.boardService.create(request)
      .subscribe(
        () => {
          this.dialogRef.close();
        },
        (e) => {
          console.log(`Error ${e}`);
        }
      );
  }
}
