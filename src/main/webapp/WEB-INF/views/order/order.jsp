<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<main class="cmain main" role="main" id="mainContents">
	<!-- 메인페이지 'main' 클래스 추가 -->
	<div class="container">
		<div class="cbody gird-full">
			<div class="contents">
				<div class="order-wrap">


					<div class="order-content">
						<!-- 상품정보 -->
						<h3 class="title22 selected only">
							<button data-modules-collapse="" class="accordion-trigger"
								aria-expanded="false">
								상품정보 <span class="num" id="ordItemCnt"></span><i class="icon"></i>
							</button>
						</h3>
						<c:forEach items="${orderInfo}" var="order">
						<div class="accordion-panel selected" role="region" aria-label="">
							<div class="order-list" id="orderItems">
								<ul>

									<li name="orderItem">
									<input type="hidden" name="slitmNm" value="${order.prd_board_id }"> 
										<a href="#" target="_blank">
										<span class="img">
										<img src="#" onerror="#">
										</span>
										
											<div class="box">
												<span class="tit">${order.prd_board_id }</span>
												<div class="info">
													<ul>

														<li>${order.ordQty }개<input type="hidden" name="ordQty" value="1"
															readonly="readonly"></li>
													</ul>
												</div>


												<span class="price"><strong></strong>원</span>
											</div>
									</a></li>

								</ul>
							</div>
						</div>
						</c:forEach>
						<!-- //상품정보 -->
						
						<div class="sticky-ui-wrapper util-option-sticky"><div class="sticky-placeholder" style=""></div><div class="util-option sticky" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;" style="">
                                <div class="sticky-inner">
                                    <h4 class="title20">총 결제금액</h4>
                                    <ul class="payment-list">
                                                <li>
                                                    <div id="orderAmt">
                                                        <span class="tit">총 판매금액</span>
                                                        <span class="txt"><strong>89,000</strong>원</span>
                                                    </div>
                                                    
                                                    
                                                    
                                                    <div id="addDlvCostDiv" class="tooltip-case hidden adddel_order addDlvCostArea">
                                                        <div class="tit">
                                                            지역별 추가 배송비
                                                            <div class="ui-tooltip">
                                                                <span class="nav" data-modules-tooltip="href:#localDeliver"><i class="icon que-mark"></i></span>
                                                                <div id="localDeliver" class="tooltip-conts">
                                                                    <dl>
                                                                        <dt>제주/도서지역 추가 배송비 <br> 부과 안내</dt>
                                                                        <dd>상품별 배송비, 배송지, 구매수량에 따라 추가 배송비를 재계산합니다. <br> 제주/도서지역 주문시, 부분취소/환불이 불가능합니다. <br> 자세한 내용은 고객센터로 연락주세요. <br> (1600-0000)</dd>

                                                                    </dl><button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button><button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                                                            </div>
                                                        </div>
                                                        <div class="txt"><strong>0</strong>원</div>
                                                    </div>

                                                    
                                                    
                                                    
                                                </li>
                                            
                                        

                                        <li>
                                            <div class="total">
                                                <span class="tit">최종 결제금액</span>
                                                
                                                    
                                                    
                                                        <span class="txt" id="lastStlmAmtDd"><strong>89,000</strong>원</span>
                                                    
                                                
                                            </div>
                                        </li>
                                        
                                    </ul>
                                    <div class="btngroup agreeCheck">
                                        <button type="button" class="btn btn-default medium" onclick="order();">
                                        	<span>
		                                	
		                                		
		                                			결제
		                                		
		                                		
		                                	                                        	
                                        	</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            </div>
						
						
					</div>
					
					
				</div>
			</div>
		</div>
		<!-- //.container -->
	</div>
</main>
