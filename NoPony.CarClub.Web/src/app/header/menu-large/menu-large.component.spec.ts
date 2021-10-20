import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MenuLargeComponent } from './menu-large.component';

describe('MenuLargeComponent', () => {
  let component: MenuLargeComponent;
  let fixture: ComponentFixture<MenuLargeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MenuLargeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MenuLargeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
