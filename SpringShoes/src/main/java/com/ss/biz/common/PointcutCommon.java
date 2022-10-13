package com.ss.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	
	@Pointcut("execution(* com.ss.biz..*Impl.*(..))")
	public void aPointcut() {}
	
	@Pointcut("execution(* com.ss.biz..*Impl.select*(..))")
	public void bPointcut() {}

}