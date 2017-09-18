(function() {
'use strict';

	angular.module('LogRegister').controller('ContextSearchController', ['RESTService', RegisterLogController]);

	function RegisterLogController(RESTService) {
		var vm = this;

		vm.context = "";
		vm.metrics = {};
		vm.logs = [];

		vm.metrics.logs_per_hour = 0;
		vm.metrics.most_logs = 0;
		vm.metrics.least_logs = 0;

		vm.searchContext = function(context) {
			var logsPromise = RESTService.searchContext(context);

			logsPromise.then(function(response) {
				response = response.data;
				vm.logs = response.data;
			});

			var logsPerHourPromise = RESTService.getLogsPerHour(context);
			logsPerHourPromise.then(function(response) {
				vm.metrics.logs_per_hour = response.data.data;
			});

			var hourWithMostLogsPromise = RESTService.getHourWithMostLogs(context);
			hourWithMostLogsPromise.then(function(response) {
				vm.metrics.most_logs = response.data.data;
			});

			var hourWithLeastLogsPromise = RESTService.getHourWithLeastLogs(context);
			hourWithLeastLogsPromise.then(function(response) {
				vm.metrics.least_logs = response.data.data;
			});
		}

	};
})();