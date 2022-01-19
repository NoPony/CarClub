import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';


import { HomeComponent } from './home/home.component';
import { ForumViewComponent } from './forum/forum-view/forum-view.component';
import { BoardViewComponent } from './forum/board-view/board-view.component';
import { PostViewComponent } from './forum/post-view/post-view.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent, pathMatch: 'full' },
  { path: 'verify/:verify', component: HomeComponent },

  { path: 'forum', component: ForumViewComponent },
  { path: 'board/:key', component: BoardViewComponent },
  { path: 'post/:key', component: PostViewComponent },

  { path: '**', redirectTo: 'home' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
