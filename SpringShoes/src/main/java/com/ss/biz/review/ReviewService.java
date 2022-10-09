package com.ss.biz.review;

import java.util.List;

public interface ReviewService {
	
	public void insertReview(ReviewVO vo);
	public void updateReview(ReviewVO vo);
	public void deleteReview(ReviewVO vo);
	public ReviewVO selectOneReview(ReviewVO vo);
	public ReviewVO selectOneReviewMS(ReviewVO vo);
	public List<ReviewVO> selectAllReview(ReviewVO vo);
	public List<ReviewVO> selectAllReviewM(ReviewVO vo);
}
