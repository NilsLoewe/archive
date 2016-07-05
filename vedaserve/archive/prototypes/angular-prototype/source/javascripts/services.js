'use strict';

/* Services */


// Demonstrate how to register services
// In this case it is a simple value service.
angular.module('myApp.services', []).
  service('cards', function () {
    this.cards = {
      constraints: [],
      choices: [],
      knowledge:  [],
      sources: []
    };

    this.addNote = function (category, note) {
      this.cards[category].push(note);
      this.storeAll();
    };

    this.removeNote = function (category, index) {
      this.cards[category].splice(index, 1);
      this.storeAll();
    };

    this.storeAll = function () {
      localStorage.setItem('lists', JSON.stringify(this.cards));
    };

    this.removeEverything = function () {
      localStorage.clear();
      // TODO the use of "this" here is unfortunate, because "this"
      // changes when this function is called. Find a better possibility!
      this.loadData();
    };

    this.loadData = function () {
      var data = {};
      if (localStorage.getItem('lists')) {
        data = JSON.parse(localStorage['lists']);
      }
      this.cards.constraints = data['constraints'] || ["In Altona"];
      this.cards.choices     = data['choices']     || ["Muss teuer sein"];
      this.cards.knowledge   = data['knowledge']   || ["Starbucks ist teuer"];
      this.cards.sources     = data['sources']     || ["google", "bing", "statista"];
    };

    this.loadData();
  });
