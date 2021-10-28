import { Component, OnInit } from '@angular/core';

import { NavigationService } from '../navigation.service';
import { MenuModel } from '../menu-model.interface';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {
  public menuList: MenuModel[] = [];

  constructor(private navService: NavigationService) {
    this.navService.Menus.subscribe(x => this.menuList = x);
   }

  ngOnInit(): void {
  }

  public handleClick(m: MenuModel): void {
    if (!!m.Click) {
      m.Click();
    }
  }
}
