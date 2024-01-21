import 'package:cloud_firestore/cloud_firestore.dart';

class Energy {
  String imported;
  String produced;
  String consumed;
  String exported;
  DateTime dateTime;

  Energy(
      {required this.imported,
      required this.produced,
      required this.consumed,
      required this.exported,
      required this.dateTime});

  factory Energy.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Energy(
      imported: data?['imported'],
      produced: data?['produced'],
      consumed: data?['consumed'],
      exported: data?['exported'],
      dateTime: data?['dateTime'].toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "imported": imported,
      "produced": produced,
      "consumed": consumed,
      "exported": exported,
      "dateTIme": Timestamp.fromDate(dateTime),
    };
  }
}
