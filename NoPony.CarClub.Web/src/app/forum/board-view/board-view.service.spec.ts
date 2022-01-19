import { TestBed } from '@angular/core/testing';

import { BoardViewService } from './board-view.service';

describe('BoardViewService', () => {
  let service: BoardViewService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BoardViewService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
