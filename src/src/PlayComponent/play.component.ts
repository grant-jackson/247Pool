import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'play-component',
    templateUrl: 'play.component.html'
})

export class PlayComponent implements OnInit {
    player1: String = 'Select Player One';
    player2: String = 'Select Player Two';
    listOfPlayers: Array<String> = ['Grant', 'Gareth', 'Paul'];

    constructor() {
    }

    ngOnInit() {
        // GetPlayers
        // listOfPLayers = playerService.getPLayers();
    }
}
