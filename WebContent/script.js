var testApp = angular.module('testApp', ['ngMaterial']);
testApp.controller('MainCtrl' , function ($scope, $http) {
	 var self = this;
     self.readonly = false;
    $scope.home = "This is the homepage";
    
    $scope.getApiData = function (enteredValue) {
        console.log("I've been pressed!");  
        $http.get("https://api.myjson.com/bins/1eenc7")
            .then(function successCallback(response){
                $scope.response = response.data.catgeories;
                console.log($scope.response);
                $scope.results = [];
                angular.forEach($scope.response, function(value, key) {
                	//console.log("Id: " + value.id);
                    if (enteredValue===value.name) {
                        console.log("I Found something...");
                        console.log("Id: " + value.id);
                        console.log("Name: " + value.name);
                        $scope.results.push({Id:value.id,Name:value.name,Type:value.type});
                    }

                });
            }, function errorCallback(response){
                console.log("Unable to perform get request");
            });
        
    }
    $scope.IsHidden = true;
    $scope.ShowHide = function () {
    	$http.get('https://api.myjson.com/bins/1eenc7').success(function(response) {
        	$scope.GetApiData = response.catgeories;
            console.log(response);
        	}).error(function(data, status) {
           console.log(status);
        });
        //If DIV is hidden it will be visible and vice versa.
    	
        $scope.IsHidden = $scope.IsHidden ? false : true;
    }
    self.itemIds=[];
    self.finalList=[];
   // $scope.isChecked = false;
    $scope.setcheckbox=function(list,active,idx){
    	//$scope.active = true;
    	if(active){
    		self.itemIds.push(list.name);
    		//$scope.isChecked = false;
    	}else{
    		self.itemIds.splice(self.itemIds.indexOf(list.name),1);
    	}
    };
    $scope.hide=true;
    $scope.submitfunction= function(item,price,amount,num) {
    	self.itemIds.push(price);
    	self.itemIds.push(amount);
    	self.itemIds.push(num);
    	$scope.payload = [];

    	$scope.payload.push("price", price);
    	$scope.payload.push('amount', amount);
    	$scope.payload.push('num', num);
    	$scope.payload.push('itemIds', item);
        $scope.homeJson=angular.toJson($scope.payload);
		var res=$http.post('http://localhost:8080/SearchFilter/check.json',$scope.homeJson);
		res.success(function(data, status, headers,config) {
			$scope.response = data;
			console.log($scope.response);
		})
		res.error(function(data, status, headers,config) {
			console.log('error');
		});
		
		$scope.hide = $scope.hide ? false : true;
	}
});
