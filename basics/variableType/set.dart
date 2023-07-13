// Map과 비슷하지만, Map처럼 key와 value 짝이 아니라 List처럼 하나의 값들만 저장할 수 있음
// List와 Set의 차이: List는 중복 값 들어갈 수 있고, Set은 중복 값 들어갈 수 없음
// -> Set은 중복을 자동으로 처리해 준다는 장점있음

void main() {
  final Set<String> name1 = {
    "chacha",
    "coco",
    "mongchi",
    "coco",
  };
  print(name1);
  
  name1.add("babpul");
  print(name1);
  
  name1.remove("coco");
  print(name1);
  
  name1.contains("mongchi");
  print(name1);
}

// List처럼 add()와 remove() 사용 가능

// {chacha, coco, mongchi}
// {chacha, coco, mongchi, babpul}
// {chacha, mongchi, babpul}

// contains() 이용하면 해당 원소가 있는지 bool형으로 나타냄

 
