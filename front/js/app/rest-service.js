(function(){
'use strict';
	angular.module('LogRegister').service('RESTService',function($http) {

		var API_PATH = 'http://localhost:3000/api/v1/';

		var registerLog = function(log) {
			$http.post(API_PATH + 'logs/', log);
		};

		var searchContext = function(context) {
			return $http.get(API_PATH + 'context/' + context);
		};

		var getLogsPerHour = function(context) {
			return $http.get(API_PATH + 'context/' + context + '/metrics/averagePerHour/');
		};

		var getHourWithMostLogs = function(context) {
			return $http.get(API_PATH + 'context/' + context + '/metrics/hourWithMostLogs/');
		};

		var getHourWithLeastLogs = function(context) {
			return $http.get(API_PATH + 'context/' + context + '/metrics/hourWithLeastLogs/');
		};

		var service = {
			registerLog: registerLog,
			searchContext: searchContext,
			getLogsPerHour: getLogsPerHour,
			getHourWithMostLogs: getHourWithMostLogs,
			getHourWithLeastLogs: getHourWithLeastLogs,
		};

		return service;

	});



})();