package com.school.app

import org.apache.commons.lang3.ArrayUtils
import org.apache.commons.lang3.StringUtils

import java.lang.reflect.Array

/**
 * Created by aminul on 5/29/2014.
 */
class CommonUtils {
    public static final int DEFAULT_PAGINATION_START =0
    public static final int DEFAULT_PAGINATION_LENGTH =25
    public static final String DEFAULT_PAGINATION_SORT_ORDER ='desc'
    public static final String DEFAULT_PAGINATION_SORT_COLUMN ='id'
    public static final int DEFAULT_PAGINATION_SORT_IDX =0
    public static final String PERCENTAGE_SIGN ='%'
    public static final Long DEFAULT_SCHOOL_ID =10000

    public static final String SORT_ORDER_ASC ='asc'
    public static final String SORT_ORDER_DESC ='desc'
    public static final String UI_DATE_FORMAT ='dd-MMM-yyyy'

    public static String getSortColumn(String [] sortColumns, int idx){
        if(!sortColumns || sortColumns.length<1)
            return DEFAULT_PAGINATION_SORT_COLUMN
        int columnCounts = sortColumns.length
        if(idx>0 && idx<columnCounts){
            return sortColumns[idx]
        }
        return sortColumns[DEFAULT_PAGINATION_SORT_IDX]
    }
    public static String getUiDateStr(Date oldDate){
        if(!oldDate) return ''
        String newDate = oldDate.format(UI_DATE_FORMAT)
        return newDate
    }

    public static String handleMarkComplete(String original, String subjectId){
        String returnStr = null
        String[] returnArray = null
        try{
            String[] arrayFromOriginal = StringUtils.split(original,",")
            returnArray = ArrayUtils.removeElement(arrayFromOriginal,subjectId)

            if(returnArray !=null && returnArray.length>0){
                returnStr = StringUtils.join(returnArray,",")
            }
        }catch(Exception ex){
            println(ex.message)
        }
        return returnStr
    }

    public static int subjectIndexInCls(String subjectIds, def subjectToFind){
        int returnIdx = -1
        try{

            def arrayFromOriginal = StringUtils.split(subjectIds,",")

            for (int i = 0; i < arrayFromOriginal.length; i++) {
                if (arrayFromOriginal[i].toString().equalsIgnoreCase(subjectToFind.toString())) {
                    System.out.println(i);
                    returnIdx=i+1
                    break;
                }
            }
            print("arrayFromOriginal--------"+arrayFromOriginal)
            print("subjectToFind--------"+subjectToFind)
            print("returnIdx--------"+returnIdx)

//            Array.asList(arrayFromOriginal).indexOf(arrayFromOriginal)
//            returnIdx = StringUtils.indexOf(arrayFromOriginal, Character.parseInt(subjectToFind.toString()))
//            returnIdx =  Array.asList(arrayFromOriginal).indexOf(arrayFromOriginal)
//            print("returnIdx--------"+returnIdx)

        }catch(Exception ex){
            println(ex.message)
        }
        return returnIdx
    }
}
