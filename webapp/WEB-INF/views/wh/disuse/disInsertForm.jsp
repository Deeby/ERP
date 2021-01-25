<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ : ����ϼ� �ۼ� </title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-xs-12">

 <section id="tab-menus">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Tabs navs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#firstMenu" data-type = "prod"><i class="fab"></i> ��ǰ �����</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#secondmenu" data-type = "mat"><i class="fab"></i> ������ �����</a>
                        </li>
                       
                    </ul>
                     <!-- Tabs Content -->
                    <div class="tab-content">
                        <div id="firstMenu" class="tab-pane active">
                            <h3 class="mt-4">��ǰ �����</h3>
                    
                        </div>
                        <div id="secondmenu" class="tab-pane">
                            <h3 class="mt-4">������ �����</h3>
 							<table id = "mat_dis">
                            
                            </table>

                        </div>
                         <form id = "prod_form">
                            
                            <div class="input-group mb-3">
  							<div class="input-group-prepend">
    							<span class="input-group-text" id="inputGroup-sizing-default">��⳯¥</span>
							  </div>
							  <input name="dis_date"type="date" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" style = "margin-right: 10px">
  							<div class="input-group-prepend">
    							<span class="input-group-text" id="inputGroup-sizing-default">��ǰ�̸�</span>
							  </div>
							  <input name = "stuff_name" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" style = "margin-right: 10px">
							
  							<div class="input-group-prepend" >
    							<span class="input-group-text" id="inputGroup-sizing-default">����</span>
							  </div>
							  <input type="text" name = "sector_no" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" style = "margin-right: 10px ">
							</div>
							
							<div class="input-group mb-3" style="width: 800px">
							<div class="input-group-prepend" >
    							<span class="input-group-text"  id="inputGroup-sizing-default">����̸�</span>
							  </div>
							  <input type="text" class="form-control" name= "emp_name" aria-label="Default" aria-describedby="inputGroup-sizing-default" style = "margin-right: 50px">
							<div class="input-group-prepend" >
    							<span class="input-group-text" id="inputGroup-sizing-default">â��</span>
							  </div>
							  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
							  <input type="hidden" value="prod" name = "what" id = "what">
							  <button id = "search_prod" class = "btn btn-success" type="button" onclick="Prodbtk()">�˻�</button>
							</div>
                  </form>
                            
                            <div class="overflow-auto" style="width: 1000px; height: 700px">
                            <table id = "prod_dis" class = "table">
                            
                            </table>
                            </div>
                    </div>
                  
                </div>
            </div>
        </div>
    </section>
    
         </div>
    </div>
    <div class="row">
    
    <div class = "col-4" style="margin-top: 50px;">
    <div class="card bg-secondary text-white shadow " id = "addBtn" data-toggle = 'modal' data-target = '#viewModal' data-remote="${cPath }/use/app/view">
                    <div class="card-body">
                      	��� ���
                      <div class="text-white-50 small">#4e73df</div>
                    </div>
                  </div>
     
    
    </div>
    </div>
</div>


<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">��� �� ��ȸ</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id = "modalbody">
      
      <select id = "Lwarelist"  class="dynamicElement form-control col-md-6" data-url = "${cPath }/warehouse/lwarelist" name = "search.searchType">
 <option value = "">â�� ��������</option>
 </select>
 
<select id = "wareList"  class="dynamicElement form-control col-md-6" data-url = "${cPath }/warehouse/warelist" name = "store_no">
<option value ="">â������</option>
</select>
      
      
      </div>
        <iframe src="${cPath}/warehouse/shape" width="900px" height="400px" id = "storeBox" ></iframe>
        <div>
        	<form id = "dis">
        	<table class = "table">
        	<thead>
        	<tr>
        	<td>��ġ</td>
        	<td>��ǰ��</td>
        	<td>����</td>
        	<td>����</td>
        	<td>��ⰹ��</td>
        	<td>Ȯ��</td>
        	</tr>
        	</thead>
        	<tbody id = "sectorbody">
        	
        	</tbody>
        	</table>
        	</form>
        </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary"  onclick="OrderFirm(event)">���Ȯ��</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button>
      </div>
       <script type="text/javascript" src="${cPath}/resources/js/dynamicSelect.js"></script>
<script type="text/javascript">

function Prodbtk(){
	
	let prod_data = $("#prod_form").serialize()
	console.log(prod_data)

$.ajax({
	url : "${cPath}/disuse/list/mat",
	data : prod_data,
	method : "get",
	dataType : "html", // Accept,text/html , Content-Type:text/html accept�� 
	success : function(resp) {
		$("#prod_dis").html(resp)
	},
	error : function(error) {
		console.log(error.status + " : " + error.responseText);
	}
})
	
}	

Prodbtk()

$(".nav-link").on("click",function(){
	
	
	$("input[name=dis_date]").val("")
	$("input[name=stuff_name]").val("")
	$("input[name=sector_no]").val("")
	$("input[name=emp_name]").val("")
	
	
	let type = $(this).data("type")
	
	$("#what").val(type)

	Prodbtk()
})



var optionPtrn = "<option value='%V'>%T</option>";

var prod_lguTag = $("#Lwarelist").data("success", function(resp){
	var html = "";
	$.each(resp, function(idx, lprod){
		html += optionPtrn.replace("%V", lprod.lstore_no).replace("%T", lprod.lstore_name);			
	});
	prod_lguTag.append(html);
}).on("change", function(){
	let prod_lgu = $(this).val();

	prod_buyerTag.trigger("renew", {
		LwareHouse_no : prod_lgu
	});
});
var prod_buyerTag = $("#wareList").data("success", function(resp){
	var html = "<option value>â�� ����</option>";
	$.each(resp, function(idx, buyer){
		html += optionPtrn.replace("%V", buyer.store_no).replace("%T", buyer.store_name);
	});
	prod_buyerTag.html(html);
}).on("change", function(){ // â���� ������ �Ǿ��� ��
	let store_no = $("#wareList").val()
	let searchType = $("#Lwarelist").val().trim()
	
	let Store_no = $("#wareList").val()
				$('#storeBox')[0].contentWindow.changeJsonPath(Store_no)
				
})

function selectGrid(sector_no){
		let path = "${cPath}/warehouse/callsector"
		
		$.ajax({
			url : path,
			data : {sector_no : sector_no},
			method : "post",
			dataType : "json", // Accept,text/html , Content-Type:text/html accept�� 
			success : function(resp) {
				let trg = [];
				$.each(resp,function(idx, sector){
					let tdset = $("<tr>").append(
					$("<td>").html("<input name = 'sector_no' type='text' value = '"+sector.sector_no+"' disabled > "),		
					$("<td data-name = '"+sector.stuff_no+"' >").html("<input name = 'stuff_name' type='text' value = '"+sector.stuff_name+"'disabled><input type = 'hidden' name = 'stuff_no'> "),		
					$("<td>").html("<input name='stuff_cnt' type='text' value = '"+sector.stuff_cnt+"'disabled> "),
					$("<td>").html("<input type='text' value = '"+sector.stuff_size+"'disabled> "),		
					$("<td>").html("<input name = 'dis_cnt' type='number' disabled> <input type = 'hidden' name = 'emp_no'> "),
					$("<td>").html("<input type='checkbox' class = 'chkbox'><input type = 'hidden' name = 'Lware_no'> ")
					)
					trg.push(tdset)
				})
				$("#sectorbody").html(trg)
			},
			error : function(error) {
				console.log(error.status + " : " + error.responseText);
			}
		})
	}

$(".dynamicElement").dynamicSelect();

$("#sectorbody").on("click",".chkbox",function(){
	
	let Topele = $(this).parent().parent()
	
	Topele.toggleClass("table-success")
     if( Topele.hasClass("table-success") ){
    	Topele.find("input[type=number]").prop("disabled",false)
    }else{
    	Topele.find("input[type=number]").prop("disabled",true)
    }
})
function stuffcntVaild(cnt,discnt,name){
	if( cnt-discnt < 0){
		return false
	}
	return true
}
function OrderFirm(event){

		let check;
	$(".table-success").each(function(idx,item){
	
		let name = $(this).children().find("input[name=stuff_name]").val()
		let cnt = $(this).children().find("input[name=stuff_cnt]").val()
		let discnt = $(this).children().find("input[name=dis_cnt]").val()
		
		check = stuffcntVaild(cnt,discnt,name)
		if(check == false) {
			alert(name + " ��ǰ�� ��ⷮ�� �� ������� �ʰ��߽��ϴ�.")
			check = false 
			return
		}
	})
	if(check == false) return;
	$(".table-success").each(function(idx,item){
		$(this).children().find("input[name=sector_no]").prop("disabled",false)
		$(this).children().find("input[name=sector_no]").attr("name","dislist["+idx+"].sector_no")
		let stuff_no = $(this).children().eq(1).data("name")
		$(this).children().find("input[name=stuff_no]").val(stuff_no)
		$(this).children().find("input[name=stuff_no]").attr("name","dislist["+idx+"].stuff_no")
		$(this).children().find("input[name=dis_cnt]").attr("name","dislist["+idx+"].stuff_cnt")
		$(this).children().find("input[name=emp_no]").attr("name","emp_no")
		$(this).children().find("input[name=Lware_no]").val( $("#Lwarelist").val() )
	})
	let date =  $("#dis").serialize()
	let path = "${cPath}/disuse/app/regist"
	
	$.ajax({
			url : path,
			data : date,
			method : "post",
			dataType : "text", // Accept,text/html , Content-Type:text/html accept�� 
			success : function(resp) {
				console.log(resp)
			},
			error : function(error) {
				console.log(error.status + " : " + error.responseText);
			}
		})
	$("#Lwarelist").val("")
	$("#wareList").val("")
	$("#storeBox").attr("src","${cPath}/warehouse/shape")
	$("#sectorbody").html("")
}


</script>
    </div>
  </div>
</div>




</body>
<script type="text/javascript" src="${cPath}/resources/js/dynamicSelect.js"></script>
<script type="text/javascript">

$("#addBtn").on("click",function(){
	var modal = $(this);
	var modalbody = $(".modal-body")

	modalbody.show();
})



</script>
</html>