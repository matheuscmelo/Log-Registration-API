(function(){
'use strict';
	angular.module('LogRegister').service('RESTService',function($http) {

		var API_PATH = 'http://localhost:3000/api/v1/';

		var registerLog = function(log) {
			$http.post(API_PATH + 'logs/', log).then(function(response) {
				console.log(response.data);
			}, function(error) {
				console.log(error);
			});
		};


		var service = {
			registerLog: registerLog,
		};

		return service;

	});



})();