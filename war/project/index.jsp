<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="sampleApp"  >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Plan IT</title>
<link rel="stylesheet" type="text/css" href="/css/global.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Project</title>

<!-- CSS / STYLESHEETS -->
<link href="../SemanticUI/dist/semantic.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../calendar/css/style.css">

<!-- JS / JQUERY -->

<script type="text/javascript" src="/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="/js/angular.js"></script>
	<script type="text/javascript"src="/js/tweet.js"></script>
	<script type="text/javascript"src="/js/blur.js"></script>
	<script type="text/javascript"src="/js/semantic.js"></script>
<script type="text/javascript">

	 
	
	$(document).ready(function(){
		$('.menu .item').tab();
	//----------------SIDEBAR----------------//
	
		$('.ui.checkbox').checkbox();
	
				
		
		$('#menuDiv').blurjs({
			source: 'body',
			overlay: 'rgba(0,100,100,0.1)'
		});
		
	});
	$('.item').click(function(){ 
		$('.active').removeClass('active item');
		$(this).addClass('active item');
	});
	
	

	
</script>
 
</head>



<body  ng-controller="sampleController" data-ng-init="init()">
<link rel="stylesheet/less" type="text/css" href="../SemanticUI/src/definitions/collections/menu.less" />

<div >
<div class ="ui grid" >
	<div class="two column row">
		<div class="four wide left floated column">
		<div class="fixed left floated header segment" >
	  		<div class="container" >
	    		<div class="introduction" >
	      			<div style="padding:0em 0em 0em 8em" >
	     				 <h1>   </h1>
	      				 <img src="../pics/planit1_300px.png">
	      			</div>    
	      		</div>
	      </div>
	      
	      
		</div>	
	</div>
	
	
	</div>
	<div class="ui divider"></div>
</div>
<div class ="ui two column centered grid" id="bg">			
	<div class="four wide left floated column" style="padding:0em 0em 0em 7em; "  id="menuDiv">		

		
		<!-- EVENTS / TODOS MENU -->
	<!-- EVENTS / TODOS MENU -->
		<div class="ui vertical menu">
		  <div class="item">
		    <div class="header">EVENTS</div>
				<div class="menu">
					<a class="red item" data-tab="personal" id="per"><i class="circle icon"></i> Personal</a>
					<a class="blue item" data-tab="school" ><i class="circle icon"></i> School related</a>
					<a class="green item"  data-tab="work" ><i class="circle icon"></i> Work</a>
				</div>
		  </div>
		  
		    <div class="item">
		    <div class="header">TODOS</div>
				<div class="menu">
						<!-- <a class="red item" data-tab="all" id="all"><i class="folder open icon"></i> All</a> -->
						<a class="blue item" data-tab="item"><i class="list layout icon"></i> Item</a>
						<a class="green item" data-tab="action" ><i class="list layout icon"></i> Action</a>
				</div>
		  </div>
		
		
		
		
		
			 </div>
		</div>

		<!-- MENU CONTENT, EVENTS -->
		<div class="twelve wide column" style="padding:0em 12em 0em 3em">
		 					
					
			<!-- PERSONAL EVENT -->
			
					<div class="ui right attached tab segment" data-tab="personal">
					
				<!-- DISPLAY TODOS in EVENTS 			-->
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchTodo" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
				    	
				    	<br/>
				    	
				    	
				    	<!-- PROGRESS BAR -->
				    	<br/>
				    	<label><b><em>PROGRESS</em></b></label>
				    	<div class="ui red progress" data-percent="{{progPersonal}}">
					    <div class="bar" style="transition-duration: 300ms; width: {{progPersonal}}%;">
					      <div class="progress">{{progPersonal}}%</div>
					    </div>
					  </div>
			    	</div>
					<!--END OF PROGRESS BAR-->
					
						<table class="ui blue table" >
						<thead>
					    	<tr>
					    		<th> Event Name</th>
					    		<th> Todo </th>
					    		<th> Status </th>
					    		<th></th>
					    		<th></th>
					    	</tr>
					    </thead>
							<tbody >
								<tr ng-show="filtery.length!=0"  ng-repeat="item in filtery = (eventTodoList | filter:{eventName:'Personal'} |filter:searchTodo)" ng-show="events">
									<td>
									{{item.eventName}}
									</td>
									
									<td>
									{{item.todoID}}
									</td>
								
									<td>  
										<select ng-model="type" class="ui fluid dropdown" id="status_{{item.id}}" value="{{item.status}}">
											<option  value="" disabled default selected class="display-none">{{item.status}}%</option>
											<option ${f:select("status", "0")}>0%</option>
											<option ${f:select("status", "10")}>10%</option>
											<option ${f:select("status", "20")}>20%</option>
											<option ${f:select("status", "30")}>30%</option>
											<option ${f:select("status", "40")}>40%</option>
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "60")}>60%</option>
											<option ${f:select("status", "70")}>70%</option>
											<option ${f:select("status", "80")}>80%</option>
											<option ${f:select("status", "90")}>90%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id, item.eventName)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
									</td>
								</tr>
								<tr>
									<td ng-show="!filtery.length">
										No Results Found.
									</td>
								</tr>
							</tbody>
							
						</table>
							<div class="tiny labeled icon ui green button" id="addeventtodo">
							  <i class="plus icon"></i>
							  Add Todo
							</div>
					
							
						</div>
					</div>
			
					
					<!-- SCHOOL RELATED EVENT -->
					
					<div class="ui right attached tab segment" data-tab="school">
					
				<!-- DISPLAY TODOS in EVENTS 			-->
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchTodo" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
				    	
				    	<br/>
				    	
				    	
				    	<!-- PROGRESS BAR -->
				    	<br/>
				    	<label><b><em>PROGRESS</em></b></label>
				    	<div class="ui blue progress" data-percent="{{progSchool}}">
					    <div class="bar" style="transition-duration: 300ms; width: {{progSchool}}%;">
					      <div class="progress">{{progSchool}}%</div>
					    </div>
					  </div>
			    	</div>
					<!--END OF PROGRESS BAR-->
					
						<table class="ui blue table" >
						<thead>
					    	<tr>
					    		<th> Event Name</th>
					    		<th> Todo </th>
					    		<th> Status </th>
					    		<th></th>
					    		<th></th>
					    	</tr>
					    </thead>
							<tbody >
								<tr ng-show="filtery.length!=0"  ng-repeat="item in filtery = (eventTodoList | filter:{eventName:'School'} |filter:searchTodo)" ng-show="events">
									<td>
									{{item.eventName}}
									</td>
									
									<td>
									{{item.todoID}}
									</td>
								
									<td>  
										<select ng-model="type" class="ui fluid dropdown" id="status_{{item.id}}" value="{{item.status}}">
											<option  value="" disabled default selected class="display-none">{{item.status}}%</option>
											<option ${f:select("status", "0")}>0%</option>
											<option ${f:select("status", "10")}>10%</option>
											<option ${f:select("status", "20")}>20%</option>
											<option ${f:select("status", "30")}>30%</option>
											<option ${f:select("status", "40")}>40%</option>
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "60")}>60%</option>
											<option ${f:select("status", "70")}>70%</option>
											<option ${f:select("status", "80")}>80%</option>
											<option ${f:select("status", "90")}>90%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id, item.eventName)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
									</td>
								</tr>
								<tr>
									<td ng-show="!filtery.length">
										No Results Found.
									</td>
								</tr>
							</tbody>
							
						</table>
							<div class="tiny labeled icon ui green button" id="addeventtodo">
							  <i class="plus icon"></i>
							  Add Todo
							</div>
					
							
						</div>
					</div>
					
					<!-- WORK EVENT -->
					<div class="ui right attached tab segment" data-tab="work">
					
				<!-- DISPLAY TODOS in EVENTS 			-->
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchTodo" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
				    	
				    	<br/>
				    	
				    	
				    	<!-- PROGRESS BAR -->
				    	<br/>
				    	<label><b><em>PROGRESS</em></b></label>
				    	<div class="ui green progress" data-percent="{{progWork}}">
					    <div class="bar" style="transition-duration: 300ms; width: {{progWork}}%;">
					      <div class="progress">{{progWork}}%</div>
					    </div>
					  </div>
			    	</div>
					<!--END OF PROGRESS BAR-->
					
						<table class="ui blue table" >
						<thead>
					    	<tr>
					    		<th> Event Name</th>
					    		<th> Todo </th>
					    		<th> Status </th>
					    		<th></th>
					    		<th></th>
					    	</tr>
					    </thead>
							<tbody >
								<tr ng-show="filtery.length!=0"  ng-repeat="item in filtery = (eventTodoList | filter:{eventName:'Work'} |filter:searchTodo)" ng-show="events">
									<td>
									{{item.eventName}}
									</td>
									
									<td>
									{{item.todoID}}
									</td>
								
									<td>  
										<select ng-model="type" class="ui fluid dropdown" id="status_{{item.id}}" value="{{item.status}}">
											<option  value="" disabled default selected class="display-none">{{item.status}}%</option>
											<option ${f:select("status", "0")}>0%</option>
											<option ${f:select("status", "10")}>10%</option>
											<option ${f:select("status", "20")}>20%</option>
											<option ${f:select("status", "30")}>30%</option>
											<option ${f:select("status", "40")}>40%</option>
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "60")}>60%</option>
											<option ${f:select("status", "70")}>70%</option>
											<option ${f:select("status", "80")}>80%</option>
											<option ${f:select("status", "90")}>90%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id, item.eventName)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
									</td>
								</tr>
								<tr>
									<td ng-show="!filtery.length">
										No Results Found.
									</td>
								</tr>
							</tbody>
							
						</table>
							<div class="tiny labeled icon ui green button" id="addeventtodo">
							  <i class="plus icon"></i>
							  Add Todo
							</div>
					
							
						</div>
					</div>
					
					
			<!-- END OF EVENTS MENU CONTENT -->
			
			
			<!-- MENU CONTENT, TODOS -->
			
				<!-- DEFAULT, TODO -->
		
	
			
				<!-- ALL, TODO 
					<div class="ui right attached tab segment" data-tab="all">
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchRes" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
				    	
			    	</div>
				<form class="ui form">
				<table class="ui blue table">
									 
					<tbody >
					    <thead>
					    	<tr>
					    		<th> TODO Description</th>
					    		<th> Type </th>
					    		<th></th>
					    		<th></th>
					    	</tr>
					    </thead>
						<tr ng-show="filtery.length!=0"  ng-repeat="item in filtery = (tweetList |filter:searchRes)" ng-show="tweets">
									
						    <td>
							     <div class="ui input">
							     <input type="text" id="content_{{item.id}}" value="{{item.content}}" required>
							     <input type="hidden" value="{{item.createdDate}}"> 
							     </div>
							 </td>
							 <td>
							 {{item.type}}
							 </td>
							 <td>
								<button class="tiny labeled icon ui green button" ng-click="updateClick(item.id, 'content_', item.createdDate)">
									<i class="add circle icon"></i>
										Update
								</button>
							</td>
							<td>
								<button class="tiny labeled icon ui red button" ng-click="deleteClick(item.id, 'content_')">
									<i class="remove circle icon"></i>
										Delete
								</button>
							</td>
					    </tr>
						<tr>
									<td ng-show="!filtery.length">
										No Results Found.
									</td>
								</tr>
				  </tbody>
				</table>
				</form>
					
						</div>
					</div>
					-->
					
				<!-- ITEM, TODO -->
				<div class="ui right attached tab segment" data-tab="item">
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchRes" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
						
						<div class="item">
							<div class="medium labeled icon ui blue button" id="addTodo">
							  <i class="plus icon"></i>

							  Add Todo
							</div>
						</div>
				    	
			    	</div>
				<form class="ui form">
				<table class="ui blue table">
									 
					<tbody >
					    <thead>
					    	<tr>
					    		<th> TODO Description</th>
					    		<th> Type </th>
					    		<th></th>
					    		<th></th>
					    	</tr>
					    </thead>
						<tr ng-show="filtery.length!=0"  ng-repeat="item in filtery = (tweetList| filter:{type:'Item'} |filter:searchRes)" ng-show="tweets">
									
						    <td>
							     <div class="ui input">
							     <input type="text" id="content_{{item.id}}" value="{{item.content}}" required>
							     <input type="hidden" value="{{item.createdDate}}"> 
							     </div>
							 </td>
							 <td>
							 {{item.type}}
							 </td>
							 <td>
								<button class="tiny labeled icon ui green button" ng-click="updateClick(item.id, 'content_', item.createdDate)">
									<i class="add circle icon"></i>
										Update
								</button>
							</td>
							<td>
								<button class="tiny labeled icon ui red button" ng-click="deleteClick(item.id, 'content_')">
									<i class="remove circle icon"></i>
										Delete
								</button>
							</td>
					    </tr>
						<tr>
									<td ng-show="!filtery.length">
										No Results Found.
									</td>
								</tr>
				  </tbody>
				</table>
				</form>
					
						</div>
					</div>
					
					
				<!-- ACTION, TODO -->
					<div class="ui right attached tab segment" data-tab="action">
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchRes" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
						
						<div class="item">
							<div class="medium labeled icon ui blue button" id="addTodo">
							  <i class="plus icon"></i>

							  Add Todo
							</div>
						</div>
				    	
			    	</div>
				<form class="ui form">
				<table class="ui blue table">
									 
					<tbody >
					    <thead>
					    	<tr>
					    		<th> TODO Description</th>
					    		<th> Type </th>
					    		<th></th>
					    		<th></th>
					    	</tr>
					    </thead>
						<tr ng-show="filtery.length!=0"  ng-repeat="item in filtery = (tweetList| filter:{type:'action'} |filter:searchRes)" ng-show="tweets">
									
						    <td>
							     <div class="ui input">
							     <input type="text" id="content_{{item.id}}" value="{{item.content}}" required>
							     <input type="hidden" value="{{item.createdDate}}"> 
							     </div>
							 </td>
							 <td>
							 {{item.type}}
							 </td>
							 <td>
								<button class="tiny labeled icon ui green button" ng-click="updateClick(item.id, 'content_', item.createdDate)">
									<i class="add circle icon"></i>
										Update
								</button>
							</td>
							<td>
								<button class="tiny labeled icon ui red button" ng-click="deleteClick(item.id, 'content_')">
									<i class="remove circle icon"></i>
										Delete
								</button>
							</td>
					    </tr>
						<tr>
									<td ng-show="!filtery.length">
										No Results Found.
									</td>
								</tr>
				  </tbody>
				</table>
				</form>
					
						</div>
					</div>
					
					
					
		
	<!-- MODAL FOR ADDING TODO -->
	
	<div class ="ui small basic modal" id="addTodoModal">
	 <i class="close icon"></i>
                <div class="header">
                Add New TODO
                </div>
				
		<div class="content">
			<div class ="ui centered grid">
				<div class="column">
					 <form class= "ui inverted form" >
						
							<div class="field">
							<label>TODO Name</label>
							<input ng-model="content" type="text"  placeholder="Enter TODO Name" required>
						</div>
						
						
						<div class="two fields ">
						<div class="field">
							  <label>TODO Type</label>
								<select ng-model="type" class="ui fluid dropdown" required>
									<option  value="" disabled default selected class="display-none">Select Type</option>
									<option ${f:select("type", "Action")}>Action</option>
									<option ${f:select("type", "Item")}>Item</option>
								</select>
						 </div>
						 
						  
						  
						</div>
						 
				
						<div class="two fluid ui inverted buttons">
							<div class="ui inverted red basic button close icon" >
                                 Cancel
                        </div>
				<div ng-bind="errorDisplay"></div>
					<!--<div id="btnAddTodo" class="ui inverted green basic button">Add</div>  -->	
					<input   type="submit" ng-click="tweetClick()"  class="ui inverted green basic button" value="Add"/>
						
							</div>
					</form> 
				</div>
		
			</div>
		
	
	</div>
</div>
	
<!-- MODAL FOR ADDING TODO TO EVENT -->
	
	<div class ="ui small basic modal" id="addEventTodoModal">
	 <i class="close icon"></i>
                <div class="header">
                Add Todo to Event
                </div>
				
		<div class="content">
			<div class ="ui centered grid">
				<div class="column">
					 <form class= "ui inverted form" >
						
							<div class="field">
							<label>EVENT</label>
								<select ng-model="event" class="ui fluid dropdown" required>
									<option  value="" disabled default selected class="display-none">Select Type</option>
									<option ${f:select("event", "Personal")}>Personal</option>
									<option ${f:select("event", "School")}>School</option>
									<option ${f:select("event", "Work")}>Work</option>
								</select>
							</div>
						
						
						<div class="two fields ">
						
						
						<div class="four wide field">
							  <label>Item Count</label>
							  <input ng-model="count"  id=itemC"" type="number" placeholder="count" min="1" max="100" required>
						</div>
						
						 <div class="field">
							  <label>Todo Name</label>
							<!--   <input ng-model="todoName"  type="tel" placeholder="Todo Name"> -->
							  
							  <select ng-model="todoName" id="todoN" class="ui fluid dropdown" required>
									<option  value="" disabled default selected class="display-none">Select Type</option>
									<option ng-repeat="item in tweetList" ng-show="tweets" id="content_{{item.id}}" ${f:select("todoName", "{{item.content}}")}>{{item.content}}</option>
									 
								</select>
						</div>
							
						</div>
						 
				
						<div class="two fluid ui inverted buttons">
							<div class="ui inverted red basic button close icon" >
                                 Cancel
                        </div>
				<div ng-bind="errorDisplay"></div>
					<!--<div id="btnAddTodo" class="ui inverted green basic button">Add</div>  -->	
					<input   type="submit" ng-click="addEventTodoClick()"  class="ui inverted green basic button" value="Add"/>
						
							</div>
					</form> 
				</div>
		
			</div>
		
	
	</div>
</div>

</div>
</div>

</div>
	
</body>

<script type="text/javascript">
$('#addeventtodo').on( "click", function() {
	$('#addEventTodoModal').modal({
		closable  : false,
	  })
	  .modal('show');
          
});
	$('#addTodo').on( "click", function() {
			$('#addTodoModal').modal({
				closable  : false,
			  })
			  .modal('show');
                  
		});
	

	
	
</script>

<script>
(function($){
$('.ui.input').input({
	todoContent: {
		identifier: 'updateContent',
		rules: [{
			type: 'empty',
			prompt: 'Please enter name'
		}]
	}
}, {
	on: blur,
	inline: 'true'
});
});
</script>

</html>