import { Component, OnInit, Output, EventEmitter } from '@angular/core';

import { NavigationService } from '../navigation.service';
import { NavigationModel } from '../navigation-model.interface';
import { UserModel } from 'src/app/common/model/user-model.interface';
import { AuthService } from 'src/app/auth/auth.service';

@Component({
  selector: 'app-topnav',
  templateUrl: './topnav.component.html',
  styleUrls: ['./topnav.component.scss'],
})
// export class TopnavComponent implements OnInit {
export class TopnavComponent {
  public menuList: NavigationModel[] = [];
  public authenticated = false;

  constructor(
    private navService: NavigationService,
    private authService: AuthService
  ) {
    this.navService.Menus.subscribe((x) => (this.menuList = x));
    this.authService.Authenticated.subscribe((x) => (this.authenticated = x));
  }

  // ngOnInit(): void {
  // }

  public handleClick(m: NavigationModel): void {
    if (!!m.Click) {
      m.Click();
    }
  }
}
