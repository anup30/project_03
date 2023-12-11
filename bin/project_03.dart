//live test 11.12.23
class FruitColorPrice{
  String? color;
  double? price;
  FruitColorPrice(this.color,this.price);
}

displayFruitDetails(List<Map<String,FruitColorPrice>> lm){
  List<String>keys =lm[0].keys.toList();
  int len = lm[0].length;
  for(int i=0; i<len; i++){
    //Name: Apple, Color: Red, Price: $2.5
    print('Name: ${keys[i]}, Color: ${lm[0][keys[i]]!.color}, Price: ${lm[0][keys[i]]!.price}');
  }
}

applyPriceDiscount(List<Map<String,FruitColorPrice>> lm, double discount){
  double multiply= (100-discount)/100;
  List<String>keys =lm[0].keys.toList();
  int len = lm[0].length;
  for(int i=0; i<len; i++){
    lm[0][keys[i]]!.price = lm[0][keys[i]]!.price!*multiply;
  }
}

void main() {
  FruitColorPrice apple = FruitColorPrice('Red',2.5);
  FruitColorPrice banana = FruitColorPrice('Yellow',1.0);
  FruitColorPrice grapes = FruitColorPrice('Purple',3.0);
  Map<String,FruitColorPrice> m1={'Apple':apple, 'Banana':banana, 'Grapes': grapes};
  List<Map<String,FruitColorPrice>> fruits =[m1];
  print('Original Fruit Details before Discount:');
  displayFruitDetails(fruits);
  applyPriceDiscount(fruits,10);
  print('Fruit Details After Applying 10% Discount:');
  displayFruitDetails(fruits);
}