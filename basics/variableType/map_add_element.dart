void main() {
  Map<String, bool> isFamily = {
    "dami" : true,
    "mommy" : true,
    "cat" : true,
    "dog" : false,
  };
  
  isFamily["father"] = true;
  print(isFamily);
}

// isFamily["father"] = true; 이런 식으로 Map 원소를 추가해 줄 수도 있음

 
