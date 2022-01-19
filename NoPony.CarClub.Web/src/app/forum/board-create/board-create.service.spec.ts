import { TestBed } from '@angular/core/testing';

import { BoardCreateService } from './board-create.service';

describe('BoardCreateService', () => {
  let service: BoardCreateService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BoardCreateService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
