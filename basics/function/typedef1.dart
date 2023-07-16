void main() {
  Operation operation = add;
  int res1 = operation(10, 20, 30);
  print(res1);
  
  operation = subtract;
  int res2 = operation(10, 20, 30);
  print(res2);
}

typedef Operation = int Function(int num1, int num2, int num3);
int add(int num1, int num2, int num3) => num1 + num2 + num3;
int subtract(int num1, int num2, int num3) => num1 - num2 - num3;
