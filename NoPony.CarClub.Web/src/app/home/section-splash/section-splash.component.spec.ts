import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SectionSplashComponent } from './section-splash.component';

describe('SectionSplashComponent', () => {
  let component: SectionSplashComponent;
  let fixture: ComponentFixture<SectionSplashComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SectionSplashComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SectionSplashComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
