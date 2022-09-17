<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./inc/top.jspf"%>
<style>
/* ---------------------뒤에 회색배경설정----------------------- */
.index {
	position: absolute;
	width: 100%;
	height: auto;
	margin: 0;
	padding: 0;
	background: #fff;
}
/* --------------첫번째 배너 설정---------------- */
.index-list a img{
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: auto;
}
/* --------------------카테고리 설정--------------------- */
.category h2{
	margin: 10vh 0;
	font-size: 3rem;
	text-align: center;
}
.category-list{
	display: grid;
	grid-template-columns: 11vw 11vw 11vw 11vw 11vw 11vw;
	justify-content: space-evenly;
	row-gap: 3rem;
	padding: 0 4%;
}
.category-list img{
	width: 100%;
	height: auto;
	border-radius: 50%;
	box-shadow: 0 0 40px #b4b4b4;
}
.category-list span{
	font-size: 2.2rem;
	color: #333;
	text-align: center;
}
/* ----------------------------------랭킹페이지----------------------------------------- */
.ranking-list h1{
	margin: 10vh 0;
	font-size: 3rem;
	text-align: center;
}
.ranking-list img{
	width: 30%;
	margin: 0 .3%;
}
/* ----------------브랜드 span설정------------------ */
.brand-title h1{
	margin-left: 7vw;
}
.brand-title span{
	margin-left: 34vw;
}

/* --------------------------------베스트 브랜드, 금주의 브랜드----------------------------- */
.brand {
	display: grid;
	grid-template-columns: 50% 18% 26%;
	justify-content: center;
	align-items: center;
	gap: 2rem;
}
.brand a{
	margin: 0;
	font-size: 1.5rem;
}
.brand img{
	width: 100%;
	height: auto;
}
</style>

<!--Genie 메인화면--->
<section class="index">
	<div class="index-list">		
		<a href="/genie/genie_01"><img src="/image/banner_eastern.png"></a>
	</div>

	<div class="category">
		<h2>카테고리</h2>
		<div class="category-list">
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220223091003_007dc2b6f60645a8bc2682e97914b829.jpg"></a><br>생일</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20201230162217_a70c12a712654a93abff864fa4b8c4c8.jpg"></a><br>기념일</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210914165131_70edddb11adf42b9990c00dbc256e159.jpg"></a><br>명절</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220719152430_cebe5a5c6ffe441d915d86fb9252cd3c.jpg"></a><br>집들이</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220824221511_46cfa4fe71924de994089f8e72fa3f0b.jpeg"></a><br>서프라이즈</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211005162429_5cbf39fcbe2d46808d8062529a6dce0c.jpg"></a><br>응원</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20210204142320_8234442ad995426b9d435a6c517b03f6.jpg"></a><br>캠핑</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220811095044_2727e0aefe8041bc80816bb2608ba7d1.jpg"></a><br>반려동물</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211118135132_e0dcbca05541406bb068af2ae1060846.jpg"></a><br>운동</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211120143602_cdfc50813bb04f8fb564baedc545944b.jpg"></a><br>키덜트</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20200306123008_899deea4eb61446592892a873765dc55"></a><br>요리</span>
			<span><a href="#"><img src="https://img1.kakaocdn.net/thumb/C600x600.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20211209174807_32d9b22304584f5e9323e8978631440e.jpg"></a><br>홈파티</span>
		</div>
	</div>
	
	<div class="ranking-list">
		<h1>고민될 땐 선물랭킹!<h1>
		<div>
			<a href="#"><img src="/image/gender_female_eastern.png"></a>
			<a href="#"><img src="/image/gender_all_eastern.png"></a>
			<a href="#"><img src="/image/gender_male_eastern.png"></a>
		</div>
	<div>
	<div class="brand-title">
		<h1>인기 브랜드<span>금주의 브랜드(광고)</span></h1>
	</div>
	<div class="brand">
		<div class="starbucks">
			<a href="#"><img src="/image/starbucks_eastern.png"></a>
		</div>
		<div class="brand1">
				<a href="#">
					<img src="https://img1.kakaocdn.net/thumb/C300x300.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220826162903_c3b3a0343ba041ae8b0e51324b4d9406.jpg">
					<img src="https://img1.kakaocdn.net/thumb/C300x300.fwebp.q82/?fname=https%3A%2F%2Fst.kakaocdn.net%2Fproduct%2Fgift%2Fproduct%2F20220818140832_b4e44c89232b4db1844caf8414c47412.jpg">
				</a>
		</div>
		<div class="brand2">
				<a href="#">제품이름{vo.product_name}</a><br><br>
				<a href="#">제품가격{vo.product_price}</a><br><br><hr><br>
				<a href="#">제품이름{vo.product_name}</a><br><br>
				<a href="#">제품가격{vo.product_price}</a>
		</div>
	</div>
</section>