import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String phone;
  final String name;
  final String status;
  final String? avatarUrl;
  final String? country;
  final List<int> tags;
  final DateTime? bornAt;
  final int lCoins;
  final bool isModerator;
  final String? level;

  const UserModel({
    required this.id,
    required this.phone,
    required this.name,
    required this.status,
    required this.avatarUrl,
    required this.tags,
    required this.country,
    required this.bornAt,
    required this.lCoins,
    required this.isModerator,
    required this.level,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      phone: json['phone'] as String,
      name: json['username'] as String,
      status: json['status'] as String,
      avatarUrl: json['link_avatar'] as String?,
      tags: json['tags']?.cast<int>() ?? [],
      country: json['country'] as String?,
      bornAt: json['born_at'] != null ? DateTime.parse(json['born_at']) : null,
      lCoins: json['balance'] as int? ?? 0,
      isModerator: json['is_moderator'] as bool? ?? false,
      level: json['level'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'username': name,
      'status': status,
      'link_avatar': avatarUrl,
      'tags': tags,
      'country': country,
      'born_at': bornAt?.toIso8601String(),
      'balance': lCoins,
      'level': level,
      'is_moderator': isModerator,
    };
  }

  @override
  List<Object?> get props => [
        id,
        phone,
        name,
        status,
        avatarUrl,
        country,
        tags,
        bornAt,
        lCoins,
        level,
        isModerator,
      ];
}
