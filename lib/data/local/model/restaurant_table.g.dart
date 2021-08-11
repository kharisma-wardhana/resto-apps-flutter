// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class RestaurantTableData extends DataClass
    implements Insertable<RestaurantTableData> {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String address;
  final String rating;
  RestaurantTableData(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.pictureId,
      @required this.city,
      @required this.address,
      @required this.rating});
  factory RestaurantTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return RestaurantTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      pictureId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture_id']),
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city']),
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      rating: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || pictureId != null) {
      map['picture_id'] = Variable<String>(pictureId);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<String>(rating);
    }
    return map;
  }

  RestaurantTableCompanion toCompanion(bool nullToAbsent) {
    return RestaurantTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      pictureId: pictureId == null && nullToAbsent
          ? const Value.absent()
          : Value(pictureId),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
    );
  }

  factory RestaurantTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RestaurantTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      pictureId: serializer.fromJson<String>(json['pictureId']),
      city: serializer.fromJson<String>(json['city']),
      address: serializer.fromJson<String>(json['address']),
      rating: serializer.fromJson<String>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'pictureId': serializer.toJson<String>(pictureId),
      'city': serializer.toJson<String>(city),
      'address': serializer.toJson<String>(address),
      'rating': serializer.toJson<String>(rating),
    };
  }

  RestaurantTableData copyWith(
          {String id,
          String name,
          String description,
          String pictureId,
          String city,
          String address,
          String rating}) =>
      RestaurantTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        city: city ?? this.city,
        address: address ?? this.address,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('RestaurantTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pictureId: $pictureId, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  pictureId.hashCode,
                  $mrjc(city.hashCode,
                      $mrjc(address.hashCode, rating.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.pictureId == this.pictureId &&
          other.city == this.city &&
          other.address == this.address &&
          other.rating == this.rating);
}

class RestaurantTableCompanion extends UpdateCompanion<RestaurantTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> pictureId;
  final Value<String> city;
  final Value<String> address;
  final Value<String> rating;
  const RestaurantTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.pictureId = const Value.absent(),
    this.city = const Value.absent(),
    this.address = const Value.absent(),
    this.rating = const Value.absent(),
  });
  RestaurantTableCompanion.insert({
    @required String id,
    @required String name,
    @required String description,
    @required String pictureId,
    @required String city,
    @required String address,
    @required String rating,
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        pictureId = Value(pictureId),
        city = Value(city),
        address = Value(address),
        rating = Value(rating);
  static Insertable<RestaurantTableData> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> description,
    Expression<String> pictureId,
    Expression<String> city,
    Expression<String> address,
    Expression<String> rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (pictureId != null) 'picture_id': pictureId,
      if (city != null) 'city': city,
      if (address != null) 'address': address,
      if (rating != null) 'rating': rating,
    });
  }

  RestaurantTableCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<String> pictureId,
      Value<String> city,
      Value<String> address,
      Value<String> rating}) {
    return RestaurantTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pictureId: pictureId ?? this.pictureId,
      city: city ?? this.city,
      address: address ?? this.address,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pictureId.present) {
      map['picture_id'] = Variable<String>(pictureId.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pictureId: $pictureId, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

class $RestaurantTableTable extends RestaurantTable
    with TableInfo<$RestaurantTableTable, RestaurantTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $RestaurantTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<String> _id;
  @override
  GeneratedColumn<String> get id =>
      _id ??= GeneratedColumn<String>('id', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name =>
      _name ??= GeneratedColumn<String>('name', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedColumn<String> _description;
  @override
  GeneratedColumn<String> get description => _description ??=
      GeneratedColumn<String>('description', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _pictureIdMeta = const VerificationMeta('pictureId');
  GeneratedColumn<String> _pictureId;
  @override
  GeneratedColumn<String> get pictureId =>
      _pictureId ??= GeneratedColumn<String>('picture_id', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedColumn<String> _city;
  @override
  GeneratedColumn<String> get city =>
      _city ??= GeneratedColumn<String>('city', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedColumn<String> _address;
  @override
  GeneratedColumn<String> get address =>
      _address ??= GeneratedColumn<String>('address', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedColumn<String> _rating;
  @override
  GeneratedColumn<String> get rating =>
      _rating ??= GeneratedColumn<String>('rating', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, pictureId, city, address, rating];
  @override
  String get aliasedName => _alias ?? 'restaurant_table';
  @override
  String get actualTableName => 'restaurant_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RestaurantTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('picture_id')) {
      context.handle(_pictureIdMeta,
          pictureId.isAcceptableOrUnknown(data['picture_id'], _pictureIdMeta));
    } else if (isInserting) {
      context.missing(_pictureIdMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RestaurantTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    return RestaurantTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RestaurantTableTable createAlias(String alias) {
    return $RestaurantTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RestaurantTableTable _restaurantTable;
  $RestaurantTableTable get restaurantTable =>
      _restaurantTable ??= $RestaurantTableTable(this);
  RestaurantDao _restaurantDao;
  RestaurantDao get restaurantDao =>
      _restaurantDao ??= RestaurantDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [restaurantTable];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$RestaurantDaoMixin on DatabaseAccessor<AppDatabase> {
  $RestaurantTableTable get restaurantTable => attachedDatabase.restaurantTable;
}
