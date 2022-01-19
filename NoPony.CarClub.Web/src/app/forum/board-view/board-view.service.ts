import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';

import { PostDto } from '../dto/post-dto.interface';
import { BoardDto } from './board-dto.interface';

@Injectable({
  providedIn: 'root'
})
export class BoardViewService {
  private baseUrl: string = environment.apiUrl;

  constructor(private http: HttpClient) {}

  public board(boardKey: string): Observable<BoardDto> {
    return this.http.get<BoardDto>(`${this.baseUrl}Board/${boardKey}`);
  }

  public postList(boardKey: string, pageNumber: number, pageSize: number): Observable<PostDto[]> {
    return this.http.get<PostDto[]>(`${this.baseUrl}Post/${boardKey}`);
  }
}
