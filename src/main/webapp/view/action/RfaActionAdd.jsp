<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.io.ByteArrayOutputStream,java.io.ObjectOutputStream"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:include page="../static/header.jsp"></jsp:include>
<spring:url value="/resources/ckeditor/ckeditor.js" var="ckeditor" />
<spring:url value="/resources/ckeditor/contents.css" var="contentCss" />
<script src="${ckeditor}"></script>
<link href="${contentCss}" rel="stylesheet" />

<title>RFA Action Add</title>

<style type="text/css">

.input-group-text{
font-weight: bold;
}

label{
	font-weight: 800;
	font-size: 16px;
	color:#07689f;
} 

hr{
	margin-top: -2px;
	margin-bottom: 12px;
}

.form-group {
    margin-top: 0.5rem;
    margin-bottom: 1rem;
}
#filealert {
    color: red;
    font-weight:bold;
    font-size: 19px;
  }
</style>

</head>
<body>

<%
List<Object[]> ProjectList=(List<Object[]>)request.getAttribute("ProjectList");
List<Object[]> ProjectTypeList=(List<Object[]>)request.getAttribute("ProjectTypeList");
List<Object[]> PriorityList=(List<Object[]>)request.getAttribute("PriorityList");
List<Object[]> EmployeeList=(List<Object[]>)request.getAttribute("EmployeeList");
List<Object[]> RfaNoTypeList=(List<Object[]>)request.getAttribute("RfaNoTypeList");
String EmpId=(String)request.getAttribute("EmpId");

%>



<div class="container-fluid">
	<form action="RfaActionSubmit.htm" method="POST" name="myfrm" id="myfrm" autocomplete="off" enctype="multipart/form-data" >
		<div class="card shadow-nohover" style="margin-top:0px">		
				<div class="row card-header">
			   			<div class="col-md-6">
							<h4>RFA ADD</h4>
						</div>
						<div class="col-md-3">
							
						</div>						
						
					 </div>
        
        		<div class="card-body">
                     <div class="row">
		                    <div class="col-md-6">
		                        <div class="form-group">
		                            <label class="control-label">Project</label>
		                            <span class="mandatory" style="color: #cd0a0a;">*</span>
			                            <select class="form-control selectdee " id="ProjectProgramme"  name="projectid" required="required">
										    <option disabled="true"  selected value="">Select...</option>
										     <% for (Object[] obj : ProjectList) {
										    	 String projectshortName=(obj[17]!=null)?" ( "+obj[17].toString()+" ) ":"";
										     %>
											<option value="<%=obj[0]%>"><%=obj[4]+projectshortName%></option>
											<%} %>
			  							</select>
			  							
		                        </div>
		                    </div>
		                    
		                  <div class="col-md-2">
		                     <div class="form-group">
		                            <label class="control-label"> RFA Type</label>
		                            <span class="mandatory" style="color: #cd0a0a;">*</span>
		                            <select class="form-control selectdee" required="required" name="rfanotype" id="rfanotype" data-placeholder= "Select Type">                   
		                            <% if(RfaNoTypeList!=null && RfaNoTypeList.size()>0){
		                            for(Object[] obj : RfaNoTypeList) { %>
		                            <option value="<%=obj[0]%>"><%=obj[1]%></option>
		                            <%}} %>
		                           </select>
		                           <!--  <input  class="form-control"  name="rfano" id="rfano"  required="required"  placeholder="Enter RFA Number" > -->	
		                      </div>
		                   </div> 
		                

		                    <div class="col-md-2">
		                        <div class="form-group">
		                            <label class="control-label">Priority</label>
		                            <span class="mandatory" style="color: #cd0a0a;">*</span>
		                            	<select class="custom-select"  required="required"name="priority" id="priority" >
										    <option disabled="true"  selected value="">Choose...</option>
											 <% for (Object[] obj : PriorityList) {%>
											<option value="<%=obj[0]%>"><%= "(" + obj[0] + ")" + obj[1]%></option>
											<%} %>
		  								</select>
		                        </div>
		                    </div>
		                    
		                  <div class="col-md-3">
		                     <div class="form-group">
		                            <label class="control-label">Assigned To</label>
		                            <span class="mandatory" style="color: #cd0a0a;">*</span>
		                         <select class="form-control selectdee" required="required" name="assignee" id="assignee" multiple="multiple" data-placeholder= "Select Employees">                   
		                         <% for(Object[] obj : EmployeeList) { %>
		                         <option value="<%=obj[0]%>"><%=obj[1]%> , <%=obj[2]%></option>
		                         <%} %>
		                      </select>
		                  </div>
		                </div> 
		                
		                  <div class="col-md-1">
		                       <div class="form-group">
		                            <label class="control-label">RFA Date</label>
		                            <span class="mandatory" style="color: #cd0a0a;">*</span>
						  			<input  class="form-control form-control date"  data-date-format="dd-mm-yyyy" id="datepicker1"
						  			 name="rfadate"  required="required" style="width: 110%;">						
		                        </div>
		                  </div>   
		                  
		                   <div class="col-md-2">
		                     <div class="form-group">
		                         <label class="control-label">CC To</label>
		                         <select class="form-control selectdee" name="CCEmpName" id="CCEmpName" multiple="multiple" data-placeholder= "Select Employees">                   
		                         <% for(Object[] obj : EmployeeList) { %>
		                         <option value="<%=obj[0]%>"><%=obj[1]%> , <%=obj[2]%></option>
		                         <%} %>
		                      </select>
		                  </div>
		                </div> 
		            
		          </div>
		                   
		            <br>
		      
		            <div class="row">
		                  <div class="col-md-2" >
		                      <label class="control-label"> Problem Statement</label>
		                      <span class="mandatory" style="color: #cd0a0a;">*</span>
		                  </div>
		                  <div class="col-md-10" >
		                      <textarea class="form-control" rows="2" cols="30" placeholder="Max 1000 Characters" name="statement" id="statement" maxlength="1000" required="required"></textarea>
		                  </div>
		            </div>
		            
		            <br>
		            
		          <div class="row">
		             <div class="col-md-2">
		                 <label class="control-label">Description</label>
		                   <span class="mandatory" style="color: #cd0a0a;">*</span>
		              </div>
		            <div class="col-md-10">
	      			<div class="card"  >
	      			<h5 class="heading ml-4 mt-3" id="editorHeading" style="font-weight:500;color: #31708f;"></h5><hr>
    				<div class="card-body" >
					<div class="row">	
					<div class="col-md-12" align="left" style="margin-left: 0px; width: 100%;">
					<div id="Editor" class="center"></div>
					<textarea name="description" id="description" style="display: none;"></textarea>
					<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
					</div>
					</div>
					</div>
					</div>
	         		</div>
		         </div>
		          
		            
		            
		            <br>
		            
		            <div class="row">
		                  <div class="col-md-2">
		                      <label class="control-label">References</label>
		                      <span class="mandatory" style="color: #cd0a0a;">*</span>
		                  </div>
		                  <div class="col-md-10">
		                       <textarea class="form-control" rows="2" cols="30" placeholder="Max 1000 Characters" name="reference" id="reference" maxlength="1000" required="required"></textarea>
		                      
		                  </div>
		            </div>
		            
		            <br>
		            
		            <div class="row">
		                  <div class="col-md-2">
		                      <label class="control-label">Attachment</label>
		                  </div>
		                  <div class="col-md-4">
		                      <input class="form-control" type="file" name="attachment"  id="attachment" accept="application/pdf , image/* " 
		                      oninput="validateFile(this)">
		                  </div>
		                  <div id="filealert"></div>
		            </div>
		             <br>
		        <div class="form-group" align="center" >
					 <button type="submit" class="btn btn-primary btn-sm submit "  value="SUBMIT" id="rfaAddSubBtn" onclick ="return confirm('Are you sure to submnit?')">SUBMIT </button>
					 <a class="btn btn-info btn-sm  shadow-nohover back" href="RfaAction.htm" >Back</a>
				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 		
   </div>    
        

        
        </div>

<input type="hidden" value="<%=EmpId %>" name="EmpId">
</form>
</div>
  
  <script type="text/javascript">

  $('#reference,#description,#statement').keyup(function (){
	  $('#reference,#description,#statement').css({'-webkit-box-shadow' : 'none', '-moz-box-shadow' : 'none','background-color' : 'none', 'box-shadow' : 'none'});
		  });
	  
  
	$('#datepicker1').daterangepicker({
		"singleDatePicker" : true,
		"linkedCalendars" : false,
		"showCustomRangeLabel" : true,
		"startDate" : new Date(),
		"cancelClass" : "btn-default",
		showDropdowns : true,
		locale : {
			format : 'DD-MM-YYYY'
		}
	});
	
	 $("input").on("keypress", function(e) {
		    if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
	 
	 $("textarea").on("keypress", function(e) {
		    if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});

	 
	 
 var editor_config = {
				
				toolbar: [{
				          name: 'clipboard',
				          items: ['PasteFromWord', '-', 'Undo', 'Redo']
				        },
				        {
				          name: 'basicstyles',
				          items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'Subscript', 'Superscript']
				        },
				        {
				          name: 'links',
				          items: ['Link', 'Unlink']
				        },
				        {
				          name: 'paragraph',
				          items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
				        },
				        {
				          name: 'insert',
				          items: ['Image', 'Table']
				        },
				        {
				          name: 'editing',
				          items: ['Scayt']
				        },
				        '/',

				        {
				          name: 'styles',
				          items: ['Format', 'Font', 'FontSize']
				        },
				        {
				          name: 'colors',
				          items: ['TextColor', 'BGColor', 'CopyFormatting']
				        },
				        {
				          name: 'align',
				          items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
				        },
				        {
				          name: 'document',
				          items: ['Print', 'PageBreak', 'Source']
				        }
				      ],
				     
				    removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar',

					customConfig: '',

					disallowedContent: 'img{width,height,float}',
					extraAllowedContent: 'img[width,height,align]',

					height: 250,

					
					contentsCss: [CKEDITOR.basePath +'mystyles.css' ],

					
					bodyClass: 'document-editor',

					
					format_tags: 'p;h1;h2;h3;pre',

					
					removeDialogTabs: 'image:advanced;link:advanced',

					stylesSet: [
					
						{ name: 'Marker', element: 'span', attributes: { 'class': 'marker' } },
						{ name: 'Cited Work', element: 'cite' },
						{ name: 'Inline Quotation', element: 'q' },

						
						{
							name: 'Special Container',
							element: 'div',
							styles: {
								padding: '5px 10px',
								background: '#eee',
								border: '1px solid #ccc'
							}
						},
						{
							name: 'Compact table',
							element: 'table',
							attributes: {
								cellpadding: '5',
								cellspacing: '0',
								border: '1',
								bordercolor: '#ccc'
							},
							styles: {
								'border-collapse': 'collapse'
							}
						},
						{ name: 'Borderless Table', element: 'table', styles: { 'border-style': 'hidden', 'background-color': '#E6E6FA' } },
						{ name: 'Square Bulleted List', element: 'ul', styles: { 'list-style-type': 'square' } },
						{ filebrowserUploadUrl: '/path/to/upload-handler'},
					]
				} ;
CKEDITOR.replace('Editor',editor_config);
	 
$('#myfrm').submit(function() {
	 var data =CKEDITOR.instances['Editor'].getData();
	 $('textarea[name=description]').val(data);
	 });
	 
</script> 
<script>
function validateFile(input) {
  const file = input.files[0];
  const allowedTypes = ['image/jpeg', 'image/png', 'application/pdf'];

  if (!file) return;

  if (!allowedTypes.includes(file.type)) {
    document.getElementById('filealert').innerText = 'Only image and PDF files are allowed!';
    // Clearing the file input to prevent submission
    input.value = '';
  } else {
    document.getElementById('filealert').innerText = '';
  }
}
</script>

</body>
</html>