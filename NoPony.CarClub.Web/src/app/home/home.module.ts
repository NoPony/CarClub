import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HomeComponent } from './home.component';
import { SectionSplashComponent } from './section-splash/section-splash.component';
import { SectionEventsComponent } from './section-events/section-events.component';
import { SectionAboutComponent } from './section-about/section-about.component';

@NgModule({
  declarations: [
    HomeComponent,

    SectionSplashComponent,
    SectionEventsComponent,
    SectionAboutComponent
  ],
  imports: [
    CommonModule,
  ],
  exports: [
    HomeComponent,
  ]
})
export class HomeModule { }
