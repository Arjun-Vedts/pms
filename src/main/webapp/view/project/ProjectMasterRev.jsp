<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.pfms.*,java.text.SimpleDateFormat,java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<title>Project Revision</title>
<style>
label {
	font-size: 14px;
}

.input-group-text {
	font-weight: bold;
}

label {
	font-weight: 800;
	font-size: 16px;
	color: #07689f;
}

hr {
	margin-top: -2px;
	margin-bottom: 12px;
}

b {
	font-family: 'Lato', sans-serif;
}
</style>
</head>
<body>
<%SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
List<Object[]> ProjectTypeMainList=(List<Object[]>) request.getAttribute("ProjectTypeMainList");
List<Object[]> OfficerList=(List<Object[]>) request.getAttribute("OfficerList");
Object[] ProjectEditData=(Object[]) request.getAttribute("ProjectEditData");
String projectid=(String)request.getAttribute("projectid");
List<Object[]> CategoryList=(List<Object[]>) request.getAttribute("CategoryList");
List<Object[]> ProjectTypeList=(List<Object[]>) request.getAttribute("ProjectTypeList");
List<Object[]> PlatformList=(List<Object[]>) request.getAttribute("PlatformList"); /* srikant */
%>

<%String ses=(String)request.getParameter("result"); 
 String ses1=(String)request.getParameter("resultfail");
	if(ses1!=null){
	%><center>
	<div class="alert alert-danger" role="alert">
                     <%=ses1 %>
                    </div></center>
	<%}if(ses!=null){ %>
	<center>
	<div class="alert alert-success" role="alert" >
                     <%=ses %>
                   </div></center>
                    <%} %>




<div class="row" style="margin-top: -10px;">
<div class="col-md-12">
<div class="card shadow-nohover" >
<div class="card-header"><h4>
Project Revision</h4>
  </div>

<div class="card-body"> 
<div class="row">
		<div class=" col-md-12 ">
			<!-- Calling AddUpdateProjectController to add New User Data -->
			<form class="form-horizontal" role="form" action="ProjectMasterRevSubmit.htm" method="POST">
				<input type="hidden" value="<%=projectid%>" name="projectid">
					<!-- Form Name -->
					<!-- Text input-->
					  <div class="tables">
  <div class="table-responsive">
  
	  <!-- changed the style -->
	  
	   <table class="table table-bordered table-hover table-striped table-condensed " style="border: 1px solid black !important;background-color:white;font-family: 'Montserrat', sans-serif;" >
  <thead>



<tr>
   <th>
 <label style="margin-bottom: -10px;"> Project Main:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td>
		<select required="required" id="selectbasicc" name="ProjectMainId" class="form-control form-control selectdee" data-width="80%" data-live-search="true" >
								<%for(Object[] protype : ProjectTypeMainList ){
	
	                           %>
								<option value="<%=protype[0] %>" <%if(protype[0].toString().equalsIgnoreCase(ProjectEditData[1].toString())){ %>
								 selected="selected"  <%}else{ %> disabled="disabled" <%} %>
								><%=protype[1] %></option>
								<%} %>
						</select>
</td>
  <th>
 <label style="margin-bottom: -10px;"> Project Name:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text"   name="pname"  class="form-control alphanum-symbols-no-leading-space" value="<%=ProjectEditData[4] %>" maxlength="255" required="required">

 
</td>
 </tr>
 
 <tr>
  <th>
 <label style="margin-bottom: -10px;"> Project Number:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
	<input type="text"  name="desc" value="<%=ProjectEditData[5] %>"
								class="form-control alphanum-symbols-no-leading-space" maxlength="100" required="required">
 
</td>
  <th>
 <label style="margin-bottom: -10px;"> Project Unit Code:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
	<input type="text"   name="unicode" value="<%=ProjectEditData[6] %>" 
	class="form-control alphanum-symbols-no-leading-space" maxlength="20" required="required">
 
</td>
 </tr>
 
  <tr>
<%--   <th>
 <label style="margin-bottom: -10px;"> Project Main:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
		<select required="required" id="selectbasicc" name="projecttype" class="form-control form-control selectpicker" data-width="80%" data-live-search="true">
								<%for(Object[] protype:ProjectTypeMainList ){
	
	                           %>
								<option value="<%=protype[0] %>" <%if(protype[0].toString().equalsIgnoreCase(ProjectEditData[1].toString())){ %>
								 selected="selected"  <%} %>
								><%=protype[1] %></option>
								<%} %>
						</select>
</td> --%>



<th>
 <label style="margin-bottom: -10px;"> Project Code:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
 <input type="text"   name="pcode"
								class="form-control alphanum-symbols-no-leading-space" maxlength="20" value="<%=ProjectEditData[3] %>" required="required" readonly>
 
</td>

    <th>
<label style="margin-bottom: -10px;"> Project Short Name:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
<td>
 <input type="text"   name="projectshortname" <%if(ProjectEditData[23]!=null){%> value="<%=ProjectEditData[23] %>"<%} %>	class="form-control alphanum-symbols-no-leading-space" maxlength="20" required="required">
</td>
  <%-- <th>
 <label style="margin-bottom: -10px;"> IsMainWorkCenter:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
	<select name="ismainwc" class="form-control selectpicker" data-width="80%">
							<option value="1"  <%if("1".equalsIgnoreCase(ProjectEditData[16].toString())){ %>
								 selected="selected"  <%} %>
							>Yes</option>
							<option value="0"
							 <%if("0".equalsIgnoreCase(ProjectEditData[16].toString())){ %>
								 selected="selected"  <%} %>
							>No</option>
							</select>
 
</td> --%>
 </tr>
 
   <tr>
       <th>
 <label style="margin-bottom: -10px;"> End User:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
	<select name="enduser" 	class="form-control  form-control selectdee" data-width="100%" data-live-search="true">
							<option disabled="disabled" selected="selected" value="">Choose...</option>
							 
							<option value="IA" <%if("IA".equalsIgnoreCase(ProjectEditData[24]+"")){%> selected="selected" <%}%>>Indian Army</option>
							<option value="IN" <%if("IN".equalsIgnoreCase(ProjectEditData[24]+"")){%> selected="selected" <%}%>>Indian Navy</option>
							<option value="IAF" <%if("IAF".equalsIgnoreCase(ProjectEditData[24]+"")){%> selected="selected" <%}%>>Indian Air Force</option>
							<option value="DRDO" <%if("DRDO".equalsIgnoreCase(ProjectEditData[24]+"")){%> selected="selected" <%}%>>DRDO</option>
							<option value="IH" <%if("IH".equalsIgnoreCase(ProjectEditData[24]+"")){%> selected="selected" <%}%>>Home Land Security</option>
							<option value="OH" <%if("OH".equalsIgnoreCase(ProjectEditData[24]+"")){%> selected="selected" <%}%>>Others</option>
							
	</select>
</td>
   
   
  <th>
 <label style="margin-bottom: -10px;"> Project Director:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<select required="required" name="projectdirector" class="form-control form-control selectdee" id="officerPunchNo" data-width="100%" data-live-search="true">
							<%for(Object[] protype:OfficerList ){
	
	                           %>
								<option value="<%=protype[0] %>"
								 <%if(protype[0].toString().equalsIgnoreCase(ProjectEditData[13].toString())){ %>
								 selected="selected"  <%} %>
								><%=protype[2].toString() %>, <%=protype[3].toString() %></option>
								<%} %>
							</select>
</td>
  <%-- <th>
 <label style="margin-bottom: -10px;"> WorkCenter Name:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text"  name="wcname"  value="<%=ProjectEditData[17] %>" class="form-control" maxlength="100" required="required">
 
</td> --%>
 </tr>
 
    <tr>
  <th>
 <label style="margin-bottom: -10px;"> Project Sanc Authority:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<%-- <input type="text"  class="form-control"  value="<%=ProjectEditData[14] %>"  name="ProjectsancAuthority" maxlength="100" required="required"> --%>
		<select required="required"
				name="ProjectsancAuthority"
				class="form-control  form-control selectdee"
				data-width="100%"
				data-live-search="true" >
					<option disabled="disabled" value="" selected="selected">Choose..</option>
																	
					<option value="DIR" <%if(ProjectEditData[14]!=null && ProjectEditData[14].equals("DIR") ){ %>selected<%} %> >DIR</option>
					<option value="DG" <%if(ProjectEditData[14]!=null && ProjectEditData[14].equals("DG") ){ %>selected<%} %> >DG</option>
					<option value="SECY"  <%if(ProjectEditData[14]!=null && ProjectEditData[14].equals("SECY") ){ %>selected<%} %> >SECY</option>
					<option value="RM" <%if(ProjectEditData[14]!=null && ProjectEditData[14].equals("RM") ){ %>selected<%} %> >RM</option>
					<option value="FM" <%if(ProjectEditData[14]!=null && ProjectEditData[14].equals("FM") ){ %>selected<%} %> >FM</option>
					<option value="CCS" <%if(ProjectEditData[14]!=null && ProjectEditData[14].equals("CCS") ){ %>selected<%} %> >CCS</option>
		</select>
</td>
  <th>
 <label style="margin-bottom: -10px;"> Project Sanction No:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text"   name="sano"  value="<%=ProjectEditData[7] %>"
								class="form-control alphanum-symbols-no-leading-space" maxlength="100" required="required">
</td>
 </tr>
 
    <tr>
  <th>
 <label style="margin-bottom: -10px;"> Project Sanction Date:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text"  data-date-format="dd/mm/yyyy"  readonly id="datepicker" name="sadate"  value="<%=sdf.format(ProjectEditData[8]) %>"
								class="form-control form-control">
</td>

<th>
 <label style="margin-bottom: -10px;">Total Sanction Cost (&#8377;):
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text" required="required"    id="totalcostid" name="tsancost"  class="form-control decimal-format" >
</td>


 </tr>
 
    <tr>
  <th>
 <label style="margin-bottom: -10px;"> Board Of  Reference:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<%-- <input type="text"   name="bor" value="<%=ProjectEditData[15] %>"
								class="form-control" maxlength="50" required="required">
								
								 --%>
									<select required="required"
														name="bor"
														class="form-control  form-control selectdee"
														data-width="100%"
														data-live-search="true" >
														<option disabled="disabled" value="" selected="selected">Choose..</option>
														<option value="DMC" <%if(ProjectEditData[15].equals("DMC")){ %> selected<%} %>>DMC</option>
														<option value="CCM" <%if(ProjectEditData[15].equals("CCM")){ %> selected<%} %>>CCM</option>														
									</select>
								
								
</td>
  <th>
 <label style="margin-bottom: -10px;"> Sanction Cost FE (&#8377;):
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text"   id="fecostid" name="sancostfe" value="<%=ProjectEditData[10] %>"
								class="form-control decimal-format"  maxlength="18" required="required">
</td>
 </tr>
 
 <tr>
  <th>
 <label style="margin-bottom: -10px;">PDC:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input  id="currentdate"  data-date-format="dd/mm/yyyy" readonly name="pdc" value="<%=sdf.format(ProjectEditData[12]) %>"
								class="form-control form-control">
</td>
 
  <th>
 <label style="margin-bottom: -10px;"> Sanction Cost RE (&#8377;):
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<input type="text"  name="sancostre" id="Recostid" value="<%=ProjectEditData[9] %>"
								class="form-control decimal-format"  maxlength="18" readonly="readonly" value="0.0">
</td>
 </tr>
    <tr>
    <th><label style="margin-bottom: -10px;">
															Category: <span class="mandatory" style="color: red;">*</span>
													</label></th>
													<td><select required="required" id="selectbasic1" 
														name="projectTypeID"
														class="form-control form-control selectdee"
														data-width="80%" data-live-search="true">
															<%
															for (Object[] protype : ProjectTypeList) {
															%>
															<option value="<%=protype[0]%>" <%if(ProjectEditData[22]!=null && protype[0].toString().equals(ProjectEditData[22].toString())) {%>selected="selected" <%} %>><%=protype[1]%></option>
															<%
															}
															%>
													</select>
													<input name="projectTypeID" id="projectTypeIDid" hidden="hidden"  value="<%=ProjectEditData[22]%>" >
													</td>
  <th>
 <label style="margin-bottom: -10px;">Security Classification:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td >
<select required="required" name="projectcategory" class="form-control form-control selectdee" id="selectbasic2" data-width="80%" data-live-search="true" >
							<%for(Object[] protype:CategoryList ){
	
	                           %>
	                           
								<option value="<%=protype[0] %>"
								 <%if(protype[0].toString().equalsIgnoreCase(ProjectEditData[21].toString())){ %>
								 selected="selected"  <%} %>
								><%=protype[1].toString() %></option>
								<%} %>
							</select>
							
							<%-- <input name="projectcategory" id="projectcategoryID" hidden="hidden"  value="<%=ProjectEditData[21].toString() %>"> --%>
</td>

 </tr>
 <!-- srikant code start -->
<tr>
<th><label style="margin-bottom: -10px;">	Platform: <span class="mandatory"	style="color: red;">*</span></label></th>
<td><select required="required" id="platformName" name="platformName" class="form-control form-control selectdee" data-width="100%" data-live-search="true">
<option disabled="disabled" value="" selected="selected">Choose..</option>
<%for(Object[] protype:PlatformList ){%>
<option value="<%=protype[0] %>" <%if(ProjectEditData[33].toString()!="0" && protype[0].toString().equalsIgnoreCase(ProjectEditData[33].toString())){ %>
 selected="selected"  <%} %>
><%=protype[1] %></option>
<%}%>
</select></td>
</tr>
								
<!-- srikant code end-->
  <tr>
		<th colspan="1"><label style="margin-bottom: -10px;">Nodal & Participating Lab:<span class="mandatory" style="color: red;">*</span></label></th>
		<td colspan="3"><input required="required"	name="LabParticipating" class="form-control alphanum-symbols-no-leading-space" maxlength="5000" value="<%if(ProjectEditData[27]!=null ){%><%=ProjectEditData[27] %><%} %>" /></td>
</tr>
 <tr>
		<th colspan="1"><label style="margin-bottom: -10px;">Application:<span class="mandatory" style="color: red;">*</span></label></th>
		<td colspan="3"><textarea required="required" name="Application"  class="form-control " rows="1" cols="53"><%if(ProjectEditData[26]!=null){%> <%=ProjectEditData[26]%> <%}%></textarea></td>
</tr>
   <tr>
  <th colspan="1">
 <label style="margin-bottom: -10px;">Scope:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td colspan="3">
	<textarea required="required" name="Scope" 
	class="form-control "  maxlength="5000" rows="5" cols="53"><%=ProjectEditData[25] %></textarea>
</td>
 </tr>
 <tr>
  <th colspan="1">
 <label style="margin-bottom: -10px;">Objective:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td colspan="3">
	<textarea required="required"  name="Objective" 
	class="form-control " maxlength="5000" rows="5" cols="53"><%=ProjectEditData[19] %></textarea>
</td>
 </tr>
  <tr>
  <th colspan="1">
 <label style="margin-bottom: -10px;">Deliverable:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td colspan="3">
	<textarea required="required" name="Deliverable" 
	class="form-control "  maxlength="5000" rows="5" cols="53"><%=ProjectEditData[20] %></textarea>
</td>
 </tr>
  <tr>
  <th colspan="1">
 <label style="margin-bottom: -10px;">Remarks:
<span class="mandatory" style="color: red;">*</span>
</label>
</th>
 <td colspan="3">
	<input  name="remarks" class="form-control alphanum-symbols-no-leading-space"  maxlength="500" required="required" value="<%if(ProjectEditData[32]!=null){%> <%=ProjectEditData[32]%> <%}%>" >
</td>
 </tr>
 
 </thead>
 </table>
 </div>
 </div>
				

					
					<div align="center">
									<table>
										<tr>
											<td>
												<button type="submit" name="action" value="editsubmit" class="btn btn-primary btn-sm submit" onclick="return confirm('Are You Sure To Submit!')">REVISE</button>
											</td>
											<td>
											    <a class="btn btn-info btn-sm shadow-nohover back" href="ProjectList.htm">Back</a>
											</td>
										</tr>
									</table>
								</div>
		
 	 						
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	</form>
	</div>
	</div></div></div></div>
</div>









<script>
function Edit(myfrm){
	
	 var fields = $("input[name='ProjectMainId']").serializeArray();

	  if (fields.length === 0){
		  bootbox.alert("PLEASE SELECT ONE PROJECT MAIN RECORD");
		  
		  
	 event.preventDefault();
	return false;
	}
	 
	
	
		 
	
		  return true;
	 
			
	}
	
$('#currentdate,#datepicker').daterangepicker({
	"singleDatePicker" : true,
	"linkedCalendars" : false,
	"showCustomRangeLabel" : true,

	"cancelClass" : "btn-default",
	showDropdowns : true,
	locale : {
		format : 'DD-MM-YYYY'
	}
});


$(document).ready(function () {
	
	$('#totalcostid,#fecostid').on('change', function () {
		   var tcost = $('#totalcostid').val();      
	       var fcost = $('#fecostid').val();
	       var tid = parseFloat(tcost.replace(/[^0-9.-]+/g,""));
	       var fid = parseFloat(fcost.replace(/[^0-9.-]+/g,""));
	       var total =tid-fid ;
	       $("#Recostid").val(total);
	      
	   });
});
$(document).ready(function () {
	
    var Recostid = $('#Recostid').val();
    var Fecostid = $('#fecostid').val();
    var Feid = parseFloat(Recostid.replace(/[^0-9.-]+/g,""));
    var Reid = parseFloat(Fecostid.replace(/[^0-9.-]+/g,""));
    var total =Feid+Reid ;
    $("#totalcostid").val(total);
    

});

$('#selectbasicc').on('change',function(){
	$.ajax({
        type: "get",
        url: "projectCatSencDetalis",
        data: {
			project : $('#selectbasicc').val()
		},
		datatype : 'json',
        success: function(result){      
        	var values = JSON.parse(result);
        	$("#selectbasic1").val(values[0][0]);
         	$("#selectbasic2").val(values[0][1]);
         	$('#projectTypeIDid').val(values[0][0]);
        	$('#projectcategoryID').val(values[0][1]); 	
        }
    });
});
$(function(){

	  $('.number-only').keypress(function(e) {
		  if( e.keyCode === 8  ) {
		        return true; // backspace (8) / delete (46)
		    }
		if(isNaN(this.value+""+String.fromCharCode(e.charCode))) return false;
	  })
	  .on("cut copy paste",function(e){
		e.preventDefault();
	  });

	});
</script>
</body>
</html>