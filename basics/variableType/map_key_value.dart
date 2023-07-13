void main() {
  // Map
  // key, value
  Map<String, String> family = {
    "me" : "dami",
    "mommy" : "soyoung",
    "cat" : "chacha",
  };
  print(family);
  
  Map<String, bool> isFamily = {
    "dami" : true,
    "mommy" : true,
    "cat" : true,
    "dog" : false,
  };
  print(isFamily);
  
  isFamily.addAll({
    "brother" : true
  });
  print(isFamily);
  
  print(family["cat"]);
  print(isFamily["cat"]);
}

// {me: dami, mommy: soyoung, cat: chacha}
// {dami: true, mommy: true, cat: true, dog: false}
// {dami: true, mommy: true, cat: true, dog: false, brother: true}
// chacha
// true

 
