var app = angular.module('app');

app.service('History', ['$http', function($http) {
  this.show = function(playerId, historyId) {
    return $http.get('/players/' + playerId + '/histories/' + historyId + '.json');
  };

  this.create = function(playerId, history) {
    return $http.post('/players/' + playerId + '/histories.json', {
      history: history
    });
  };

  this.update = function(playerId, history) {
    return $http.put('/players/' + playerId + '/histories/' + history.id + '.json', {
      history: history
    });
  };

  this.destroy = function(playerId, historyId) {
    return $http.delete('/players/' + playerId + '/histories/' + historyId + '.json');
  };

  this.search = function(playerId, query) {
    return $http.get('/players/' + playerId + '/histories/search.json', {
      params: {
        query: query
      }
    });
  };
}]);
