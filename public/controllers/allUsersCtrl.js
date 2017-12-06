myApp.controller("allUsersCtrl", function($scope,$http,$location,localStorageService,$rootScope){
    if(window.localStorage['storageName'] == {}){
        $location.path("/");
    }

    $scope.uData = window.localStorage['storageName'];
    var userData = JSON.parse($scope.uData);
    $scope.username = userData.result.username; 
    $http.get($rootScope.serviceURL+"allcustomer").then(function(response) {
        $scope.allUser = response.data.result;
    });

    /*$scope.logout = function(){
        window.localStorage['storageName'] = {};
        $location.path("/");
    };
*/
    $scope.cont = function(data){ 
        window.localStorage['con'] = data.id;
        alert(window.localStorage['con']);
        if(data.edit)
        {
            data.edit=false;
            console.log(data);
            $http.post($rootScope.serviceURL+"editReg",data).then(function(res){
                console.log(res);
                var data = res.data;
                console.log(data.StatusCode);
                if(data.StatusCode == 200){
                }
            }  ,function (res) {
                console.log(res);
                
            })
        }
        else
            data.edit=true;

        //window.location.href="/#/allCategory";
        //$http.get($rootScope.serviceURL+"getAllRecords")
       /* $http.get("http://localhost:3016/getAllRecords")
        .then(function(response) {
            $scope.data = response.data.result;
        });
        alert($scope.data);
        window.location.href="/#!/allCategory";*/


    }
    $scope.logout = function(){
        swal({
            title: 'Are you sure?',
            text: "you wants to logout!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout it!'
        }).then(function (isConfirm) {
            if(isConfirm){
                window.localStorage['storageName'] = {};
                $location.path("/");
                window.location.reload();
            }    
        })
    }

    $scope.edit = function(data){
        alert("ooooooooooo");
        $scope.edit = data;
        alert($scope.edit.id);
        $http.get($rootScope.serviceURL+"getAllRecords")
        .then(function(response) {
        //alert("Amey "+id);
            $scope.allUser = response.data.result;
        //alert($scope.allUser);
        });
        //$location.path("/edit");
        //window.location.href="/#!/edit";
        window.location.href="/#/edit";
        /*swal({
            title: 'Are you sure?',
            text: "you wants to logout!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout it!'
        }).then(function (isConfirm) {
            if(isConfirm){
                window.localStorage['storageName'] = {};
                $location.path("/");
                window.location.reload();
            }    
        })*/
    }

    $scope.regUser = function(isValid){
        //alert("aaaaaa");
        //alert(formData.password);
        if(isValid){
        $http.post($rootScope.serviceURL+"addReg", $scope.formData).then(function(response){
            var data = response.data;
            if(data.StatusCode == 200){
                swal({   
                    title: "Success",   
                    text: data.ResponseMessage,   
                    type: "success",   
                    confirmButtonText: "Ok",
                }).then(function (isConfirm) {
                    window.location.reload();
                });
            } else {
                swal({   
                    title: "Error",   
                    text: data.ResponseMessage,   
                    type: "error",   
                    confirmButtonText: "Ok",
                }).then(function (isConfirm) {
                    window.location.reload();
                });
            }
        }).catch(function(error){
            console.log(error);
        });
        } else {
            $scope.submitted = true;
        }
    }


    $scope.delete = function(data){
        //alert("delete");
        $scope.edit = data;
        //alert($scope.edit.id);
        //$location.path("/edit");
        var id = $scope.edit.id
        console.log($scope.edit);
        swal({
            title: 'Are you sure?',
            text: "you wants to logout!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout it!'
        }).then(function (isConfirm) {
            if(isConfirm){
                console.log($scope.edit);
                $http.delete($rootScope.serviceURL+"deleteReord?id="+id)
                .then(function(response){
                //$scope.parkingData.splice(index, 1);
                var data = response.data;
                    if(data.Status == "Success"){
                        swal({
                            title: 'Deleted!',
                            text: 'Your record has been deleted.',
                            type: 'success',
                            confirmButtonText: "Ok",
                        }).then(function (isConfirm) {
                            window.location.reload();
                        });
                    } else {
                        swal({   
                            title: "Error",   
                            text: "Error in Deleting record.",   
                            type: "error",   
                            confirmButtonText: "Ok",
                        }).then(function (isConfirm) {
                            window.location.reload();
                        });
                    }
                }).catch(function(error){
                    console.log(error);
                });
            } 
            else{
                //alert("elsepart")
            }   
        })
    }
});