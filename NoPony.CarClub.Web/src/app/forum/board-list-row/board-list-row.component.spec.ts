import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BoardListRowComponent } from './board-list-row.component';

describe('BoardListRowComponent', () => {
  let component: BoardListRowComponent;
  let fixture: ComponentFixture<BoardListRowComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BoardListRowComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BoardListRowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
