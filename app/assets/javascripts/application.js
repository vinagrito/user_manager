// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jqgrid
//= require_tree .

$(function(){
	
	$("#list1").jqGrid({
	   	url:'http//:localhost:3000/users/jqgrid_data',
		datatype: "json",
	   	colNames:['ID','Username', 'Email', 'Name','Lastname'],
	   	colModel:[
	   		{name:'id',index:'id', width:40},
	   		{name:'username',index:'username', width:90},
	   		{name:'email',index:'email', width:100},
	   		{name:'name',index:'name', width:80, align:"left"},
	   		{name:'lastname',index:'lastname', width:80, align:"left"}
	   	],
	   	rowNum:10,
	   	rowList:[10,20,30],
	   	pager: '#pager1',
	   	sortname: 'id',
	    viewrecords: true,
	    sortorder: "asc",
	    caption:"JSON Example"
	});
	$("#list1").jqGrid('navGrid','#pager1',{edit:true,add:true,del:true});
		
	  
})