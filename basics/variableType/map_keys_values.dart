void main() {
  Map<String, bool> isFamily = {
    "dami" : true,
    "mommy" : true,
    "cat" : true,
    "dog" : false,
  };
  
  isFamily["father"] = true;
  print(isFamily.keys);
  print(isFamily.values);
}

// keys와 values 이용해 각각 key와 value만 가져올 수 있음

// (dami, mommy, cat, dog, father)
// (true, true, true, false, true)
