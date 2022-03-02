import 'package:hive/hive.dart';
part 'short_link.g.dart';

@HiveType(typeId: 0)
class ShortLink extends HiveObject {
  ShortLink({
    this.code,
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.shareLink,
    this.fullShareLink,
    this.originalLink,
  });
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? shortLink;
  @HiveField(2)
  String? fullShortLink;
  @HiveField(3)
  String? shortLink2;
  @HiveField(4)
  String? fullShortLink2;
  @HiveField(5)
  String? shareLink;
  @HiveField(6)
  String? fullShareLink;
  @HiveField(7)
  String? originalLink;
  factory ShortLink.fromJson(Map<String, dynamic> json) => ShortLink(
        code: json['code'] as String?,
        shortLink: json['short_link'] as String?,
        fullShortLink: json['full_short_link'] as String?,
        shortLink2: json['short_link2'] as String?,
        fullShortLink2: json['full_short_link2'] as String?,
        shareLink: json['share_link'] as String?,
        fullShareLink: json['full_share_link'] as String?,
        originalLink: json['original_link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'short_link': shortLink,
        'full_short_link': fullShortLink,
        'short_link2': shortLink2,
        'full_short_link2': fullShortLink2,
        'share_link': shareLink,
        'full_share_link': fullShareLink,
        'original_link': originalLink,
      };

  ShortLink copyWith({
    String? code,
    String? shortLink,
    String? fullShortLink,
    String? shortLink2,
    String? fullShortLink2,
    String? shareLink,
    String? fullShareLink,
    String? originalLink,
  }) {
    return ShortLink(
      code: code ?? this.code,
      shortLink: shortLink ?? this.shortLink,
      fullShortLink: fullShortLink ?? this.fullShortLink,
      shortLink2: shortLink2 ?? this.shortLink2,
      fullShortLink2: fullShortLink2 ?? this.fullShortLink2,
      shareLink: shareLink ?? this.shareLink,
      fullShareLink: fullShareLink ?? this.fullShareLink,
      originalLink: originalLink ?? this.originalLink,
    );
  }

  @override
  String toString() {
    return 'ShortLink(code: $code, shortLink: $shortLink, fullShortLink: $fullShortLink, shortLink2: $shortLink2, fullShortLink2: $fullShortLink2, shareLink: $shareLink, fullShareLink: $fullShareLink, originalLink: $originalLink)';
  }
}
