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
	<script type="text/javascript"src="/js/semantic.js"></script>
<script type="text/javascript">

	 
	
	$(document).ready(function(){
		$('.menu .item').tab();
	//----------------SIDEBAR----------------//
	
		$('.ui.checkbox').checkbox();
		
		
	});
	$('.item').click(function(){
		$('.active').removeClass('active item');
		$(this).addClass('active item');
	});

	
</script>
 
</head>



<body  ng-controller="sampleController" data-ng-init="init()">
<link rel="stylesheet/less" type="text/css" href="../SemanticUI/src/definitions/collections/menu.less" />

<div class ="ui grid">
	<div class="fixed tab left floated header segment" >
  <div class="container" >
    <div class="introduction" >

    
      <div style="padding:2em 0em 0em 2em" >
      <h1>   </h1>
       <img src="../pics/planit1_150px.png">
      </div>
      
     
      
      <div class="ui divider"></div>
      </div>
      </div>
      </div>
			
	<div class="three wide left floated column" style="padding:0em 0em 0em 2em; position:relative " >		
	
	
	<!-- CALENDAR -->
	<div class="row" id="calendar1">
	
	<section class="container">
    <table class="cal">
      <caption>
        <span class="prev"><a href="index.html">&larr;</a></span>
        <span class="next"><a href="index.html">&rarr;</a></span>
        January 2012
      </caption>
      <thead>
        <tr>
          <th>Mon</th>
          <th>Tue</th>
          <th>Wed</th>
          <th>Thu</th>
          <th>Fri</th>
          <th>Sat</th>
          <th>Sun</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="off"><a href="index.html">26</a></td>
          <td class="off"><a href="index.html">27</a></td>
          <td class="off"><a href="index.html">28</a></td>
          <td class="off"><a href="index.html">29</a></td>
          <td class="off"><a href="index.html">30</a></td>
          <td class="off"><a href="index.html">31</a></td>
          <td><a href="index.html">1</a></td>
        </tr>
        <tr>
          <td><a href="index.html">2</a></td>
          <td><a href="index.html">3</a></td>
          <td><a href="index.html">4</a></td>
          <td><a href="index.html">5</a></td>
          <td><a href="index.html">6</a></td>
          <td><a href="index.html">7</a></td>
          <td><a href="index.html">8</a></td>
        </tr>
        <tr>
          <td><a href="index.html">9</a></td>
          <td><a href="index.html">10</a></td>
          <td><a href="index.html">11</a></td>
          <td><a href="index.html">12</a></td>
          <td><a href="index.html">13</a></td>
          <td><a href="index.html">14</a></td>
          <td><a href="index.html">15</a></td>
        </tr>
        <tr>
          <td><a href="index.html">16</a></td>
          <td><a href="index.html">17</a></td>
          <td><a href="index.html">18</a></td>
          <td><a href="index.html">19</a></td>
          <td><a href="index.html">20</a></td>
          <td><a href="index.html">21</a></td>
          <td><a href="index.html">22</a></td>
        </tr>
        <tr>
          <td><a href="index.html">23</a></td>
          <td><a href="index.html">24</a></td>
          <td><a href="index.html">25</a></td>
          <td><a href="index.html">26</a></td>
          <td><a href="index.html">27</a></td>
          <td class="active"><a href="index.html">28</a></td>
          <td><a href="index.html">29</a></td>
        </tr>
        <tr>
          <td><a href="index.html">30</a></td>
          <td><a href="index.html">31</a></td>
          <td class="off"><a href="index.html">1</a></td>
          <td class="off"><a href="index.html">2</a></td>
          <td class="off"><a href="index.html">3</a></td>
          <td class="off"><a href="index.html">4</a></td>
          <td class="off"><a href="index.html">5</a></td>
        </tr>
      </tbody>
    </table>
  </section>

	
	</div>
		
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
						<a class="active red item" data-tab="personal" ><i class="circle icon"></i> Personal</a>
						<a class="blue item" data-tab="school" ><i class="circle icon"></i> School related</a>
						<a class="green item"  data-tab="work" ><i class="circle icon"></i> Work</a>
  
					</div>
				<div class="large labeled icon ui blue button" data-tab="events">
				  <i class="plus icon"></i>
				  Add Event
				</div>
		</div>
					
		<div class= "ui attached tab" data-tab="todos">
					<div class="ui secondary large vertical pointing menu" >
						<a class="active red item" data-tab="all" ><i class="folder open icon"></i> All</a>
						<a class="blue item" data-tab="item"><i class="list layout icon"></i> Item</a>
						<a class="green item" data-tab="action" ><i class="list layout icon"></i> Action</a>
  
					</div>
				<div class="large labeled icon ui blue button" id="addTodo">
				  <i class="plus icon"></i>

				  Add Todo
				</div>
				
			</div>
			
			
		</div>
		
		
		
		
		<!-- MENU CONTENT, EVENTS -->
		<div class="eight wide centered column" style="padding:0em 0em 0em 2em">
		 					
					
			<!-- DEFAULT, EVENT -->
					<div class="ui right attached active tab segment" data-tab="events">
						
						<div class="sixteen wide column">
							<h1>TODOS FOR TODAY</h1>
							<table class="ui very basic table">
							 
							  <tbody>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Go shopping</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Clean house</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Cook dinner</label>
								    </div>
								    </td>
							    </tr>
							  </tbody>
							</table>
							
							<h4 class="ui horizontal header divider">
							    <i class="checkmark box icon"></i>
							    For Tomorrow
							  </h4>
							  
							<table class="ui very basic table">
							 
							  <tbody>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Todo 1</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Todo 2</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Todo 3</label>
								    </div>
								    </td>
							    </tr>
							  </tbody>
							</table>
						</div>
					</div>
					
					<!-- PERSONAL EVENT -->
					<div class="ui right attached tab segment" data-tab="personal">
						<!-- PERSONAL EVENT -->
						<div class="sixteen wide column" >
							<h1>PERSONAL</h1>
							
						<table class="ui very basic table">
							 
							  <tbody>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Go shopping</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Clean house</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Cook dinner</label>
								    </div>
								    </td>
							    </tr>
							  </tbody>
							</table>
							
							<div class="tiny labeled icon ui green button" >
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
							
							<table class="ui very basic table">
							 
							  <tbody>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Make homework</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Study Nihonggo</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Read book</label>
								    </div>
								    </td>
							    </tr>
							  </tbody>
							</table>
							<div class="tiny labeled icon ui green button" >
							  <i class="plus icon"></i>
							  Add Todo
							</div>
						</div>
					</div>
					
					<!-- WORK EVENT -->
					<div class="ui right attached tab segment" data-tab="work">
						
						<div class="sixteen wide column" >
							<h1>WORK</h1>
							
							<table class="ui very basic table">
							 
							  <tbody>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Make report</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Meeting with the boss</label>
								    </div>
								    </td>
							    </tr>
							    <tr>
							    <td>
							      <div class="ui checkbox">
								      <input type="checkbox">
								      <label>Branch visit</label>
								    </div>
								    </td>
							    </tr>
							  </tbody>
							</table>
							<div class="tiny labeled icon ui green button" >
							  <i class="plus icon"></i>
							  Add Todo
							</div>
						</div>
					</div>
					
			<!-- END OF EVENTS MENU CONTENT -->
			
			
			<!-- MENU CONTENT, TODOS -->
			
				<!-- DEFAULT, TODO -->
					<div class="ui right attached tab segment" data-tab="todos" >
						<div class="sixteen wide column">
							
					</div>
					
				  </div>
				  
				<!-- ALL, TODO -->
					<div class="ui right attached tab segment" data-tab="all">
						<div class="sixteen wide column">
			<div ng-repeat="item in tweetList" ng-show="tweets">
			<textarea  id="content_{{item.id}}" >{{item.content}}</textarea> {{item.createdDate}}
			<button ng-click="updateClick(item.id, 'content_', item.createdDate)">save</button>
			<button ng-click="deleteClick(item.id)">Delete</button>
			</div>
							
					<c:forEach var="e" items="${todoList}">
						<hr />
						<div class="todoRow">
							<textarea name="desc" class="desc">${f:h(e.desc)}</textarea> 
							<input type="hidden" class="id" name="id" value="${f:h(e.id)}"/>
							
							<button class="btnUpdate">Save</button>
							<button class="btnDelete">Delete</button>
							<div class="updateErrorDisplay"></div>
						</div>
					</c:forEach>
					
						</div>
					</div>
					
					
				<!-- ITEM, TODO -->
					<div class="ui right attached tab segment" data-tab="item">
						<div class="sixteen wide column">
							
							
						</div>
					</div>
				
				<!-- ACTION, TODO -->
					<div class="ui right attached tab segment" data-tab="action">
						<div class="sixteen wide column">
							Action Todos
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
	
</body>

<script type="text/javascript">
	$('#addTodo').on( "click", function() {
			$('#addTodoModal').modal({
				closable  : false,
			  })
			  .modal('show');
                  
		}); 
	
</script>

</html>