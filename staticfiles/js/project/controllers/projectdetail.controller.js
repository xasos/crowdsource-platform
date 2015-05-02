/**
 * Created by milad on 5/1/15.
 */



(function () {
  'use strict';

  angular
    .module('crowdsource.project.controllers')
    .controller('ProjectDetailController', ProjectDetailController);

  ProjectDetailController.$inject = ['$scope','$http','$routeParams'];

  /**
  * @namespace ProjectDetailController
  */
  function ProjectDetailController($scope,$http,$routeParams) {
    var vm = this;
    var rp = $routeParams.ProjectID;
    $http.get('/api-auth/v1/project/own/?projectid='+rp).success(function(data, config){
        $scope.myproject=data[0];
    });


  }


})();