<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./inc/top.jspf"%>
<link rel="stylesheet" href="/js_css/cart_style.css" type="text/css"/>

<div class="wrapper">
    <div class="cart">
        <h1><i class="fa-solid fa-cart-plus"></i><a href="#">장바구니</a></h1>
        <div class="line"></div>
        <div class="cart-product">
            <div>상품이미지</div>
            <div>상품정보</div>
            <div>수량</div>
            <div>상품가격</div>
        </div>
        <div class="line"></div>
        <div class="cart-list">
            <ul>
                <li>{vo.product_image1}</li>
                <li>{vo.product_name}</li>
                <li>{vo.product_quantity}</li>
                <li>{vo.product_price}</li>
            </ul>
        </div>
        <div class="cart-list">
            <ul>
                <li>{vo.product_image1}</li>
                <li>{vo.product_name}</li>
                <li>{vo.product_quantity}</li>
                <li>{vo.product_price}</li>
            </ul>
        </div>
        <div class="cart-list">
            <ul>
                <li>{vo.product_image1}</li>
                <li>{vo.product_name}</li>
                <li>{vo.product_quantity}</li>
                <li>{vo.product_price}</li>
            </ul>
        </div>
        <input type = "submit" id="buy" value = "구매하기"/>
    </div>
</div>