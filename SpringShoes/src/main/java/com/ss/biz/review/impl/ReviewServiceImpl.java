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
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO selectOneReview(ReviewVO vo) {
		return reviewDAO.selectOneReview(vo);
	}

	@Override
	public ReviewVO selectOneReviewMS(ReviewVO vo) {
		return reviewDAO.selectOneReviewMS(vo);
	}
	@Override
	public List<ReviewVO> selectAllReview(ReviewVO vo) {
		return reviewDAO.selectAllReview(vo);
	}

	@Override
	public List<ReviewVO> selectAllReviewM(ReviewVO vo) {
		return reviewDAO.selectAllReviewM(vo);
	}

}
