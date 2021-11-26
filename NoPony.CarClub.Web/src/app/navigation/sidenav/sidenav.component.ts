import { Component, OnInit, Output, EventEmitter } from '@angular/core';

import { NavigationService } from '../navigation.service';
import { NavigationModel } from '../navigation-model.interface';
import { UserModel } from 'src/app/common/model/user-model.interface';
import { AuthService } from 'src/app/auth/auth.service';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.scss']
})
export class SidenavComponent implements OnInit {
  @Output() SidenavClose = new EventEmitter();

  public menuList: NavigationModel[] = [];
  private currentUser: UserModel | null = null;

  constructor(private navService: NavigationService, private authService: AuthService) {
    this.navService.Menus.subscribe(x => this.menuList = x);
    this.authService.currentUser.subscribe(x => this.currentUser = x);
  }

  ngOnInit(): void {
  }

  public handleClick(m: NavigationModel): void {
    this.closeSidenav();

    if (!!m.Click) {
      m.Click();
    }
  }

  private closeSidenav(): void {
    this.SidenavClose.emit();
  }
}
