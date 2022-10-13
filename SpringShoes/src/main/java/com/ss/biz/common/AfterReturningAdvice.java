package com.ss.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {
	
	@AfterReturning(pointcut="PointcutCommon.bPointcut()", returning="returnObj")
	public void printLogAfterReturning(JoinPoint jp,Object returnObj) {

		System.out.println("[로그: 핵심메서드의 반환 값] "+returnObj);
		System.out.println("-============-");
	}
}