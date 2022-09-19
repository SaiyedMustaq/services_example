import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static PermissionsService permissionsService = PermissionsService();
  void checkServiceStatus(
    BuildContext context,
    Permission permission,
  ) async {
    if (kDebugMode) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((await permission.status).toString()),
      ));
    } else {
      print('${permission.status}');
    }
  }

  Future<void> requestPermission(
      BuildContext context, Permission permission) async {
    final status = await permission.request();
    switch (status) {
      case PermissionStatus.denied:
        permission.request();
        return checkServiceStatus(context, permission);
      case PermissionStatus.granted:
        return checkServiceStatus(context, permission);
      case PermissionStatus.limited:
        return checkServiceStatus(context, permission);
      default:
        return checkServiceStatus(context, permission);
    }
  }

  Future<void> requestMultiplePermission(
      BuildContext context, List<Permission> permission) async {
    for (var element in permission) {
      final status = await element.request();
      switch (status) {
        case PermissionStatus.denied:
          return checkServiceStatus(context, element);
        case PermissionStatus.granted:
          return checkServiceStatus(context, element);
        case PermissionStatus.limited:
          return checkServiceStatus(context, element);
        default:
          return checkServiceStatus(context, element);
      }
    }
  }
}
