export interface NavigationModel {
  Icon?: string;
  Label: string;
  RouterLink?: string;

  Show(): boolean;
  Click?(): void;

  // Children?: MenuModel[];
}
