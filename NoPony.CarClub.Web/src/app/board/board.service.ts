import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';

import { PageRequestDto } from '../common/dto/page-request-dto.interface';
import { PageResponseDto } from '../common/dto/page-response-dto.interface';
import { BoardCreateDto } from './dto/board-create-dto.interface';
import { BoardSearchDto } from './dto/board-search-dto.interface';
import { BoardReadDto } from './dto/board-read-dto.interface';

@Injectable({
  providedIn: 'root',
})
export class BoardService {
  private baseUrl: string = environment.apiUrl;

  constructor(private http: HttpClient) {}

  public create(request: BoardCreateDto): Observable<object> {
    return this.http.post(`${this.baseUrl}Board`, request);
  }

  public read(request: string): Observable<BoardReadDto> {
    return this.http.get<BoardReadDto>(`${this.baseUrl}Board/${request}`);
  }

  public search(
    request: PageRequestDto
  ): Observable<PageResponseDto<BoardSearchDto>> {
    const requestParams = new HttpParams()
      .append('page', request.page)
      .append('size', request.size);

    if (!!request.query) {
      requestParams.append('query', request.query);
    }

    if (!!request.filter) {
      requestParams.append('filter', request.filter);
    }

    return this.http.get<PageResponseDto<BoardSearchDto>>(
      `${this.baseUrl}Board/Search`,
      { params: requestParams }
    );
  }
}
