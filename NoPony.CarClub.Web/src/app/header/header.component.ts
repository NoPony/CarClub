import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
// export class HeaderComponent implements OnInit {
export class HeaderComponent {
  @Output() public SidenavToggle = new EventEmitter();

  constructor() {}

  // ngOnInit(): void {
  // }

  public toggleSidenav(): void {
    this.SidenavToggle.emit();
  }
}
