import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BoardComponent } from './board/board.component';
import { ForumComponent } from './forum/forum.component';

import { HomeComponent } from './home/home.component';
import { PostComponent } from './post/post.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent, pathMatch: 'full' },
  { path: 'verify/:verify', component: HomeComponent },

  { path: 'forum', component: ForumComponent },
  { path: 'board/:key', component: BoardComponent },
  { path: 'post/:key', component: PostComponent },

  { path: '**', redirectTo: 'home' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
