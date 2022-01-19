import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { UrlSerializer } from '@angular/router';

import { MatSidenavModule } from '@angular/material/sidenav';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';

import { ContentTypeInterceptor } from 'src/app/common/interceptor/content-type/content-type.interceptor';
import { JwtInterceptor } from 'src/app/common/interceptor/jwt/jwt.interceptor';
import { ErrorInterceptor } from 'src/app/common/interceptor/error/error.interceptor';

import { AppRoutingModule } from './app-routing.module';
import { CustomUrlSerializer } from './custom-url-serializer';
import { AppComponent } from './app.component';

import { NavigationModule } from './navigation/navigation.module';
import { HeaderModule } from './header/header.module';
import { FooterModule } from './footer/footer.module';
import { HomeModule } from './home/home.module';
import { AuthModule } from './auth/auth.module';
import { ForumModule } from './forum/forum.module';
import { EventsModule } from './events/events.module';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FlexLayoutModule,
    HttpClientModule,

    MatSidenavModule,
    MatButtonModule,
    MatIconModule,

    AppRoutingModule,

    NavigationModule,
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
