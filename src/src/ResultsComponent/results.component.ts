import { Component, OnInit } from '@angular/core';
import { MatchResult } from '../Models/MatchResult';

@Component({
    selector: 'results-component',
    templateUrl: 'results.component.html'
})

export class ResultsComponent implements OnInit {
    listOfResults: Array<MatchResult>;
    constructor() { }

    ngOnInit() {
        //get match results;
    }
}
