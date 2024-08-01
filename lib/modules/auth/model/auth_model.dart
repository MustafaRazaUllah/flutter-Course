class AuthModel {
  final User user;
  final String token;

  AuthModel({
    required this.user,
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: json["user"] != null
            ? User.fromJson(json["user"])
            : User.fromEmpty(),
        token: json["token"] ?? "",
      );

  factory AuthModel.fromEmpty() => AuthModel(
        user: User.fromEmpty(),
        token: "",
      );
}

class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String countryCode;
  final dynamic dob;
  final dynamic weight;
  final dynamic weightUnit;
  final dynamic goalWeight;
  final dynamic goalWeightUnit;
  final dynamic height;
  final dynamic heightUnit;
  final dynamic image;
  final bool isVerified;
  final bool isBlocked;
  final int totalFollowers;
  final int totalFollowings;
  final int totalPRs;
  final String role;
  final bool isAthleteProfileEnabled;
  final bool sendPushNotifications;
  final bool sendTextNotifications;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AthleteProfile athleteProfile;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.countryCode,
    required this.dob,
    required this.weight,
    required this.weightUnit,
    required this.goalWeight,
    required this.goalWeightUnit,
    required this.height,
    required this.heightUnit,
    required this.image,
    required this.isVerified,
    required this.isBlocked,
    required this.totalFollowers,
    required this.totalFollowings,
    required this.totalPRs,
    required this.role,
    required this.isAthleteProfileEnabled,
    required this.sendPushNotifications,
    required this.sendTextNotifications,
    required this.createdAt,
    required this.updatedAt,
    required this.athleteProfile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        username: json["username"] ?? "",
        phone: json["phone"] ?? "",
        countryCode: json["countryCode"] ?? "",
        dob: json["dob"] ?? "",
        weight: json["weight"] ?? "",
        weightUnit: json["weightUnit"] ?? "",
        goalWeight: json["goalWeight"] ?? "",
        goalWeightUnit: json["goalWeightUnit"] ?? "",
        height: json["height"] ?? "",
        heightUnit: json["heightUnit"] ?? "",
        image: json["image"] ?? "",
        isVerified: json["isVerified"] ?? false,
        isBlocked: json["isBlocked"] ?? false,
        totalFollowers: json["totalFollowers"] ?? 0,
        totalFollowings: json["totalFollowings"] ?? 0,
        totalPRs: json["totalPRs"] ?? 0,
        role: json["role"] ?? "",
        isAthleteProfileEnabled: json["isAthleteProfileEnabled"] ?? false,
        sendPushNotifications: json["sendPushNotifications"] ?? false,
        sendTextNotifications: json["sendTextNotifications"] ?? false,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        athleteProfile: json["athleteProfile"] != null
            ? AthleteProfile.fromJson(json["athleteProfile"])
            : AthleteProfile.fromEmpty(),
      );

  factory User.fromEmpty() => User(
        id: 0,
        name: "",
        email: "",
        username: "",
        phone: "",
        countryCode: "",
        dob: "",
        weight: "",
        weightUnit: "",
        goalWeight: "",
        goalWeightUnit: "",
        height: "",
        heightUnit: "",
        image: "",
        isVerified: false,
        isBlocked: false,
        totalFollowers: 0,
        totalFollowings: 0,
        totalPRs: 0,
        role: "",
        isAthleteProfileEnabled: false,
        sendPushNotifications: false,
        sendTextNotifications: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        athleteProfile: AthleteProfile.fromEmpty(),
      );
}

class AthleteProfile {
  final dynamic progress;
  final int id;
  final dynamic image;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  AthleteProfile({
    required this.progress,
    required this.id,
    required this.image,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AthleteProfile.fromJson(Map<String, dynamic> json) => AthleteProfile(
        progress: json["progress"] ?? "",
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        userId: json["userId"] ?? 0,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
      );

  factory AthleteProfile.fromEmpty() => AthleteProfile(
        progress: "",
        id: 0,
        image: "",
        userId: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
