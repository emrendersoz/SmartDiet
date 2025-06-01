import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebaseModel<T> {
  const IFirebaseModel();
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}

abstract class IFirebaseHelper<T extends IFirebaseModel<T>> {
  IFirebaseHelper(
    this.collectionName, {
    required this.deserializer,
    this.createdDate = true,
    this.updatedDate = true,
  }) {
    this.collectionRef = firestore.collection(this.collectionName);
  }
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final T deserializer;
  final String collectionName;
  final bool createdDate;
  final bool updatedDate;
  late final CollectionReference<Map<String, dynamic>> collectionRef;

  DocumentReference getReference(String? id) => this.collectionRef.doc(id);

  Future<List<T>> getDocuments({Query<Map<String, dynamic>>? query}) async {
    query ??= _dateOrderBy();
    if (query == null) {
      return this.collectionRef.get().then(
            (event) =>
                event.docs.map((e) => deserializer.fromJson(e.data())).toList(),
          );
    }
    return await query.get().then(
          (event) =>
              event.docs.map((e) => deserializer.fromJson(e.data())).toList(),
        );
  }

  Query<Map<String, dynamic>>? _dateOrderBy() {
    if (this.createdDate || this.updatedDate) {
      return this.collectionRef.orderBy(
            this.updatedDate ? 'updatedDate' : 'createdDate',
            descending: true,
          );
    }
    return null;
  }

  Stream<List<T>> listenCollection({Query<Map<String, dynamic>>? query}) {
    query ??= _dateOrderBy();
    if (query == null) {
      return this.collectionRef.snapshots().map(
            (event) =>
                event.docs.map((e) => deserializer.fromJson(e.data())).toList(),
          );
    }
    return query.snapshots().map(
          (event) =>
              event.docs.map((e) => deserializer.fromJson(e.data())).toList(),
        );
  }

  Stream<T> listenDocument(String id) {
    return this
        .collectionRef
        .doc(id)
        .snapshots()
        .map((event) => deserializer.fromJson(event.data()!));
  }

  Future<List<U>> collectionGroup<U extends IFirebaseModel<U>>(
    Query<Map<String, dynamic>> query, {
    required U deserializer,
  }) async {
    return await query.get().then(
          (event) =>
              event.docs.map((e) => deserializer.fromJson(e.data())).toList(),
        );
  }

  Future<T> getDocumentById(String id) async {
    final DocumentSnapshot snapshot = await this.collectionRef.doc(id).get();
    return deserializer.fromJson(snapshot.data()! as Map<String, dynamic>);
  }

  Future<List<T>> getDocumentByQuery(Query<Map<String, dynamic>> query) async {
    return await query.get().then(
          (event) =>
              event.docs.map((e) => deserializer.fromJson(e.data())).toList(),
        );
  }

  Future<T> getDocumentByReference(DocumentReference reference) async {
    final snapshot = await reference.get();
    return deserializer.fromJson(snapshot.data()! as Map<String, dynamic>);
  }

  Future<String> addDocument(T document) async {
    late String id;
    await this
        .collectionRef
        .add(await _toJson(document, create: true))
        .then((value) {
      id = value.id;
      return value.update({'id': value.id});
    });
    return id;
  }

  Future<void> addDocumentByID(String id, T document) async {
    await this.collectionRef.doc(id).set(await _toJson(document,create: true));
  }

  Future<void> updateDocument(String id, T document) async {
    await this.collectionRef.doc(id).update(await _toJson(document));
  }

  Future<void> setDocument(String id, T document) async {
    await this.collectionRef.doc(id).set(await _toJson(document));
  }

  Future<Map<String, dynamic>> _toJson(
    T document, {
    bool create = false,
  }) async {
    final data = document.toJson();
    if (this.createdDate && create) {
      data['createdDate'] = DateTime.now();
    }
    if (this.updatedDate) {
      data['updatedDate'] = DateTime.now();
    }

    return data;
  }

  Future<void> deleteDocument(String id) async {
    await this.collectionRef.doc(id).delete();
  }
}
