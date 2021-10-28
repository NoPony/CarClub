import { Component, OnInit, Output, EventEmitter } from '@angular/core';

import { NavigationService } from '../navigation.service';
import { MenuModel } from '../menu-model.interface';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.scss']
})
export class SidenavComponent implements OnInit {
  @Output() SidenavClose = new EventEmitter();

  public menuList: MenuModel[] = [];

  constructor(private navService: NavigationService) {
    this.navService.Menus.subscribe(x => this.menuList = x);
  }

  ngOnInit(): void {
  }

  public handleClick(m: MenuModel): void {
    this.closeSidenav();

    if (!!m.Click) {
      m.Click();
    }
  }

  private closeSidenav(): void {
    this.SidenavClose.emit();
  }
}
