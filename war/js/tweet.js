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
	$scope.event = "";
	$scope.todoName = "";
	$scope.status = "";
	$scope.count=""; //count for event todo
	$scope.progress= "";
	$scope.prog="";
	$scope.isPersonal="";
	
	var p ="";

	
	$scope.tweetList = [];
	$scope.eventTodoList = [];
	

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
		this.loadEventTodos();
		this.loadTweet();
		
	};

	$scope.tweetClick = function() {
		$scope.errorDisplay = "";
		var tweetPromise = $http.get("list");
	    var keepGoing = true;
	    var jsonData = {
				content: $scope.content,
				type: $scope.type,
				itemCount: $scope.itemCount,
				createdDate: new Date()
		};

		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				$scope.tweetList = data.tweetList;
				for(var i=0 ; i < $scope.tweetList.length && keepGoing; i++){
					if ($scope.content == $scope.tweetList[i].content){
						keepGoing = false;
						//alert('Duplicate Entry');
					}
					else{
						keepGoing = true;
						
					}	
				}
				if(keepGoing){
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
				}
				else{
					alert('Todo is already on the list!');
				}
					
				
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
				content: document.getElementById(content+id).value,
				createdDate: createdDate
		};
		
	
		var tweetPromise = $http.post("update", jsonData);
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry updated successfully!');
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
	$scope.addEventTodoClick = function() {
		$scope.errorDisplay = "";
		
		var jsonData = {
				todoID : $scope.todoName,
				event : $scope.event,
				status : $scope.status,
				count : $scope.count
		};
		
		
		
		var todoEventPromise = $http.post("addtoevent", jsonData);
		todoEventPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry saved successfully!');
				$scope.loadEventTodos();
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		todoEventPromise.error(function(data, status, headers, config) {
			
		});
		
		
	};	
	$scope.loadEventTodos = function() {
		var tweetPromise = $http.get("listeventtask");
		
	    $scope.content = "";
	    
	    
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				$scope.eventTodoList = data.eventTodoList;
				
				
				
					
				$scope.progress = $scope.eventTodoList.length; //---------GET LIST COUNT
				$scope.prog = ($scope.progress + 40) + "%";
				$scope.events = true;
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		tweetPromise.error(function(data, status, headers, config) {});
		

	};

	
	
	
	$scope.updateEventTaskClick = function(id, status) {
		$scope.errorDisplay = "";
		
		var jsonData = {
				id: id,
				status: document.getElementById(status+id).value,
		
		};
		
		
		var todoEventPromise = $http.post("updateeventtodo", jsonData);
		todoEventPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry updated successfully!');
				$scope.loadEventTodos();
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		todoEventPromise.error(function(data, status, headers, config) {
			
		});
		
		
	};
	
	$scope.deleteEventTaskClick = function(id) {
		$scope.errorDisplay = "";
		
		var jsonData = {
				id: id
		};
		
	
		var todoEventPromise = $http.post("deleteeventtodo", jsonData);
		todoEventPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry deleted successfully!');
				$scope.loadEventTodos();
			} else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
		});
		todoEventPromise.error(function(data, status, headers, config) {
			
		});
	};
});
