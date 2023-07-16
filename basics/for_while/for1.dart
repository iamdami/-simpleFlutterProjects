void main() {
//   int total = 0;
  List<int> nums = [1, 2, 3, 4, 5];
//   for (int i = 0; i < nums.length; i++){
//    total += nums[i];
//   }
//   print(total);
  
  int total = 0;
  for (int number in nums){
    total += number;
  }
  print(total);
}

// for (int i=0; i<nums.length; i++)의 기본적인 방법과 for (int number in nums)의 보다 간단한 방법
