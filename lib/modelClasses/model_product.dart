class ModelProduct {
  String? _productId;
  String? _commodity;
  String? _brand;
  String? _packSize;
  String? _unit;
  bool? _status;

  static String keyProductId = 'Product Id';
  static String keyCommodity = 'Commodity';
  static String keyBrand = 'Brand';
  static String keyPackSize = 'Pack Size';
  static String keyUnit = 'Unit';
  static String keyStatus = 'Status';

  ModelProduct({
    required String? productId,
    required String? commodity,
    required String? brand,
    required String? packSize,
    required String? unitOfMeasure,
    required bool? status,
  })  : _productId = productId,
        _commodity = commodity,
        _brand = brand,
        _packSize = packSize,
        _unit = unitOfMeasure,
        _status = status;

  Map<String, dynamic> toMap() {
    return {
      keyProductId: this._productId,
      keyCommodity: this._commodity,
      keyBrand: this._brand,
      keyPackSize: this._packSize,
      keyUnit: this._unit,
      keyStatus: this._status,
    };
  }

  factory ModelProduct.fromMap(Map<String, dynamic> map) {
    return ModelProduct(
      productId: map[keyProductId] as String,
      commodity: map[keyCommodity] as String,
      brand: map[keyBrand] as String,
      packSize: map[keyPackSize] as String,
      unitOfMeasure: map[keyUnit] as String,
      status: map[keyStatus] as bool,
    );
  }
}
