import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';

import { MatDialogRef } from '@angular/material/dialog';

import { BoardCreateService } from './board-create.service';
import { BoardCreateRequestDto } from './board-create-request-dto.interface';

@Component({
  selector: 'app-board-create',
  templateUrl: './board-create.component.html',
  styleUrls: ['./board-create.component.scss'],
})
export class BoardCreateComponent implements OnInit {
  public titleControl: FormControl = new FormControl('', [Validators.required]);

  public descriptionControl: FormControl = new FormControl('', [
    Validators.required,
  ]);

  public status = 'INITIAL';

  constructor(
    public dialogRef: MatDialogRef<BoardCreateComponent>,
    private service: BoardCreateService
  ) {}

  ngOnInit(): void {
    this.status = 'READY';
  }

  public create(): void {
    this.status = 'CREATING';

    const request: BoardCreateRequestDto = {
      title: this.titleControl.value,
      note: this.descriptionControl.value,
    };

    this.service.create(request).subscribe(
      () => {
        this.dialogRef.close();
      },
      (e) => {
        console.log(`Error ${e}`);
      }
    );
  }
}
