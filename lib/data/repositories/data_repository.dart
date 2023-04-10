import 'package:dialogue_player/data/models/data_model.dart';
import 'package:flutter/services.dart';

class DataRepository {
  Future<List<DataModel>> getDatas() async {
    dynamic response = await rootBundle.loadString('lib/assets/data.json');
    return dataModelFromJson(response);
  }
}
