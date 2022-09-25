class Product {
  String? name;
  String? imagePath;
  int? price;
  int selectedCount=1;

  Product(String name, String imagePath, int price) {
    this.name = name;
    this.imagePath = imagePath;
    this.price = price;
    this.selectedCount = selectedCount;
  }
}
