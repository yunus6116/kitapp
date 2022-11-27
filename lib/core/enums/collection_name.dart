enum CollectionName {
  categories,
  products,
  sliders,
  users,
  objectionableProducts,
  favorites,
  productCategories,
  subcategories,
  reviews,
  contracts,
  messages,
  receiveForm,
  notifications
}

extension CollectionNameExtensions on CollectionName {
  String get collectionName {
    switch (this) {
      case CollectionName.objectionableProducts:
        return "objectionable-products";
      case CollectionName.productCategories:
        return "product-categories";
      case CollectionName.receiveForm:
        return "receive-form";
      default:
        return name;
    }
  }
}
