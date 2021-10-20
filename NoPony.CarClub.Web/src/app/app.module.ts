import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { UrlSerializer } from '@angular/router';

import { ContentTypeInterceptor } from 'src/app/common/interceptor/content-type/content-type.interceptor';
import { JwtInterceptor } from 'src/app/common/interceptor/jwt/jwt.interceptor';
import { ErrorInterceptor } from 'src/app/common/interceptor/error/error.interceptor';

import { AppRoutingModule } from './app-routing.module';
import { CustomUrlSerializer } from './custom-url-serializer';
import { AppComponent } from './app.component';

import { HeaderModule } from './header/header.module';
import { FooterModule } from './footer/footer.module';
import { HomeModule } from './home/home.module';
import { AuthModule } from './auth/auth.module';
import { EventsModule } from './events/events.module';
import { ForumModule } from './forum/forum.module';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FlexLayoutModule,
    HttpClientModule,

    AppRoutingModule,

    HeaderModule,
    FooterModule,
    HomeModule,
    AuthModule,
    ForumModule,
    EventsModule,
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: ContentTypeInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
    { provide: UrlSerializer, useClass: CustomUrlSerializer },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
