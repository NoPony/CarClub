export interface SearchRequestDto {
    page: number;
    size: number;
    query?: string;
    filter?: string;
}
