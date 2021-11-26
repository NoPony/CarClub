export interface PageRequestDto {
    page: number;
    size: number;
    query?: string;
    filter?: string;
}
