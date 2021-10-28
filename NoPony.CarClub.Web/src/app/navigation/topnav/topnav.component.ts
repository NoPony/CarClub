import { Component, OnInit, Output, EventEmitter } from '@angular/core';

import { NavigationService } from '../navigation.service';
import { MenuModel } from '../menu-model.interface';

@Component({
  selector: 'app-topnav',
  templateUrl: './topnav.component.html',
  styleUrls: ['./topnav.component.scss']
})
export class TopnavComponent implements OnInit {
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
