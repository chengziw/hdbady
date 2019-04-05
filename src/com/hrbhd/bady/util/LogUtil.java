package com.hrbhd.bady.util;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogUtil {
    /**
     * slf4j��־���ʹ��
     * �����jarΪ
     * import org.slf4j.Logger;
     * import org.slf4j.LoggerFactory;
     */
    public static final Logger logger = LoggerFactory.getLogger(LogUtil.class);
    /**
     * log4j����־��
     * import org.apache.log4j.Logger;
     * �����jar��Ϊ
     * 
     */
    //public static final Logger logger = Logger.getLogger(LogUtil.class);
    @Test
    public static void testlog(){
         logger.debug("aThis is debug message");
         logger.info("aThis is info message");
         logger.warn("aThis is warn message");
         logger.error("aThis is error message");
    }
}
