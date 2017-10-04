import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'results-component',
    templateUrl: 'results.component.html'
})

export class ResultsComponent implements OnInit {
    listOfResults: Array<MatchResult>;
    constructor() { }

    ngOnInit() {

    }
}

class MatchResult {
    Winner: string;
    Loser: String;
    GameDateTime: Date;
}
