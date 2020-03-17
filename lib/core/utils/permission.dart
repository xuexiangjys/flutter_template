import 'package:permission_handler/permission_handler.dart';

///权限申请工具
class PermissionUtils {
  PermissionUtils._internal();

  static Future<bool> openAppSettings() =>
      PermissionHandler().openAppSettings();

  static Future<Map<PermissionGroup, PermissionStatus>> requestPermissions(
      List<PermissionGroup> permissions) async {
    return await PermissionHandler().requestPermissions(permissions);
  }

  static Future<PermissionStatus> requestPermission(
      PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);
    return permissionRequestResult[permission];
  }

  static Future<PermissionStatus> checkPermissionStatus(
      PermissionGroup permission) {
    return PermissionHandler().checkPermissionStatus(permission);
  }
}
