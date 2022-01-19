import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';

import { BoardCreateRequestDto } from './board-create-request-dto.interface';

@Injectable({
  providedIn: 'root'
})
export class BoardCreateService {
  private baseUrl: string = environment.apiUrl;

  constructor(private http: HttpClient) {}

  public create(request: BoardCreateRequestDto): Observable<object> {
    return this.http.post(`${this.baseUrl}Board`, request);
  }
}
