
<html ng-app="testApp">

<head>
<meta charset="utf-8" />
<title>Search Filter</title>



<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.js"></script>
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <link href="style.css" rel="stylesheet" />
	  <style>
         .closeButton {
            position: relative;
            height: 24px;
            width: 24px;
            line-height: 30px;
            text-align: center;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 50%;
            border: none;
            box-shadow: none;
            padding: 0;
            margin: 3px;
            transition: background 0.15s linear;
            display: block; 
         }
	  </style>
<script src="script.js"></script>
<body ng-controller="MainCtrl as ctrl">
	<div class="main">
		<nav class="{{active}}" ng-click="$event.preventDefault()">
			<a href="#" class="product" ng-click="active='product'" style="text-decoration:none;">Product Watch</a> 
			<a href="#" class="finder" ng-click="active='finder'"style="text-decoration:none;">Niche Finder</a>
			<a href="#" class="source" ng-click="active='source'"style="text-decoration:none;">Product Source</a>
		</nav>
		<div class="bar" id="productSearch">
			<div class="searchcontent">
				<span>Product Keywords<br> <input type="text"
					ng-model="enteredValue" placeholder="Enter your search terms" />
				</span> 
				<span>
					<button ng-click="getApiData(enteredValue)">Product Search</button>
				</span>
			</div>
			<div style="border-bottom: 1px solid; padding-left: 165px;">
			<ul>
			    <li ng-repeat="result in results"><span>Product Name: {{result.Name}}</span>
			    <span style="margin-left: 80px;">Product Type: {{result.Type}}</span></li>
			</ul>
		</div>
		<div class="advanceSearch">
		   <span style="margin-left: 60px;"><a ng-click="ShowHide()" href="#">Advance Search</a></span>
		   <div ng-hide = "IsHidden" class="advanceSrchCntnt">
		   <div style=" width: 30%; float: left;">
		   <div><span><input type="text" name="category" value="Categories" readonly></span></div>
		     <ul>
			    <li ng-repeat="data in GetApiData" >
			      <label>
                    <input type="checkbox" ng-model="active" ng-true-value="{{data.id}}" ng-false-value="0" ng-change="setcheckbox(data,active,$index)"> {{data.name}}
                  </label>
                  
			   </li>
			 </ul>
			 </div>
			 <div style=" width: 47%; float: left;">
		   <div><span><input type="text" name="attribute" value="Attributes" readonly style="width:780px;;"></span></div>
		   <div style="float: left;width: inherit;">
		     <ul>
			    <li>
			      <label>
                    <span>Price: <input type="text" name="price" ng-model="price" style=" margin-left: 10px;width: 10%;height: 0px;
    padding-bottom: 5px;"></span>
                   
                  </label>
                  
			   </li>
			   <li>
			      <label>
                    <span>Transaction Amount: <input type="text" name="amount" ng-model="amount" style=" margin-left: 10px;width: 10%;height: 0px;
    padding-bottom: 5px;"></span>
                  </label>
                  
			   </li>
			   <li>
			      <label>
                    <span>No. of Transaction: <input type="text" name="num" ng-model="num" style=" margin-left: 10px;width: 10%;height: 0px;
    padding-bottom: 5px;"></span>
         
                  </label>
                  
			   </li>
			 </ul>
			 </div>
			 <div>
			 <ul>
			    <li>
			      <label>
                    <span> <input type="radio" ng-model="value" value="trade" style=" margin-left: 10px;width: 10%;
    padding-bottom: 5px;">Trade Assurance</span>
                   
                  </label>
                  
			   </li>
			   <li>
			      <label>
                    <span> <input type="radio" ng-model="value" value="gold" style=" margin-left: 10px;width: 10%;
    padding-bottom: 5px;">Gold Supplier</span>
                  </label>
                  
			   </li>
			   <li>
			      <label>
                    <span> <input type="radio" ng-model="value" value="assessed" style=" margin-left: 10px;width: 10%;
    padding-bottom: 5px;">Assessed Supplier</span>
         
                  </label>
                  
			   </li>
			   <li>
			      <label>
                    <span> <input type="radio" ng-model="value" value="free" style=" margin-left: 10px;width: 10%;
    padding-bottom: 5px;">Free Inspection</span>
         
                  </label>
                  
			   </li>
			 </ul>
			 </div>
			 </div>
			  <span>
					<button ng-click=submitfunction(ctrl.itemIds,price,amount,num)>Done</button>
				</span>
				<span style="font-size: 25px; color: #00bfff;">
				<i class="fa fa-refresh" aria-hidden="true"></i>
				</span>
		  </div>
		 
		</div>
		 <div layout="column"  ng-cloak ng-hide="hide">
    <md-chips ng-model="ctrl.itemIds"></md-chips>
      </div>
		</div>

 
   
		
	</div>

</body>
</html>
