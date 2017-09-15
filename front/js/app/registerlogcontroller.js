(function() {
'use strict';

	angular.module('LogRegister').controller('RegisterLogController', ['RESTService', RegisterLogController]);

	function RegisterLogController(RESTService) {
		var vm = this;

		vm.log = {};

		vm.day = 0;
		vm.month = 0;
		vm.year = 0;

		vm.registerRequest = function(log) {
			RESTService.registerLog(log);
		};

		vm.getNumberOfDays = function() {
			return Array(31);
		};

		vm.getNumberOfMonths = function() {
			return Array(12);
		};

		vm.getNumberOfYears = function() {
			return Array(100);
		};

		vm.getNumberOfHours = function() {
			return Array(24);
		};

		vm.getNumberOfMinutes = function() {
			return Array(60);
		}

		vm.registerLog = function(log) {
			log.day = vm.day + "/" + vm.month + "/" + vm.year
			RESTService.registerLog(log);
		}



	};
})();