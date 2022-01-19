import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';

import { PageRequestDto } from '../common/dto/page-request-dto.interface';
import { PageResponseDto } from '../common/dto/page-response-dto.interface';
//import { BoardCreateRequestDto } from './board-create/board-create-request-dto.interface';
import { BoardSearchDto } from './dto/board-search-dto.interface';
import { BoardDto } from './board-view/board-dto.interface';

@Injectable({
  providedIn: 'root',
})
export class BoardService {
  private baseUrl: string = environment.apiUrl;

  constructor(private http: HttpClient) {}

  // public create(request: BoardCreateRequestDto): Observable<object> {
  //   return this.http.post(`${this.baseUrl}Board`, request);
  // }

  public read(request: string): Observable<BoardDto> {
    return this.http.get<BoardDto>(`${this.baseUrl}Board/${request}`);
  }

  // public search(
  //   request: PageRequestDto
  // ): Observable<PageResponseDto<BoardSearchDto>> {
  //   const requestParams = new HttpParams()
  //     .append('page', request.page)
  //     .append('size', request.size);

  //   if (!!request.query) {
  //     requestParams.append('query', request.query);
  //   }

  //   if (!!request.filter) {
  //     requestParams.append('filter', request.filter);
  //   }

  //   return this.http.get<PageResponseDto<BoardSearchDto>>(
  //     `${this.baseUrl}Board/Search`,
  //     { params: requestParams }
  //   );
  // }
}
