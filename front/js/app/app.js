angular.module('LogRegister', ['ui.router'])
.config(function($stateProvider, $locationProvider, $urlRouterProvider, $httpProvider) {

	$httpProvider.defaults.xsrfCookieName = 'csrftoken';
	$httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';	

	$stateProvider
	.state('register-log', {
		url: '/',
		templateUrl: 'partials/register-log.html',
		controller: 'RegisterLogController as vm'
	});

	$locationProvider.html5Mode({ enabled: true, requireBase: false });

	$urlRouterProvider.otherwise('/');


});