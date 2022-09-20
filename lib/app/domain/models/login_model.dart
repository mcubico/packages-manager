class LoginModel {
  final String? message;
  final bool? isSuccess;
  final String? errors;
  final String? expireDate;
  final String? userId;
  final String? tenantName;
  final String? roleName;

  LoginModel({
    this.message,
    this.isSuccess,
    this.errors,
    this.expireDate,
    this.userId,
    this.tenantName,
    this.roleName,
  });

  static const String messageDataName = 'Message';
  static const String isSuccessDataName = 'IsSuccess';
  static const String errorsDataName = 'Errors';
  static const String expireDateDataName = 'ExpireDate';
  static const String userIdDataName = 'UserId';
  static const String tenantNameDataName = 'TenantName';
  static const String roleNameDataName = 'RoleName';
}
