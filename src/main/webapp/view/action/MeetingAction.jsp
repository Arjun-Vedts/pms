<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.io.ByteArrayOutputStream,java.io.ObjectOutputStream"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>

 

<title>Action List</title>

<!-- <style type="text/css">
label{
font-weight: bold;
  font-size: 13px;
}
body{
background-color: #f2edfa;
overflow-x:hidden !important; 
}
h6{
	text-decoration: none !important;
}

.table button{
	
	background-color: white !important;
	border: 3px solid #17a2b8;
	padding: .275rem .5rem !important;
}

.table button:hover {
	color: black !important;
	
}
#table tbody tr td {

	    padding: 4px 3px !important;

}
</style> -->
<style type="text/css">
label{
font-weight: bold;
  font-size: 13px;
}
body{
background-color: #f2edfa;
overflow-x:hidden !important; 
}
h6{
	text-decoration: none !important;
}
.cc-rockmenu {
	color: fff;
	padding: 0px 5px;
	font-family: 'Lato', sans-serif;
}

.cc-rockmenu .rolling {
	display: inline-block;
	cursor: pointer;
	width: 24px;
	height: 22px;
	text-align: left;
	overflow: hidden;
	transition: all 0.3s ease-out;
	white-space: nowrap;
}

.cc-rockmenu .rolling:hover {
	width: 108px;
}

.cc-rockmenu .rolling .rolling_icon {
	float: left;
	z-index: 9;
	display: inline-block;
	width: 28px;
	height: 52px;
	box-sizing: border-box;
	margin: 0 5px 0 0;
}

.cc-rockmenu .rolling .rolling_icon:hover .rolling {
	width: 312px;
}

.cc-rockmenu .rolling i.fa {
	font-size: 20px;
	padding: 6px;
}

.cc-rockmenu .rolling span {
	display: block;
	font-weight: bold;
	padding: 2px 0;
	font-size: 14px;
	font-family: 'Muli', sans-serif;
}

.cc-rockmenu .rolling p {
	margin: 0;
}

.width {
	width: 270px !important;
}

a:hover {
	color: white;
}

</style>

</head>
<body>
 <%
SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
List<Object[]> ProjectsList=(List<Object[]>) request.getAttribute("ProjectsList");
List<Object[]>  projapplicommitteelist=(List<Object[]>)request.getAttribute("projapplicommitteelist");
List<Object[]> meetingcount=(List<Object[]>) request.getAttribute("meetingcount");
List<Object[]> meetinglist=(List<Object[]>) request.getAttribute("meetinglist");
int meettingcount=1;

String empId = ((Long)session.getAttribute("EmpId")).toString();
String projectid=(String)request.getAttribute("projectid");
String committeeid=(String)request.getAttribute("committeeid");
String scheduleid =(String)request.getAttribute("scheduleid");
%>

<%String ses=(String)request.getParameter("result"); 
 String ses1=(String)request.getParameter("resultfail");
 if(ses1!=null){
	%>
	<center>
	<div class="alert alert-danger" role="alert" >
                     <%=ses1 %>
                    </div></center>
	<%}if(ses!=null){ %>
	<center>
	<div class="alert alert-success" role="alert"  >
                     <%=ses %>
                   </div></center>
                    <%} %>

    <br/>
</body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover">
           <div class="card-header ">  
					<div class="row">
						<h4 class="col-md-4">Meeting Action List</h4>  
							<div class="col-md-8" style="float: right; margin-top: -8px;" >
					   			<form method="post" action="MeettingAction.htm" name="dateform" id="myform">
					   				<table>
					   					<tr>
					   						<td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Project: </label>
					   						</td>
					   						<td style="max-width: 300px; padding-right: 50px">
                                               <select class="form-control selectdee" id="projectid" required="required" name="projectid" onchange='submitForm1();' >
										<% if(ProjectsList!=null && ProjectsList.size()>0){
										 for (Object[] obj : ProjectsList) {
											 String projectshortName=(obj[17]!=null)?" ( "+obj[17].toString()+" ) ":"";			 
										 %>
												<option value="<%=obj[0]%>" <%if(obj[0].toString().equals(projectid)){ %>selected<%} %> ><%=obj[4]+projectshortName%></option>
										<%}} %>
								             </select>       
											</td>
											<td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Committee: </label>
					   						</td>
					   						<td style="max-width: 300px; padding-right: 50px">
                                              <select class="form-control selectdee" id="committeeid" required="required" name="committeeid" onchange='submitForm();' >
							   			        	<%if(projapplicommitteelist!=null && projapplicommitteelist.size()>0){
							   			        	  for (Object[] obj : projapplicommitteelist) {%>
											     <option value="<%=obj[0]%>"  <%if(obj[0].toString().equals(committeeid)){ %>selected<%} %> ><%=obj[3]%></option>
											        <%}} %>   
							  	             </select>
											</td>
					   						 <td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Meeting: </label>
					   						</td>
					   						<td style="max-width: 300px; padding-right: 50px">
                                                   <select class="form-control selectdee" id="meettingid" required="required" name="meettingid" onchange='submitForm();'>
							   			        	<% if(meetingcount!=null && meetingcount.size()>0){
							   			        	 for (Object[] obj : meetingcount) {%>
											         <option value="<%=obj[0]%>" <%if(obj[0].toString().equals(scheduleid)){ %>selected<%} %>><%=obj[3]+"-"+meettingcount%></option>
											        <%meettingcount++;} }%>   
							  	                  </select>				   						
											</td> 	   									
					   					</tr>   					   				
					   				</table>
					   				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					   			</form>
		   					</div>
		   				</div>	   							
					</div>
					
						<div class="data-table-area mg-b-15">
							<div class="container-fluid">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="sparkline13-list">
										<div class="sparkline13-graph">
											<div class="datatable-dashv1-list custom-datatable-overright">
												<div id="toolbar">
													
												</div>
												<table id="table" data-toggle="table" data-pagination="true"
													data-search="true" data-show-columns="true"
													data-show-pagination-switch="true" data-show-refresh="true"
													data-key-events="true" data-show-toggle="true"
													data-resizable="true" data-cookie="true"
													data-cookie-id-table="saveId" data-show-export="true"
													data-click-to-select="true" data-toolbar="#toolbar">
													<thead>

														<tr>
															<th>SN</th>
															<th>Action Id</th>	
															<th class="width-110px" style="width: 7.1%;">PDC</th>
															<th >Action Item</th>																											 	
														 	<th >Assigner</th>
														 	<th >Progress</th>
														 	<th class="width-140px">Action</th>
														</tr>
													</thead>
													<tbody>
														<%int count=1;
															if(meetinglist!=null && meetinglist.size()>0)
															{
												   					for (Object[] obj :meetinglist) 
												   					{ %>
																	<tr>
																		<td><%=count++ %></td>
																		<td>
																		    <form action="ActionDetails.htm" method="POST" >
																				<button  type="submit" class="btn btn-outline-info"   ><%=obj[0] %></button>
																			   <input type="hidden" name="ActionLinkId" value="<%=obj[13]%>"/>
																	           <input type="hidden" name="Assignee" value="<%=obj[1]%>,<%=obj[2]%>"/>
																	           <input type="hidden" name="ActionMainId" value="<%=obj[10]%>"/>
																	           <input type="hidden" name="ActionAssignId" value="<%=obj[12]%>"/>
																	           <input type="hidden" name="ActionNo" value="<%=obj[0]%>"/>
																	           <input type="hidden" name="text" value="A">
																	           <input type="hidden" name="empId" value="<%=empId%>">
																	           <input type="hidden" name="projectid" value="<%=projectid%>">
																	           <input type="hidden" name="committeeid" value="<%=committeeid%>">
																	           <input type="hidden" name="meettingid" value="<%=scheduleid%>">
 																			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
																			
																			</form> 
																		</td>
																		<td><%=sdf1.format(obj[6])%></td>
																		<td>
															               <%if(obj[7].toString().length()>100){ %>
															               <%=obj[7].toString().substring(0, 100) %>
														                   <input type="hidden" value='"<%=obj[7].toString()%>"' id="td<%=obj[10].toString()%>">
														                   <span style="text-decoration: underline;font-size:13px;color: #145374;cursor: pointer;font-weight: bolder" onclick="showAction('<%=obj[10].toString()%>','<%=obj[0].toString()%>')">show more..</span>
															               <%}else{ %>
															               <%=obj[7].toString() %>
															               <%} %>
															            </td>																		
																	  	<td><%=obj[3]%>, <%=obj[4]%></td>
																		<td style="width:8% !important; "><%if(obj[11]!=null){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important; width: 140px;">
															<div class="progress-bar progress-bar-striped" role="progressbar" style=" width: <%=obj[11]%>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=obj[11]%>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;width: 140px;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Yet Started .
															</div>
															</div> <%} %>
															</td>	
															<td class="left width">		
															<form name="myForm1" id="myForm1" action="ActionSubLaunch.htm" method="POST" 
																	style="display: inline">
                                                                  <%if(obj[8].toString().equalsIgnoreCase("A") || obj[8].toString().equalsIgnoreCase("B")|| obj[8].toString().equalsIgnoreCase("I")|| obj[8].toString().equalsIgnoreCase("K")){ %>
																	<button class="btn btn-sm editable-click" name="sub" value="Details" 	>
																		<div class="cc-rockmenu">
																			<div class="rolling">
																				<figure class="rolling_icon">
																					<img src="view/images/preview3.png">
																				</figure>
																				<span>Details</span>
																			</div>
																		</div>
																	</button>
																	 <button type="submit"  class="btn btn-sm editable-click" name="Action" value="ReAssign"  formaction="ActionLaunch.htm" formmethod="POST"  >
																				<div class="cc-rockmenu">
																				 <div class="rolling">	
																				 <figure class="rolling_icon">
																				 	<img src="view/images/repeat.png"  >
															                       </figure>
															                        <span> Re-Assign</span>
															                      </div>
															                     </div>
															          </button> 
															          <button type="submit"  class="btn btn-sm editable-click" name="ActionAssignid" value="<%=obj[12]%>" formtarget="blank" title="Action Tree"    formaction="ActionTree.htm" formmethod="POST"  >
																				<div class="cc-rockmenu">
																				 <div class="rolling">	
																				 <figure class="rolling_icon">
																				 	<img src="view/images/tree.png"  >
															                       </figure>
															                        <span> Action Tree</span>
															                      </div>
															                     </div>
															           </button> 
																	<%}if(obj[8].toString().equalsIgnoreCase("C")){ %>
																		<h5 style="font-weight: 600;color: #2E7D32;text-shadow: 5px 5px 10px #81C784;">Closed</h5>
																	<%}if(obj[8].toString().equalsIgnoreCase("F")){ %>
																		<h5 style="font-weight: 600;color: #E53935;text-shadow: 5px 5px 10px #F44336;">Forwarded</h5>
																	<%} %>
												                    <input type="hidden" name="Assigner" value="<%=obj[3]%>,<%=obj[4]%>"/>													
                                                                    <input type="hidden" name="ActionLinkId" value="<%=obj[13]%>"/>
																	<input type="hidden" name="ActionMainId" value="<%=obj[10]%>"/>
																	<input type="hidden" name="ActionNo" value="<%=obj[0]%>"/>
																	<input type="hidden" name="ActionAssignid" value="<%=obj[12]%>"/>
																	<input type="hidden" name="ProjectId" value="<%=obj[15]%>"/>
																	<input type="hidden" name="flag" value="T"/>
																	<input type="hidden" name="empId" value="<%=empId%>">
																	<input type="hidden" name="projectid" value="<%=projectid%>">
																	<input type="hidden" name="committeeid" value="<%=committeeid%>">
																	<input type="hidden" name="meettingid" value="<%=scheduleid%>">
 																	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																	
																</form> 
															
															</td>		
															</tr>
																<% }									   					
															}%>
													</tbody>
												</table>												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					
						<br>
						<div class="card-footer" align="right">&nbsp;</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
<!-- Modal for action -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="height:50px;">
        <h5 class="modal-title" id="exampleModalLongTitle">Action</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:red;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalbody">
     
      </div>
      <div align="right" id="header" class="p-2"></div>
    </div>
  </div>
</div>
					
<script type="text/javascript">
function submitForm()
{ 
  document.getElementById('myform').submit(); 
}
function submitForm1()
{ 
	$("#committeeid").val("all").change();
}
function showAction(a,b){
	/* var y=JSON.stringify(a); */
	var y=$('#td'+a).val();
	console.log(a);
	$('#modalbody').html(y);
	$('#header').html(b);
	$('#exampleModalCenter').modal('show');
}
</script>
</html>