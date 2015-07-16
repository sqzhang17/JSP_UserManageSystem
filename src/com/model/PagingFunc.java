//this is a java class contains functions for paging
package com.model;

public class PagingFunc {
	
	public int calculatePageCount(int rowCount,int pageSize){
		return rowCount%pageSize==0?(rowCount/pageSize):(rowCount/pageSize+1);
	}
	
	public static int getCurrPage(String currPage){
		return currPage==null?1:Integer.parseInt(currPage);
	}
}
