enum MyCategory {
  vegetables,
  meat,
  fruits,
}

class Item {
  Item({
    this.name,
    this.imagePath,
    this.count,
    this.price,
    this.category,
  });

  String name;
  String imagePath;
  int count = 0;
  int price;
  MyCategory category;

  Item copyWith({
    String name,
    String imagePath,
    int count,
    int price,
    MyCategory category,
  }) {
    return Item(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      count: count ?? this.count,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }
}
