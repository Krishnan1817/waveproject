import 'package:hive/hive.dart';

abstract class TokenDataService {
  String? accessToken;
  bool? isIntroSkipped;
  int? tenantId;
  int? userId;
  String? userName;
  DateTime? dateOfJoin;
  String? designationName;
  String? name;
  String? surname;
  String? employeeId;
  String? isToolTipSeen;
  String? isManagerToolTipSeen;
}

class TokenDataServiceImp extends BaseDataService implements TokenDataService {
  TokenDataServiceImp() : super('localBox');

  String? get accessToken {
    return getValue('Token');
  }

  void set accessToken(String? token) {
    setValue(token, 'Token');
  }

  bool? get isIntroSkipped {
    return getValue('isIntroSkipped');
  }

  void set isIntroSkipped(bool? value) {
    setValue(value, 'isIntroSkipped');
  }

  int? get tenantId {
    return getValue('TenantId');
  }

  void set tenantId(int? id) {
    setValue(id, 'TenantId');
  }

  int? get userId {
    return getValue('UserId');
  }

  void set userId(int? id) {
    setValue(id, 'UserId');
  }

  String? get userName {
    return getValue('userName');
  }

  void set userName(String? name) {
    setValue(name, 'userName');
  }

  String? get name {
    return getValue('name');
  }

  void set name(String? sname) {
    setValue(sname, 'name');
  }

  String? get surname {
    return getValue('surname');
  }

  void set surname(String? tname) {
    setValue(tname, 'surname');
  }

  DateTime? get dateOfJoin {
    return getValue('dateOfJoin');
  }

  void set dateOfJoin(DateTime? doj) {
    setValue(doj, 'dateOfJoin');
  }

  String? get designationName {
    return getValue('designationName');
  }

  void set designationName(String? name) {
    setValue(name, 'designationName');
  }

  String? get employeeId {
    return getValue('employeeId');
  }

  void set employeeId(String? name) {
    setValue(name, 'employeeId');
  }

  String? get isToolTipSeen {
    return getValue('isToolTipSeen');
  }

  void set isToolTipSeen(String? token) {
    setValue(token, 'isToolTipSeen');
  }

  String? get isManagerToolTipSeen {
    return getValue('isManagerToolTipSeen');
  }

  void set isManagerToolTipSeen(String? token) {
    setValue(token, 'isManagerToolTipSeen');
  }
}

abstract class BaseDataService {
  final String _boxName;
  late Box<dynamic> _localBox;
  Map<String, dynamic> _mappings = Map<String, dynamic>();
  BaseDataService(this._boxName) {
    _localBox = Hive.box(_boxName);
  }

  getValue([String callerMethodName = ""]) {
    if (!_mappings.containsKey(callerMethodName)) {
      _mappings[callerMethodName] = _localBox.get(callerMethodName);
    }
    return _mappings[callerMethodName];
  }

  setValue(dynamic value, [String callerMethodName = ""]) {
    _localBox.put(callerMethodName, value);
    _mappings[callerMethodName] = value;
  }
}
