myApp.controller("allBooksPage",function($scope,localStorageService,$location){
    if(window.localStorage['storageName'] == {}){
        $location.path("/");
    }
    $scope.uData = window.localStorage['storageName'];
    var userData = JSON.parse($scope.uData);
    $scope.username = userData.result.username;  
    
})



myApp.config(function($routeProvider){
	$routeProvider.when("/",{
		templateUrl:"templates/login.html",
        controller:"loginCtrl"
		//controller:"AppCtrl"
		//controllerAs:"myC"
	})
    $routeProvider.when("/allUsers",{
        templateUrl:"templates/allUsers.html",
        controller:"allUsersCtrl"
        //controllerAs:"myC"
    })
    $routeProvider.when("/edit",{
        templateUrl:"templates/edit.html",
        //controller:"editCtrl"
        //controllerAs:"myC"
    })
    $routeProvider.when("/AddReg",{
        templateUrl:"templates/AddReg.html",
        controller:"allUsersCtrl"
        //controller:"editCtrl"
        //controllerAs:"myC"
    })
    $routeProvider.when("/AddAdmin",{
        templateUrl:"templates/AddAdmin.html",
        controller:"allUsersCtrl"
        //controller:"editCtrl"
        //controllerAs:"myC"
    })

});

