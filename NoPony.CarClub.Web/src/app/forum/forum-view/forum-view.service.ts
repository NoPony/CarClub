import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';

import { PageRequestDto } from 'src/app/common/dto/page-request-dto.interface';
import { PageResponseDto } from 'src/app/common/dto/page-response-dto.interface';
import { BoardListResponseDto } from '../forum-view/board-list-response-dto.interface';

@Injectable({
  providedIn: 'root'
})
export class ForumViewService {
  private baseUrl: string = environment.apiUrl;

  constructor(private http: HttpClient) {}

  public boardList(request: PageRequestDto): Observable<PageResponseDto<BoardListResponseDto>> {
    const requestParams = new HttpParams()
      .append('page', request.page)
      .append('size', request.size);

    // if (!!request.query) {
    //   requestParams.append('query', request.query);
    // }

    // if (!!request.filter) {
    //   requestParams.append('filter', request.filter);
    // }

    return this.http.get<PageResponseDto<BoardListResponseDto>>(
      `${this.baseUrl}Board/Search`,
      { params: requestParams }
    );
  }
}
