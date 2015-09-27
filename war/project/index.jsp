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
	
		$('.button').popup({
            inline   : true,
            hoverable: true,
            position : 'top center',
                    delay: {
                    show: 100,
                    hide: 50
                    }
});
		
		
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
		<div class="ui secondary large pointing menu">
		  <a class="active blue item" data-tab="events">
		    <i class="book icon"></i> Events
		  </a>
		  <a class="blue item" data-tab="todos">
		    <i class="checkmark box icon" ></i> Todos
		  </a>
		 </div>
		
		
		<!-- SUB MENU OF EVENTS / TODOS -->
		<div class= "ui attached active tab" data-tab="events">
					<div class="ui secondary large vertical pointing menu"  >
						<a class="red item" data-tab="personal" ><i class="circle icon"></i> Personal</a>
						<a class="blue item" data-tab="school" ><i class="circle icon"></i> School related</a>
						<a class="green item"  data-tab="work" ><i class="circle icon"></i> Work</a>
  
					</div>
				
		</div>
					
		<div class= "ui attached tab" data-tab="todos">
					<div class="ui secondary large vertical pointing menu" >
						<a class="red item" data-tab="all" ><i class="folder open icon"></i> All</a>
						<a class="blue item" data-tab="item"><i class="list layout icon"></i> Item</a>
						<a class="green item" data-tab="action" ><i class="list layout icon"></i> Action</a>
  
					</div>
				<div class="medium labeled icon ui blue button" id="addTodo">
				  <i class="plus icon"></i>

				  Add Todo
				</div>
				
			</div>
			
		</div>

		<!-- MENU CONTENT, EVENTS -->
		<div class="twelve wide column" style="padding:0em 12em 0em 3em">
		 					
					
			<!-- DEFAULT, EVENT -->
					<div class="ui right attached tab segment" data-tab="events">
					
				<!-- DISPLAY TODOS in EVENTS -->			
						<div class="sixteen wide column">
						<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" ng-model="searchTodo" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
				    	
				    	<label>Percentage: {{progress}} </label>
				    	<div class="ui red progress" data-percent="{{prog}}">
						  <div class="bar" style="transition-duration: 300ms; width: {{prog}} ;"></div>
						</div>
			    	</div>
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
								<tr ng-repeat="item in eventTodoList | filter:searchTodo" ng-show="events">
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
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" id="butt" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
									</td>
								</tr>
							</tbody>
							
						</table>
					
							
						</div>
					</div>
					
					<!-- PERSONAL EVENT -->
					
					<div class="ui right attached tab segment" data-tab="personal">
						 
						<div class="sixteen wide column" >
							<h1 >PERSONAL</h1>
							<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
			    	</div>
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
								<tr ng-repeat="item in eventTodoList | filter:{eventName:'Personal'}" ng-show="events">
									<td>
									{{item.eventName}}
									</td>
									
									<td>
									{{item.todoID}}
									</td>
								
									<td>  
										
										<select ng-model="type" class="ui fluid dropdown" id="status_{{item.id}}" value="{{item.status}}">
											
											<option ${f:select("status", "0")}>0%</option>
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" id="butt" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
									</td>
								</tr>
							</tbody>
							
						</table>
							
							<div class="tiny labeled icon ui green button" id="addeventtodo">
							  <i class="plus icon"></i>
							  Add Todo
							</div>
							
							<h4 class="ui horizontal header divider">
							    <i class="checkmark box icon"></i>
							    Finished Tasks
							  </h4>
							  
							<table class="ui very basic table">
							 
							  <tbody>
							    <tr>
							    <td>
							      
								      <i class="checkmark icon"></i>
								      <label>Breathe</label>
								    
								    </td>
							    </tr>
							    <tr>
							    <td>
							      
								      <i class="checkmark icon"></i>
								      <label>Drink Water</label>
								    
								    </td>
							    </tr>
							  
							  </tbody>
							</table>
							
						</div>
					</div>
					
					
					<!-- SCHOOL RELATED EVENT -->
					<div class="ui right attached tab segment" data-tab="school">
						
						<div class="sixteen wide column" >
							<h1>SCHOOL</h1>
							<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
			    	</div>
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
								<tr ng-repeat="item in eventTodoList | filter:{eventName:'School'}" ng-show="events">
									<td>
									{{item.eventName}}
									</td>
									
									<td>
									{{item.todoID}}
									</td>
								
									<td>  
										
										<select ng-model="type" class="ui fluid dropdown" id="status_{{item.id}}" value="{{item.status}}">
											
											<option ${f:select("status", "0")}>0%</option>
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" id="butt" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
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
						
						<div class="sixteen wide column" >
							<h1>WORK</h1>
							<div class="menu">
				   		 <div class="item">
				      		<div class="ui icon input">
				        		<input type="text" placeholder="Search...">
				        	<i class="search link icon"></i>
				      		</div>
				    	</div>
			    	</div>
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
								<tr ng-repeat="item in eventTodoList | filter:{eventName:'Work'}" ng-show="events">
									<td>
									{{item.eventName}}
									</td>
									
									<td>
									{{item.todoID}}
									</td>
								
									<td>  
										
										<select ng-model="type" class="ui fluid dropdown" id="status_{{item.id}}" value="{{item.status}}">
											
											<option ${f:select("status", "0")}>0%</option>
											<option ${f:select("status", "50")}>50%</option>
											<option ${f:select("status", "100")}>100%</option>
										</select>
									</td>
									<td>
										<button class="tiny labeled icon ui green button" id="butt" ng-click="updateEventTaskClick(item.id, 'status_')" data-content="Click to Save">
											<i class="add circle icon"></i>
											Save
										</button>
									</td>
									<td>	
										<button class="tiny labeled icon ui red button" ng-click="deleteEventTaskClick(item.id)" data-content="Click to Delete">
											<i class="remove circle icon"></i>
											Delete
										</button>
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
					<div class="ui right attached active tab segment" data-tab="todos" >
						<div class="sixteen wide column">
							
					</div>
					
				  </div>
	
			<div class="ui right attached tab segment" data-tab="all">
						<div class="sixteen wide column">
			  
				<!-- ALL, TODO -->
					<div class="ui right attached tab segment" data-tab="all">
						<div class="sixteen wide column">
			
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
					    <tr ng-repeat="item in tweetList" ng-show="tweets">
						    <td>
							     <div class="ui input">
							     <input type="text"  id="content_{{item.id}}" value="{{item.content}}">
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
								<button class="tiny labeled icon ui red button" ng-click="deleteClick(item.id)">
									<i class="remove circle icon"></i>
										Delete
								</button>
							</td>
					    </tr>
				  </tbody>
				</table>
			
					
						</div>
					</div>
					
					
				<!-- ITEM, TODO -->
					<div class="ui right attached tab segment" data-tab="item">
						<div class="sixteen wide column">
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
					    <tr ng-repeat="item in tweetList | filter:{type:'Item'}" ng-show="tweets">
						    <td>
							     <div class="ui input">
							     <input type="text"  id="content_{{item.id}}" value="{{item.content}}">
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
								<button class="tiny labeled icon ui red button" ng-click="deleteClick(item.id)">
									<i class="remove circle icon"></i>
										Delete
								</button>
							</td>
					    </tr>
				  </tbody>
				</table>
							
						</div>
					</div>
				
				<!-- ACTION, TODO -->
					<div class="ui right attached tab segment" data-tab="action">
						<div class="sixteen wide column">
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
					    <tr ng-repeat="item in tweetList | filter:{type:'Action'}" ng-show="tweets">
						    <td>
							     <div class="ui input">
							     <input type="text"  id="content_{{item.id}}" value="{{item.content}}">
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
								<button class="tiny labeled icon ui red button" ng-click="deleteClick(item.id)">
									<i class="remove circle icon"></i>
										Delete
								</button>
							</td>
					    </tr>
				  </tbody>
				</table>
						</div>
					</div>	
					
					
					
					
					
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
							<input ng-model="content" type="text"  placeholder="Enter TODO Name">
						</div>
						
						
						<div class="two fields ">
						<div class="field">
							  <label>TODO Type</label>
								<select ng-model="type" class="ui fluid dropdown">
									<option  value="" disabled default selected class="display-none">Select Type</option>
									<option ${f:select("type", "Action")}>Action</option>
									<option ${f:select("type", "Item")}>Item</option>
								</select>
						 </div>
						 
						  
						  <div class="four wide field">
							  <label>Item Count</label>
							  <input ng-model="itemCount"  type="tel" placeholder="Item Count">
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
								<select ng-model="event" class="ui fluid dropdown">
									<option  value="" disabled default selected class="display-none">Select Type</option>
									<option ${f:select("event", "Personal")}>Personal</option>
									<option ${f:select("event", "School")}>School</option>
									<option ${f:select("event", "Work")}>Work</option>
								</select>
							</div>
						
						
						<div class="three fields ">
						
						 <div class="four wide field">
							  <label>Status</label>
							  <input ng-model="status"  type="tel" placeholder="status">
						</div>
						
						<div class="four wide field">
							  <label>Item Count</label>
							  <input ng-model="count"  type="tel" placeholder="count">
						</div>
						
						 <div class="field">
							  <label>Todo Name</label>
							<!--   <input ng-model="todoName"  type="tel" placeholder="Todo Name"> -->
							  
							  <select ng-model="todoName" class="ui fluid dropdown">
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

</html>