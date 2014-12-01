/*
Given a string of arbitrary size, convert each 
character into its integer equivalent and sum the entirety.
*/
function charSum (str) {
  var arr = str.replace(/[\D]/g, '').split('')
  var sum = 0
  for(i=0; i<arr.length; i++){
    sum += parseInt(arr[i])
  }
  return sum;
  
}


/* this one doesn't work yet... */
function charSum(str) {
  var sum, arr = str.split('');
  for (i=0; i<arr.length; i++){
    if (arr[i] === /[\D]/g)
      sum += parseInt(arr[i])
  }
  return sum;
}

function charSum (str) {
  var sum =0;
  for (i=0; i<str.length; i++){
    if (parseInt(str[i)){
    sum += parseInt(str[i]);
  }
  return sum;
}


function charSum (str) {
  var sum = 0;
  for (i=0; i<str.lenght; i++){
    sum += parseInt(str[i)) || 0
  } 
  return sum;
}
