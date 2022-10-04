package com.genie.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.genie.myapp.dao.ReplyProductDAO;
import com.genie.myapp.vo.ReplyProductVO;

@Service
public class ReplyProductServiceImpl implements ReplyProductService{

    @Inject
    ReplyProductDAO DAO;
    
    public List<ReplyProductVO> replyProductList(int no){
        return DAO.replyProductList(no);
    }

	@Override
	public int replyProductWrite(ReplyProductVO vo) {
		return DAO.replyProductWrite(vo);
	}

	@Override
	public int replyProductEdit(ReplyProductVO vo) {
		return DAO.replyProductEdit(vo);
	}

	@Override
	public int replyProductDelete(int reply_no, String genie_id) {
		return DAO.replyProductDelete(reply_no, genie_id);
	}
}