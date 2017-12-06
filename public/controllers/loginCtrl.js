myApp.controller("loginCtrl", function($scope,$http,$location,localStorageService,$rootScope){
    //window.alert($rootScope.serviceURL);
    $scope.signInUser = function(isValid){
        if(isValid){
            $http.post($rootScope.serviceURL+"Login", $scope.formData)
            .then(function(response){
                var data = response.data;
                console.log(data);
                if(data.StatusCode == 200){
                    //alert(data.result.userType);
                    window.localStorage['storageName'] = angular.toJson(data);
                    $scope.uData = window.localStorage['storageName'];
                    var userData = JSON.parse($scope.uData);
                    $scope.username = userData.result.username; 
                    swal({   
                        title: "Success",   
                        text: "Welcome"+$scope.username,   
                        type: "success",   
                        confirmButtonText: "Ok"
                    });
                    $location.path("allUsers"); 
                } else {
                    swal({   
                        title: "Error",   
                        text: "Invalid email or password.",   
                        type: "error",   
                        confirmButtonText: "Ok"
                    });
                }
            }).catch(function(error){
                console.log(error);
            });
        } else {
            $scope.submitted = true;
        }
    }

});