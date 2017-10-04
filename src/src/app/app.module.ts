import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes, RouterLink } from '@angular/router';

import { AppComponent } from './app.component';
import { HomeComponent } from '../HomeComponent/home.component';
import { PlayComponent } from '../PlayComponent/play.component';
import { ResultsComponent } from '../ResultsComponent/results.Component';
import { LeaderboardComponent } from '../LeaderboardComponent/Leaderboard.Component';
import { AddUserComponent } from '../AddUserComponent/adduser.component';

const appRoutes: Routes = [
  {
    path: 'home',
    component: HomeComponent
  },
  {
    path: 'play',
    component: PlayComponent
  },
  {
    path: 'results',
    component: ResultsComponent
  },
  {
    path: 'leaderboard',
    component: LeaderboardComponent
  },
  {
    path: 'add-user',
    component: AddUserComponent
  },
  { path: '',
    redirectTo: '/home',
    pathMatch: 'full'
  }
];

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    PlayComponent,
    ResultsComponent,
    LeaderboardComponent,
    AddUserComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(
      appRoutes
    )
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
