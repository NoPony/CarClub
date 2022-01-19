import { TestBed } from '@angular/core/testing';

import { ForumViewService } from './forum-view.service';

describe('ForumViewService', () => {
  let service: ForumViewService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ForumViewService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
