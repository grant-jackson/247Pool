import { Component, OnInit } from '@angular/core';

const LEADERS = [
    { score: 150, name: 'Superman' },
    { score: 125, name: 'Batman' },
    { score: 105, name: 'BatGirl' },
    { score: 103, name: 'Robin' },
    { score: 100, name: 'Flash' }
];

@Component({
    selector: 'leaderboard-component',
    templateUrl: 'leaderboard.component.html'
})

export class LeaderboardComponent implements OnInit {

    constructor() { }
    leaders = LEADERS;
    ngOnInit() { }
}