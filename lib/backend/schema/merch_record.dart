import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'merch_record.g.dart';

abstract class MerchRecord implements Built<MerchRecord, MerchRecordBuilder> {
  static Serializer<MerchRecord> get serializer => _$merchRecordSerializer;

  String? get name;

  String? get description;

  double? get price;

  @BuiltValueField(wireName: 'on_sale')
  bool? get onSale;

  @BuiltValueField(wireName: 'sale_price')
  double? get salePrice;

  @BuiltValueField(wireName: 'Ascending_Amount')
  int? get ascendingAmount;

  @BuiltValueField(wireName: 'Photo')
  String? get photo;

  @BuiltValueField(wireName: 'user_id')
  String? get user_id;

  @BuiltValueField(wireName: 'time')
  String? get time;

  @BuiltValueField(wireName: 'id')
  String? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MerchRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..price = 0.0
    ..onSale = false
    ..salePrice = 0.0
    ..ascendingAmount = 0
    ..photo = ''
    ..user_id = ''
    ..time = ''
    ..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Merch');

  static Stream<MerchRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MerchRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static MerchRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => MerchRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..description = snapshot.data['description']
          ..price = snapshot.data['price']?.toDouble()
          ..onSale = snapshot.data['on_sale']
          ..salePrice = snapshot.data['sale_price']?.toDouble()
          ..ascendingAmount = snapshot.data['Ascending_Amount']?.round()
          ..photo = snapshot.data['Photo']
          ..user_id = snapshot.data['user_id']
          ..time = snapshot.data['time']
          ..id = snapshot.data['id']
          ..ffRef = MerchRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MerchRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Merch',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  MerchRecord._();
  factory MerchRecord([void Function(MerchRecordBuilder) updates]) =
      _$MerchRecord;

  static MerchRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMerchRecordData(
    {String? name,
    String? description,
    double? price,
    bool? onSale,
    double? salePrice,
    int? ascendingAmount,
    String? photo,
    String? user_id,
    String? time,
    String? id}) {
  final firestoreData = serializers.toFirestore(
    MerchRecord.serializer,
    MerchRecord((m) => m
      ..name = name
      ..description = description
      ..price = price
      ..onSale = onSale
      ..salePrice = salePrice
      ..ascendingAmount = ascendingAmount
      ..photo = photo
      ..user_id = user_id
      ..time = time
      ..id = id),
  );

  return firestoreData;
}
