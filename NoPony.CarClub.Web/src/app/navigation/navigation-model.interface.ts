export interface NavigationModel {
    Icon?: string;
    Label: string;
    
    Show(): boolean;

    RouterLink?: string;
    Click?(): void;
    
    // Children?: MenuModel[];
}
