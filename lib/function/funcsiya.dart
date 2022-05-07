class Func {
  Func(data) {
    bestSale(data);
    print(price);
  }
  List price = [];

  bestSale(List data) {
    for (var i = 0; i < data.length; i++) {
      if (data[i]['price'] > 3.0) {
        price.add(i);
      }
    }
  }
}

