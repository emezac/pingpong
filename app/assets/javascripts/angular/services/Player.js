var app = angular.module('app');

app.service('Player', ['$http', function($http) {
  var base_url = '/players'

  this.index = function() {
    return $http.get(base_url + '.json');
  };

  this.show = function(playerId) {
    return $http.get(base_url + '/' +  playerId  + '.json')
  };

  this.destroy = function(playerId) {
    return $http.delete(base_url + '/' + playerId + '.json')
  };

  this.create = function(player) {
    return $http.post(base_url + '.json', {
      player: player
    });
  };

  this.update = function(player) {
    return $http.put(base_url + '/' + player.id + '.json', {
      player: player
    });
  };

  this.search = function(query) {
    return $http.get(base_url + '/search.json', {
      params: {
        query: query
      }
    });
  };
}]);
