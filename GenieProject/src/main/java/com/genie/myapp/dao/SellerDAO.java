package com.genie.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.genie.myapp.vo.SellerVO;

@Mapper
@Repository
public interface SellerDAO {
	
	//아이디 중복검사
	public int idCheck(String seller_id);
	//seller 회원가입
	public int sellerWrite(SellerVO vo);
}
