class Item {
  Item({
    this.name,
    this.imagePath,
    this.count,
    this.price,
  });

  String name;
  String imagePath;
  int count = 0;
  int price;

  Item copyWith({
    String name,
    String imagePath,
    int count,
    int price,
  }) {
    return Item(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }
}
