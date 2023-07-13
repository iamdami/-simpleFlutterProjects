void main() {
  Map<String, bool> isFamily = {
    "dami" : true,
    "mommy" : true,
    "cat" : true,
    "dog" : false,
  };
  
  isFamily["father"] = true;
  print(isFamily);
  
  isFamily.remove("father");
  print(isFamily);
}

// remove() 함수 안에 삭제하고 싶은 key를 넣어주면 해당 key와 value 삭제됨

// {dami: true, mommy: true, cat: true, dog: false, father: true}
// {dami: true, mommy: true, cat: true, dog: false}

 
