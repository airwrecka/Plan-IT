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
	$scope.progSchool = 0;
	$scope.progWork = 0;
	$scope.progPersonal = 0;
	//------
	$scope.isLessPersonal ="";
	$scope.isLessSchool ="";
	$scope.isLessWork ="";
	
	
	var p ="";

	
	$scope.tweetList = [];
	$scope.eventTodoList = [];
	$scope.eventPersonal =[];
	$scope.eventWork =[];
	$scope.eventSchool =[];
	
	
	/*
	* LIST TODOS
	*/
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
	
	//----------------------------------------------------------------------------------
	
	/*
	 * 		INITTIALIZATION
	 * */
	$scope.init = function () {
		this.loadEventTodos();
		this.loadTweet();
		this.numberOfPersonal();
		this.numberOfWork();
		this.numberOfSchool();
		
	};
	
	//----------------------------------------------------------------------------------
	
	/*
	 * INSERT NEW TODO
	 * */

	$scope.tweetClick = function() {
		$scope.errorDisplay = "";
		var tweetPromise = $http.get("list");
	    var keepGoing = true;
	    var jsonData = {
				content: $scope.content,
				type: $scope.type,
				itemCount: 0,
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
	
	
	//----------------------------------------------------------------------------------
	
	/*
	 * UPDATE TODO
	 * */
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
	
	
	//----------------------------------------------------------------------------------
	
	/*
	 * DELETE TODO
	 * */
	$scope.deleteClick = function(id, content) {
		$scope.errorDisplay = "";
		var eventTodoPromise = $http.get("listeventtask");
		var keepGoing = true;
		var contentTodo = document.getElementById(content+id).value;
		var jsonData = {
				id: id,
				
		};
		
	
		
		eventTodoPromise.success(function (data, status, headers, config){
			if(data.errorList.length == 0){
				$scope.eventTodoList = data.eventTodoList;
				for(var i=0 ; i < $scope.eventTodoList.length && keepGoing; i++){
					if ($scope.eventTodoList[i].todoID ==contentTodo){
						keepGoing = false;
						
					}
					else{
						keepGoing = true;
						
						
					}	
				}
			if(keepGoing){
				
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
				
			}	
			else{
				alert('Cannot delete todo. Remove selected Todo from Events first');
			}
				
				
			}else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
			
		});
		
	
		eventTodoPromise.error(function(data, status, headers, config) {
			
		});
	};
	
	
	//----------------------------------------------------------------------------------
	
	/*
	 * ADD TODO IN EVENT
	 **/
	 
	$scope.addEventTodoClick = function() {
		$scope.errorDisplay = "";
		var eventTodoPromise = $http.get("listeventtask");
	    var keepGoing = true;
		var jsonData = {
				todoID : $scope.todoName,
				event : $scope.event,
				status : 0,
				count : $scope.count
		};
		eventTodoPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				$scope.eventTodoList = data.eventTodoList;
				for(var i=0 ; i < $scope.eventTodoList.length && keepGoing; i++){
					if ($scope.todoName == $scope.eventTodoList[i].todoID && $scope.event == $scope.eventTodoList[i].eventName){
						keepGoing = false;
						//alert('Duplicate Entry');
					}
					else{
						keepGoing = true;
						
					}	
				}
				if(keepGoing){
					var eventTodoPromise = $http.post("addtoevent", jsonData);
					eventTodoPromise.success(function(data, status, headers, config) {
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

		eventTodoPromise.error(function(data, status, headers, config) {
			
		});
	};
	
	
	//----------------------------------------------------------------------------------
	/*
	 * DISPLAY EVENT TODO LIST
	 * */
	$scope.loadEventTodos = function() {
		var tweetPromise = $http.get("listeventtask");
		
	    $scope.content = "";
	    
	    
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				
				$scope.eventTodoList = data.eventTodoList;
		
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
	//----------------------------------------------------------------------------------
	
	/*
	 * UPDATE TODO IN EVENT
	 * */
	
	$scope.updateEventTaskClick = function(id, status) {
		$scope.errorDisplay = "";
		
		var jsonData = {
				id: id,
				status: document.getElementById(status+id).value
		
		};

		
		var tweetPromise = $http.post("updateeventtodo", jsonData);
		tweetPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0) {
				alert('Entry updated successfully!');
				$scope.loadEventTodos();
				$scope.numberOfPersonal();
				$scope.numberOfWork();
				$scope.numberOfSchool();
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
	//----------------------------------------------------------------------------------
	
	/*
	 * DELETE TODO IN EVENT
	 * */
		$scope.deleteEventTaskClick = function(id,event) {
		$scope.errorDisplay = "";
		
		var eventTodoPromise = "";
		var keepGoing = true;
	
		var jsonData = {
				id: id,
				event: event
		};
		
		
		if (jsonData.event == "Personal"){
			eventTodoPromise = $http.get("listpersonal");
		}
		else if (jsonData.event == "School"){
			eventTodoPromise = $http.get("listschool");
		}
		else if (jsonData.event == "Work"){
			eventTodoPromise = $http.get("listwork");
		}
		
		eventTodoPromise.success(function (data, status, headers, config){
			if(data.errorList.length == 0){
				
				$scope.eventTodoList = data.eventTodoList;
			
					if ($scope.eventTodoList.length == 2){
						alert('Todo cannot be deleted. Minimum of 2 Todos per event');
						$scope.loadEventTodos();
								
					}
					else{
							
					var todoEventPromise = $http.post("deleteeventtodo", jsonData);
					todoEventPromise.success(function(data, status, headers, config) {
						if(data.errorList.length == 0) {
						
						alert('Entry deleted successfully!');
								$scope.loadEventTodos();
								$scope.numberOfPersonal();
								$scope.numberOfWork();
								$scope.numberOfSchool();
							
						} else {
							var msg = "";
							for (var i = 0; i < data.errorList.length; i++)
								msg += data.errorList[i] + "\n";
							$scope.errorDisplay = msg;
						}
					});
						
					}	
			
	
				
			}
			else {
				var msg = "";
				for (var i = 0; i < data.errorList.length; i++)
					msg += data.errorList[i] + "\n";
				$scope.errorDisplay = msg;
			}
			
			
			
		});
	
		
		eventTodoPromise.error(function(data, status, headers, config) {
			
		});
	};
	
	//-------------------------------------------------------------------------
	
	/*
	 * FUNCTIONS FOR PROGRESS COMPUTATIONS
	 * */
	$scope.numberOfPersonal = function() {
		$scope.errorDisplay = "";
		var todoEventPromise = $http.get("listpersonal");
		todoEventPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0  && data.eventTodoList.length != 0) {
				var sum = 0;
				$scope.eventPersonal = data.eventTodoList;
				for (var i =0 ; i < $scope.eventPersonal.length ; i++){
					sum += $scope.eventPersonal[i].status ;
				}
				$scope.progPersonal = sum / $scope.eventPersonal.length
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
	$scope.numberOfSchool = function() {
		$scope.errorDisplay = "";
		var todoEventPromise = $http.get("listschool");
		todoEventPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0  && data.eventTodoList.length != 0) {
				var sum = 0;
				$scope.eventSchool = data.eventTodoList;
				for (var i =0 ; i < $scope.eventSchool.length ; i++){
					sum += $scope.eventSchool[i].status ;
				}
				$scope.progSchool = sum / $scope.eventSchool.length
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
	$scope.numberOfWork = function() {
		$scope.errorDisplay = "";
		var todoEventPromise = $http.get("listwork");
		todoEventPromise.success(function(data, status, headers, config) {
			if(data.errorList.length == 0 && data.eventTodoList.length != 0) {
				var sum = 0;
				$scope.eventWork = data.eventTodoList;
				for (var i =0 ; i < $scope.eventWork.length ; i++){
					sum += $scope.eventWork[i].status ;
				}
				$scope.progWork = sum / $scope.eventWork.length
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
	
	//-----------------------------------------------------------------------
	
	
});
