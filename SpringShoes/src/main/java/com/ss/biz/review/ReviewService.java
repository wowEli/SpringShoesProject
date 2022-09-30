package com.ss.biz.review;

import java.util.List;

public interface ReviewService {
	
	public boolean insertReview(ReviewVO vo);
	public boolean updateReview(ReviewVO vo);
	public boolean deleteReview(ReviewVO vo);
	public ReviewVO selectOneReview(ReviewVO vo);
	public List<ReviewVO> selectAllReview(ReviewVO vo);
	public List<ReviewVO> selectAllReviewM(ReviewVO vo);
}
