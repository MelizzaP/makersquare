//Given an array, find the length of the longest increasing sequence.

function longestImprovement(numbers){
    var count =1, tempCount=1;
    for(i=1;i<(numbers.length); i++){ 
        if(numbers[i]>numbers[i-1]){
            tempCount+=1;
            if (count<tempCount){
              count=tempCount
            }
        }
        else{
                tempCount=1;
            }
            
    }
    return count;
}