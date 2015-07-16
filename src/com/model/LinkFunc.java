//this is a java class that contains functions to print our link for loginSuccess page

package com.model;

public class LinkFunc {
	StringBuilder res;
	//print previous link under table 
	public String printPrevLink(int currPage, String uname, String grade){
		res = new StringBuilder();
		
		if(currPage!=1){
			res.append("<a href=");
			res.append("loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(currPage-1));
			res.append(">previous</a>");
		}
		
		return res.toString();
	}// end previous link
	
	
	//print next link under table 
	public String printNextLink(int currPage, String uname, String grade, int pageCount){
		res = new StringBuilder();
		
		if(currPage!=pageCount){
			res.append("<a href=");
			res.append("loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(currPage+1));
			res.append(">next</a>");
		}
		
		return res.toString();
	}//end next link
	
	//print links under table 
	public String printCurrLinks(int linkDisplayCount, int currPage, int pageCount, String uname, String grade){
		res = new StringBuilder();
		
		for(int i=0;i<linkDisplayCount;i++){
			if(currPage>pageCount-linkDisplayCount+1){
				res.append("<a href=loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(pageCount-linkDisplayCount+1+i)+">&nbsp[");
				if(pageCount-linkDisplayCount+1+i==currPage){
					res.append("<mark>");
				}
				
				res.append((pageCount-linkDisplayCount+1+i));
				if(pageCount-linkDisplayCount+1+i==currPage){
					res.append("</mark>");
				}
				
				res.append("]&nbsp</a>");
			}else{
				if(currPage+i<=pageCount){
					res.append("<a href=loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(currPage+i)+">&nbsp[");
					if(i==0){
						res.append("<mark>");
					}
					res.append((currPage+i));
					if(i==0){
						res.append("</mark>");
					}
					res.append("]&nbsp</a>");
				}
			}
		}// end for
		return res.toString();
	}// end print links

}
