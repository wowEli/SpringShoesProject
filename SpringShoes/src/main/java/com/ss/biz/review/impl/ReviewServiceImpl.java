package com.ss.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.biz.review.ReviewService;
import com.ss.biz.review.ReviewVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public boolean insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
		return false;
	}

	@Override
	public boolean updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
		return false;
	}

	@Override
	public boolean deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
		return false;
	}

	@Override
	public ReviewVO selectOneReview(ReviewVO vo) {
		reviewDAO.selectOneReview(vo);
		return null;
	}

	@Override
	public List<ReviewVO> selectAllReview(ReviewVO vo) {
		reviewDAO.selectAllReview(vo);
		return null;
	}

	@Override
	public List<ReviewVO> selectAllReviewM(ReviewVO vo) {
		reviewDAO.selectAllReviewM(vo);
		return null;
	}

}
