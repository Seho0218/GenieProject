<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./inc/top.jspf"%>
<link rel="stylesheet" href="/js_css/css/cart_style.css" type="text/css"/>

<div class="wrapper">
    <div class="cart">
        <h1><i class="fa-solid fa-cart-plus"></i><a href="#">장바구니</li></a></h1>
        <div class="line"></div>
        <div class="cart-product">
            <div><input type="checkbox" id="allChk"/></div>
            <div>상품이미지</div>
            <div>상품정보</div>
            <div>가격</div>
            <div>수량</div>
            <div>합계</div>
        </div>
 
        <div class="line"></div>
        <form type="post" action="/payment" id="multiChk">
            <c:forEach var="cvo" items="${clist}">
                <div class="cart-list">
                    <input type="checkbox" id="cartList" name="cartList" value="${cvo.cart_num}" onclick="javascript:cart.checkItem();"/>
                    <input type="hidden" name="cart_num" value="${cvo.cart_num}"/>
                    <div><img src='${cvo.product_image1}'></div>
                    <div>${cvo.product_name}</div>
                        <input type="hidden" name="Product_name" value="${cvo.product_name}"/>
                    <div><fmt:formatNumber value="${cvo.product_price}" pattern="#,###원"/></div>

                        <input type="hidden" name="Product_price" value="${cvo.product_price}">

                    <div><input type="text" name="cart_qty" id="cart_qty${cvo.cart_num}" class="cart_qty" size="2" value="${cvo.cart_qty}" onkeyup="javascript:cart.changePNum(${cvo.cart_num});" readonly="readonly"/></div>
                    <div>
                        <div onclick="javascript:cart.changePNum(${cvo.cart_num});"><i class="fas fa-arrow-alt-circle-up up"></i></div>
                        <div onclick="javascript:cart.changePNum(${cvo.cart_num});"><i class="fas fa-arrow-alt-circle-down down"></i></div>
                    </div>
                    <div input type="hidden" size="4" maxlength="4">${cvo.product_price*cvo.cart_qty}원</div>
                    <div><input type="button" style="background:#b90e0a; border:none; padding: 6px; border-radius:8px; color: #fff;" value='Del' cart_num="${cvo.cart_num}"/></div>
                </div>
            </c:forEach>
            <input type="button" value="선택상품삭제" id="delete" onclick="javascript:cart.delCheckedItem();">
            <div input type="text" id="total" name="total" value="0"></div>

            <span class="submit-wrapper">
                <a href="http://localhost:9070/">계속 쇼핑하기</a>
                <input type="submit" id="buy" value="구매하기"/>
            </span>
        </form>
    </div>
</div>
<script src="/js_css/js/cart_js.js"></script>