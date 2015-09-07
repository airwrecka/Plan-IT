<% /* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
%>
<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!-- 
	Rococo Class 2015
	Slim3 to AngularJS Tutorial Exercise
	INSTRUCTIONS
		- Enable Updating and Deleting tweets using AngularJS Ajax.
		- In the files DeleteController.java and UpdateController.java, supply the missing code marked by the //TODO comments.
		- Code the mising AngularJS scripts marked by the //TODO comments in tweet.js file.
 -->
<html ng-app="sampleApp">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>twitter Index</title>
		<link rel="stylesheet" type="text/css" href="/css/global.css" />
	</head>
	<body ng-controller="sampleController" data-ng-init="init()">
		<p>What are you doing?</p>
		<textarea ng-model="content"></textarea><br />
						
						<div class="field">
							  <label>TODO Type</label>
								<select   ng-model="type" class="ui fluid dropdown">
									<option  value="" disabled default selected class="display-none">Select Type</option>
									<option ${f:select("type", "Action")}>Action</option>
									<option ${f:select("type", "Item")}>Item</option>
								</select>
						 </div>
						 
						  
						  <div class="four wide field">
							  <label>Item Count</label>
							  <input ng-model="itemCount" type="tel" placeholder="Item Count">
							</div>
							
		
		<div ng-bind="errorDisplay"></div>
		<button ng-click="tweetClick()">Tweet</button>
		<h4>Posts</h4>

		<div ng-repeat="item in tweetList" ng-show="tweets">
			<textarea id="content_{{item.id}}">{{item.content}}</textarea> {{item.createdDate}}
			<button ng-click="updateClick(item.id, 'content_', item.createdDate)">save</button>
			<button ng-click="deleteClick(item.id)">Delete</button>
		</div>
	</body>
	<script type="text/javascript" src="/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="/js/angular.js"></script>
	<script type="text/javascript"src="/js/tweet.js"></script>
</html>