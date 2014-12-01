/*
Given a properly formatted URL, return the query string data as 
an array of key-value pairs, in the order that they appear. 
HINT: You may use decodeURIComponent()
*/

function parseQueryString (url) {
var urlHalves,query,result=[];
 urlHalves = decodeURIComponent(url).split("?")
 if (urlHalves[1]){
  query = urlHalves[1].split("&")
    for(i =0; i <query.length; i++){
        result.push(query[i].split("="))
    }
 }
 return result
}
