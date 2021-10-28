export interface MenuModel {
    Icon?: string;
    Label: string;
    RouterLink?: string;
    Click?(): void;

    // Children?: MenuModel[];
}
