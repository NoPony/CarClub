import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AuthVerifyComponent } from './auth-verify.component';

describe('VerifyComponent', () => {
  let component: AuthVerifyComponent;
  let fixture: ComponentFixture<AuthVerifyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AuthVerifyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AuthVerifyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});