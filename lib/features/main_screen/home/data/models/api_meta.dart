import 'migration.dart';

class ApiMeta {
  ApiMeta({
      this.migration, 
      this.apiVersion, 
      this.executionTime,});

  ApiMeta.fromJson(dynamic json) {
    migration = json['migration'] != null ? Migration.fromJson(json['migration']) : null;
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
  Migration? migration;
  int? apiVersion;
  String? executionTime;


}