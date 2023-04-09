// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MerchRecord> _$merchRecordSerializer = new _$MerchRecordSerializer();

class _$MerchRecordSerializer implements StructuredSerializer<MerchRecord> {
  @override
  final Iterable<Type> types = const [MerchRecord, _$MerchRecord];
  @override
  final String wireName = 'MerchRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MerchRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.onSale;
    if (value != null) {
      result
        ..add('on_sale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.salePrice;
    if (value != null) {
      result
        ..add('sale_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ascendingAmount;
    if (value != null) {
      result
        ..add('Ascending_Amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('Photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user_id;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }

    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }

    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MerchRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MerchRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'on_sale':
          result.onSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sale_price':
          result.salePrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Ascending_Amount':
          result.ascendingAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MerchRecord extends MerchRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final bool? onSale;
  @override
  final double? salePrice;
  @override
  final int? ascendingAmount;
  @override
  final String? photo;
  @override
  final String? user_id;
  @override
  final String? time;
  @override
  final String? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MerchRecord([void Function(MerchRecordBuilder)? updates]) =>
      (new MerchRecordBuilder()..update(updates))._build();

  _$MerchRecord._(
      {this.name,
      this.description,
      this.price,
      this.onSale,
      this.salePrice,
      this.ascendingAmount,
      this.photo,
      this.user_id,
      this.time,
      this.id,
      this.ffRef})
      : super._();

  @override
  MerchRecord rebuild(void Function(MerchRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MerchRecordBuilder toBuilder() => new MerchRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MerchRecord &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        onSale == other.onSale &&
        salePrice == other.salePrice &&
        ascendingAmount == other.ascendingAmount &&
        photo == other.photo &&
        user_id == other.user_id &&
        time == other.time &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, name.hashCode),
                                        description.hashCode),
                                    price.hashCode),
                                onSale.hashCode),
                            salePrice.hashCode),
                        ascendingAmount.hashCode),
                    photo.hashCode),
                user_id.hashCode),
            time.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MerchRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('price', price)
          ..add('onSale', onSale)
          ..add('salePrice', salePrice)
          ..add('ascendingAmount', ascendingAmount)
          ..add('photo', photo)
          ..add('user_id', user_id)
          ..add('time', time)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MerchRecordBuilder implements Builder<MerchRecord, MerchRecordBuilder> {
  _$MerchRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  bool? _onSale;
  bool? get onSale => _$this._onSale;
  set onSale(bool? onSale) => _$this._onSale = onSale;

  double? _salePrice;
  double? get salePrice => _$this._salePrice;
  set salePrice(double? salePrice) => _$this._salePrice = salePrice;

  int? _ascendingAmount;
  int? get ascendingAmount => _$this._ascendingAmount;
  set ascendingAmount(int? ascendingAmount) =>
      _$this._ascendingAmount = ascendingAmount;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MerchRecordBuilder() {
    MerchRecord._initializeBuilder(this);
  }

  MerchRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _price = $v.price;
      _onSale = $v.onSale;
      _salePrice = $v.salePrice;
      _ascendingAmount = $v.ascendingAmount;
      _photo = $v.photo;
      _user_id = $v.user_id;
      _time = $v.time;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MerchRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MerchRecord;
  }

  @override
  void update(void Function(MerchRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MerchRecord build() => _build();

  _$MerchRecord _build() {
    final _$result = _$v ??
        new _$MerchRecord._(
            name: name,
            description: description,
            price: price,
            onSale: onSale,
            salePrice: salePrice,
            ascendingAmount: ascendingAmount,
            photo: photo,
            user_id: user_id,
            time: time,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
