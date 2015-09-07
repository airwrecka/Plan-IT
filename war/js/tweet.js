var deleteTweet = function(formID) {
	document[formID].action = "delete";
	document[formID].submit();
}

var module = angular.module("sampleApp",[]);
var controller = module.controller("sampleController", function($scope, $http) {
	$scope.errorDisplay = "";
	$scope.content = "";
	$scope.itemCount = "";
	$scope.type = "";
	
	$scope.tweetList = [];

	$scope.loadTweet = function() {
		var tweetPromise = $http.get("list");
	    $scope.content = "";
	    
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				$scope.tweetList = data.tweetList;
				$scope.tweets = true;
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		tweetPromise.error(function(data, status, headers, config) {

		});
	};

	$scope.init = function () {
		this.loadTweet();
	};

	$scope.tweetClick = function() {
		$scope.errorDisplay = "";
		
		var jsonData = {
				content: $scope.content,
				type: $scope.type,
				itemCount: $scope.itemCount,
				createdDate: new Date()
		};
		
		var tweetPromise = $http.post("insert", jsonData);
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry saved successfully!');
				$scope.loadTweet();
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		tweetPromise.error(function(data, status, headers, config) {
			
		});
	};
	
	$scope.updateClick = function(id, content, createdDate) {
		$scope.errorDisplay = "";
		
		var jsonData = {
				id: id,
				content: document.getElementById(content + id).value,
				createdDate: createdDate
		};
		
		//TODO: Code ajax call for updating tweet, use the tweetClick function as guide.
		
		var tweetPromise = $http.get("update", jsonData);
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry saved successfully!');
				$scope.loadTweet();
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		tweetPromise.error(function(data, status, headers, config) {
			
		});
		
		
	};
	
	$scope.deleteClick = function(id) {
		$scope.errorDisplay = "";
		
		var jsonData = {
				id: id
		};
		
		//TODO: Code ajax call for deleting tweet, use the tweetClick function as guide.
		
		var tweetPromise = $http.post("delete", jsonData);
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry deleted successfully!');
				$scope.loadTweet();
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		tweetPromise.error(function(data, status, headers, config) {
			
		});
	};
	
});