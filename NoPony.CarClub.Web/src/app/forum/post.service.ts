import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';

import { PageRequestDto } from '../common/dto/page-request-dto.interface';
import { PageResponseDto } from '../common/dto/page-response-dto.interface';
import { PostCreateDto } from '../forum/dto/post-create-dto.interface';
import { PostSearchDto } from './dto/post-search-dto.interface';
import { PostDto } from './dto/post-dto.interface';

@Injectable({
  providedIn: 'root',
})
export class PostService {
  private baseUrl: string = environment.apiUrl;

  constructor(private http: HttpClient) {}

  public create(request: PostCreateDto): Observable<object> {
    return this.http.post(`${this.baseUrl}Post`, request);
  }

  public read(request: string): Observable<PostDto> {
    return this.http.get<PostDto>(`${this.baseUrl}Post/${request}`);
  }

  public search(
    request: PageRequestDto
  ): Observable<PageResponseDto<PostSearchDto>> {
    const requestParams = new HttpParams()
      .append('page', request.page)
      .append('size', request.size);

    // if (!!request.query) {
    //   requestParams.append('query', request.query);
    // }

    // if (!!request.filter) {
    //   requestParams.append('filter', request.filter);
    // }

    return this.http.get<PageResponseDto<PostSearchDto>>(
      `${this.baseUrl}Post/Search`,
      { params: requestParams }
    );
  }
}
