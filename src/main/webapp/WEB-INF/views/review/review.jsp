<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value="${app}/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<link rel="stylesheet" type="text/css" href="${app}/resources/css/display.css">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/prd-list.css">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/search.css">  
<script type="text/javascript" src="${app}/resources/js/commonFunction.js"></script>    

</head>


<body>
	<input type="hidden" name="pageNum" value="${reviewpageMaker.cri.pageNum}"/>
  	<input type="hidden" name="amount" value="${reviewpageMaker.cri.amount}"/>
	<input type="hidden" name="prd_board_id" value="${prd_board_id}"/>
	<input type="hidden" name="categoryCode" value="${categoryCode}"/>
	<input type="hidden" name="sort" value="1"/>

	<!-- 상품평 tab -->
	<div class="pages page3" id="viewPage03">
		<div id="itemOptEvalInfo">

			<!-- 구매고객 총 평점 -->
			<div class="content-area review-point">
				<h3>구매고객 총 평점</h3>
				<!--review-star -->
				<div class="review-star">
					<div class="starbg type-big pt10">
						<p class="score">
							<span class="hiding">5점</span>
						</p>
					</div>
					<span class="like-point" aria-label="포인트"><em>5.0, 추후
							plsql 생성 시 리뷰마다 업데이트 예정</em></span>
				</div>
				<!-- //.review-star -->
			</div>
			<!--// 구매고객 총 평점 -->

			<!-- 상품평 tab의 댓글 리스트 -->
			<div class="content-area txt-review" id="reviewContentArea">

				<h3>
					상품평 <em class="total-num">${reviewpageMaker.total}</em>건
					<c:if test="${1==1 }">
						<div style="float: right;">
							<button ga-category="상품상세" ga-action="상품평" ga-label="상품평 쓰기"
								class="btn btn-lineblack small itemEvalRegBtn gp_className">
								<span><i class="icon review"></i>상품평 쓰기</span>
							</button>
						</div>
					</c:if>
				</h3>

				<!--review-list-->
				<div class="text-review-list-std">
					<ul class="txt-review-list">
						<c:forEach items="${reviewDTO}" var="dto">
							<li class="review-item">
								<div class="review-top">
									<div class="top-left">
										<c:if test="${dto.star==1}">
											<div class="starbg pt2">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==2}">
											<div class="starbg pt4">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==3}">
											<div class="starbg pt6">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==4}">
											<div class="starbg pt8">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==5}">
											<div class="starbg pt10">
												<p class="score"></p>
											</div>
										</c:if>
								
										<span class="nick">${dto.review_id }</span>
										<span class="nick">${dto.user_id }</span>
										
									</div>
									<div class="top-right">
										<span class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.ins_dt}"
												/></span>
									</div>
								</div>
								<!--review-option-->
								<div class="review-option">
									<c:choose>
											<c:when test="${dto.option1 == null}">
												<em>색상/속성 : 단일상품</em><br>
											</c:when>
											<c:when test="${dto.option1 != null && dto.option2 == null}">
												<em>${dto.option1 }</em><br>
											</c:when>
											<c:when test="${dto.option1 != null && dto.option2 != null}">
												<em>${dto.option1 }/${dto.option2 }</em><br>
											</c:when>
									</c:choose>
								</div> 
								<!--//review-option--> 
								

								<!-- pdwrap -->
								<div class="pdwrap photo-review">
									<div class="pdlist-wrap">
										<c:forEach items="${dto.fileList}" var="file">
											<div class="pdthumb">
												<a href="javascript:;">
													<div class="thumb">
														<img src="${file.upload_path}" alt="">
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div> <!-- 동영상 --> <!-- 동영상 --> <!-- //.pdwrap --> <!--review-content-->
								<div class="review-content">
									<div class="review-txt">${dto.content }</div>
									<h1><sec:authentication property="principal" /></h1><br>

								</div> <!--//review-content-->
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--//review-list-->

				<div class="paging itemEvalPaging">
					<div class="page-prevarea">
						
						<c:if test="${reviewpageMaker.prev }">
							<a href="javascript://" onclick="goToPageNumCore(1)"
								class="page-first" aria-label="처음페이지 이동"> <i class="icon"></i><span
								class="hiding">처음페이지 이동</span>
							</a>
							<a href="javascript://"
								onclick="goToPageNumCore(${reviewpageMaker.cri.pageNum - 1})"
								class="page-prev" aria-label="이전페이지 이동"> <i class="icon"></i><span
								class="hiding">이전페이지 이동</span>
							</a>
						</c:if>
						
						<c:forEach var="num" begin="${reviewpageMaker.startPage }"
							end="${reviewpageMaker.endPage }">
							<c:if test="${reviewpageMaker.cri.pageNum == num}">
								<strong aria-label="현재 선택페이지">${num}</strong>
							</c:if>
							<c:if test="${reviewpageMaker.cri.pageNum != num}">
								<a href="javascript://" onclick="goToPageNumCore(${num})">${num}</a>
							</c:if>
						</c:forEach>

						<c:if test="${reviewpageMaker.next }">
							<a href="javascript://"
								onclick="goToPageNumCore(${reviewpageMaker.cri.pageNum + 1})"
								class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span
								class="hiding">다음페이지 이동</span></a>
							<a href="javascript://"
								onclick="goToPageNumCore(${reviewpageMaker.realEnd})"
								class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span
								class="hiding">마지막페이지 이동</span></a>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//content-area // 상품평텍스트-->

	<!--// 상품평 -->

	<input type="hidden" name="pageNum" value="${reviewpageMaker.cri.pageNum}"/>
  	<input type="hidden" name="amount" value="${reviewpageMaker.cri.amount}"/>
	<input type="hidden" name="categoryCode" value="${categoryCode}"/>
	<input type="hidden" name="sort" value="1"/>
	
</body>

<script>

/*
 * 상품평 쓰기 버튼
 */
$('.itemEvalRegBtn').on("click",function(e) {
	e.preventDefault();
	
	const prd_board_id = '200';
	const memberId = '1';

	let popUrl = "${app}/r/Enroll/" + memberId+ "?prd_board_id=" + prd_board_id;
	console.log(popUrl);
	let popOption = "width = 600px, height=700px, top=300px, left=300px, scrollbars=yes";
	
	window.open(popUrl,"리뷰 쓰기",popOption);
	
});

</script>

<script>
	$(document).ready(function(){

	});

	/* 댓글 리스트 생성 - test */
	function setReviewListTest(){
	      console.log("set review");
	      var str = "";
	     $.ajax({
	        type : "GET"
	        ,url : "${app}" + "/r/list"
	        ,dataType: 'json'
	        ,data : {
	          pageNum : 2,
	 		   amount : 10,
	 		   prd_board_id : "${prd_board_id}",
	 		   categoryCode : "${categoryCode}",
	 		   sort : 1
	        }
	        
	        ,success : function(data){
	       	 console.log(data);
	       	 // review information
	       	 console.log(data[0]);
	       	 // review paging info
	       	 console.log(data[1]);
	        }
	     });
	}
   
   	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
   
	//  unix time stamp to Date
   	function UnixTimeToDate(UnixTime){
		var origin = new Date(UnixTime);
		
		var year = origin.getFullYear();
		var month = ('0' + (origin.getMonth() + 1)).slice(-2);
		var day = ('0' + origin.getDate()).slice(-2);
		
		var val_time = year+"-"+month+"-"+day;
		
		return val_time;
   	}

	function ReadOptions(option1, option2){
		var val_str="";
		console.log(option1,option2);
		
		if(option1 == null){
			val_str="<em>색상/속성 : 단일상품</em><br>";
		} else if(option1 != null && option2 == null){
			val_str="<em>"+option1+"</em><br>";
		} else if(option1 != null && option2 != null){
			val_str="<em>"+option1+"/"+option2+"</em><br>";
		}
		console.log(val_str);
		return val_str;
	}
   
   	function ReadStarRate(star) {
	   var val_str="";
	   
	   switch (star) {
	   		case 1:
			  val_str="<div class='starbg pt2'><p class='score'></p></div> ";
			  break;
	   		case 2:
			  val_str="<div class='starbg pt4'><p class='score'></p></div> ";
			  break;
	   		case 3:
			  val_str="<div class='starbg pt6'><p class='score'></p></div> ";
			  break;
	   		case 4:
			  val_str="<div class='starbg pt8'><p class='score'></p></div> ";
			  break;
	   		case 5:
			  val_str="<div class='starbg pt10'><p class='score'></p></div> ";
			  break;
	   }
	   
	   return val_str;
   	}
   
   	/* 댓글 리스트 생성 */
   	function setReviewList(){
       console.log("set review real");
       var sort = $("input[name='sort']").val();
	   var pageNum = $("input[name='pageNum']").val();
	   var prd_board_id = $("input[name='prd_board_id']").val();
	   var categoryCode = $("input[name='categoryCode']").val();
	   var amount = $("input[name='amount']").val();
	   var totalAmount = $("#total-amount");

	   console.log(sort);
	   console.log(pageNum);
	   console.log(prd_board_id);
	   console.log(categoryCode);
	   console.log(amount);
	   console.log(totalAmount);
	   try {
      	   loading(true);
          } catch (e) {
          }
      $.ajax({
         type : "GET"
         ,url : "${app}" + "/r/list"
         ,dataType: 'json'
         ,data : {
           pageNum : pageNum,
  		   amount : amount,
  		   prd_board_id : prd_board_id,
  		   categoryCode : categoryCode,
  		   sort : sort
         }
         ,crossDomain: true
         ,success : function(data){
        	console.log(data);
			console.log(data[0]);
        	 
			var str = "";
			// review content part ajax
			str += "<ul class='txt-review-list'>";
			for (let i = 0; i < data[0].length; i++) {
				// review item start
				str += "<li class='review-item'>";
				str += "<div class='review-top'>";
				
				str += "<div class='top-left'>"; // start of top-left

				str += ReadStarRate(data[0][i].star);

				str += "<span class='nick'>"+data[0][i].review_id+"</span> ";
				str += "<span class='nick'>"+data[0][i].user_id+"</span>";

				str += "</div>"; // end of top-left

				str += "<div class='top-right'>"; // start of top-right
				str += "<span class='date'>"+ UnixTimeToDate(data[0][i].ins_dt) + "</span>";
				str += "</div>"; // end of top-right
				
				str += "</div>"; // end-review-top
				
				// product option of review item
				str += "<div class='review-option'>";
				str += ReadOptions(data[0][i].option1,data[0][i].option2);
				str += "</div>";
				
				// img of review item
           	    str += "<div class='pdwrap photo-review'>";
           	    str += "<div class='pdlist-wrap'>";
				if(data[0][i].file_yn != 0){
					for (let j = 0; j < data[0][i].fileList.length ; j++){
	            	   str += "<div class='pdthumb'>";
	            	   str += "<a href='javascript:;'>";
	            	   str += "<div class='thumb'>";
	            	   str += "<img src=' ";
	            	   str += data[0][i].fileList[j].upload_path;
	            	   str += " '>";
	            	   str += "</div>";
	            	   str += "</a>";
	            	   str += "</div>";
					}
                }
       		    str += "</div>"; // end of pdlist-wrap
       		    str += "</div>"; // end pdwrap photo-review
       		    
				// content of review item
				str += "<div class='review-content'>";
				str += "<div class='review-txt'>"+data[0][i].content+"</div>";
				str += "</div>";
				
				str += "</li>"
				// review item end
			}
			str += "</ul>";
			$(".text-review-list-std").html(str);
			alert('end ajax');
            
			// paging part ajax
            var pstr = ""
                var pageMaker = data[1];
                if (pageMaker.prev){
                	pstr += "<a href='javascript://' onclick='goToPageNumCore(1)' class='page-first' aria-label='처음페이지 이동'> <i class='icon'></i><span class='hiding'>처음페이지 이동</span></a>"
                	pstr += "<a href='javascript://' onclick='goToPageNumCore(" + String(parseInt(pageMaker.cri.pageNum) - 1) + ")' class='page-prev' aria-label='이전페이지 이동'>"
    				pstr += "<i class='icon'></i><span class='hiding'>이전페이지 이동</span></a>"
                }
                for(let i = parseInt(pageMaker.startPage); i <= parseInt(pageMaker.endPage); i++){
                	if (i == pageMaker.cri.pageNum){
                		pstr += "<strong aria-label='현재 선택페이지'>" + i + "</strong>"
                	}
                	else {
                		pstr += "<a href='javascript://' onclick='goToPageNumCore(" + i + ")'>" + i + "</a>"
                	}
                }
                if (pageMaker.next){
                	pstr += "<a href='javascript://' onclick='goToPageNumCore(" + String(parseInt(pageMaker.cri.pageNum) + 1) + ")' class='page-next' aria-label='다음페이지 이동'> <i class='icon'></i><span class='hiding'>다음페이지 이동</span></a>"
        			pstr += "<a href='javascript://' onclick='goToPageNumCore(" + pageMaker.realEnd + ")' class='page-last' aria-label='마지막페이지 이동'> <i class='icon'></i><span class='hiding'>마지막페이지 이동</span></a>"
                }
                $(".page-prevarea").html(pstr);
                try {
             	   loading(false);
    	         } catch (e) {
    	         }
         },error : function(e) {
            console.log("review list");
         }
         ,complete: function () {                     
        	 $("#div_ajax_load_image").hide();       
         }
      });
   	}
   
   	function goToPageNumCore(pageNum){
	   $("input[name='pageNum']").val(pageNum);
	   
	   setReviewList();
   	}

   
   	//sort 바꾸기
   	function searchSort(type) {
		  $("input[name='sort']").val(type);
		  $("input[name='pageNum']").val(1);
		  $("#sort" + type).siblings().removeClass("active");
		  $("#sort" + type).addClass("active");
		  
		  setProductList();
		  
	}
   
</script>

</html>