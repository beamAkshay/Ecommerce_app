// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThemeColor {
  final String? primaryColor;
  final String? secondaryColor;
  final String? topNavBgColor;
  final String? topNavLinkColor;
  final String? bottomNavBgColor;
  final String? bottomNavLinkColor;
  final String? topFooterBgColor;
  final String? topFooterTextColor;
  final String? middleFooterBgColor;
  final String? middleFooterTextColor;
  final String? bottomFooterBgColor;
  final String? bottomFooterTextColor;
  final String? primaryButtonBgColor;
  final String? primaryButtonTextColor;
  final String? infoButtonBgColor;
  final String? infoButtonTextColor;
  final String? successButtonBgColor;
  final String? successButtonTextColor;
  final String? dangerBtnBgColor;
  final String? dangerButtonTextColor;
  ThemeColor({
    this.primaryColor,
    this.secondaryColor,
    this.topNavBgColor,
    this.topNavLinkColor,
    this.bottomNavBgColor,
    this.bottomNavLinkColor,
    this.topFooterBgColor,
    this.topFooterTextColor,
    this.middleFooterBgColor,
    this.middleFooterTextColor,
    this.bottomFooterBgColor,
    this.bottomFooterTextColor,
    this.primaryButtonBgColor,
    this.primaryButtonTextColor,
    this.infoButtonBgColor,
    this.infoButtonTextColor,
    this.successButtonBgColor,
    this.successButtonTextColor,
    this.dangerBtnBgColor,
    this.dangerButtonTextColor,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
      'topNavBgColor': topNavBgColor,
      'topNavLinkColor': topNavLinkColor,
      'bottomNavBgColor': bottomNavBgColor,
      'bottomNavLinkColor': bottomNavLinkColor,
      'topFooterBgColor': topFooterBgColor,
      'topFooterTextColor': topFooterTextColor,
      'middleFooterBgColor': middleFooterBgColor,
      'middleFooterTextColor': middleFooterTextColor,
      'bottomFooterBgColor': bottomFooterBgColor,
      'bottomFooterTextColor': bottomFooterTextColor,
      'primaryButtonBgColor': primaryButtonBgColor,
      'primaryButtonTextColor': primaryButtonTextColor,
      'infoButtonBgColor': infoButtonBgColor,
      'infoButtonTextColor': infoButtonTextColor,
      'successButtonBgColor': successButtonBgColor,
      'successButtonTextColor': successButtonTextColor,
      'dangerBtnBgColor': dangerBtnBgColor,
      'dangerButtonTextColor': dangerButtonTextColor,
    };
  }

  factory ThemeColor.fromJson(Map<String, dynamic> map) {
    return ThemeColor(
      primaryColor:
          map['primaryColor'] != null ? map['primaryColor'] as String : null,
      secondaryColor: map['secondaryColor'] != null
          ? map['secondaryColor'] as String
          : null,
      topNavBgColor:
          map['topNavBgColor'] != null ? map['topNavBgColor'] as String : null,
      topNavLinkColor: map['topNavLinkColor'] != null
          ? map['topNavLinkColor'] as String
          : null,
      bottomNavBgColor: map['bottomNavBgColor'] != null
          ? map['bottomNavBgColor'] as String
          : null,
      bottomNavLinkColor: map['bottomNavLinkColor'] != null
          ? map['bottomNavLinkColor'] as String
          : null,
      topFooterBgColor: map['topFooterBgColor'] != null
          ? map['topFooterBgColor'] as String
          : null,
      topFooterTextColor: map['topFooterTextColor'] != null
          ? map['topFooterTextColor'] as String
          : null,
      middleFooterBgColor: map['middleFooterBgColor'] != null
          ? map['middleFooterBgColor'] as String
          : null,
      middleFooterTextColor: map['middleFooterTextColor'] != null
          ? map['middleFooterTextColor'] as String
          : null,
      bottomFooterBgColor: map['bottomFooterBgColor'] != null
          ? map['bottomFooterBgColor'] as String
          : null,
      bottomFooterTextColor: map['bottomFooterTextColor'] != null
          ? map['bottomFooterTextColor'] as String
          : null,
      primaryButtonBgColor: map['primaryButtonBgColor'] != null
          ? map['primaryButtonBgColor'] as String
          : null,
      primaryButtonTextColor: map['primaryButtonTextColor'] != null
          ? map['primaryButtonTextColor'] as String
          : null,
      infoButtonBgColor: map['infoButtonBgColor'] != null
          ? map['infoButtonBgColor'] as String
          : null,
      infoButtonTextColor: map['infoButtonTextColor'] != null
          ? map['infoButtonTextColor'] as String
          : null,
      successButtonBgColor: map['successButtonBgColor'] != null
          ? map['successButtonBgColor'] as String
          : null,
      successButtonTextColor: map['successButtonTextColor'] != null
          ? map['successButtonTextColor'] as String
          : null,
      dangerBtnBgColor: map['dangerBtnBgColor'] != null
          ? map['dangerBtnBgColor'] as String
          : null,
      dangerButtonTextColor: map['dangerButtonTextColor'] != null
          ? map['dangerButtonTextColor'] as String
          : null,
    );
  }

  @override
  String toString() {
    return 'ThemeColor(primaryColor: $primaryColor, secondaryColor: $secondaryColor, topNavBgColor: $topNavBgColor, topNavLinkColor: $topNavLinkColor, bottomNavBgColor: $bottomNavBgColor, bottomNavLinkColor: $bottomNavLinkColor, topFooterBgColor: $topFooterBgColor, topFooterTextColor: $topFooterTextColor, middleFooterBgColor: $middleFooterBgColor, middleFooterTextColor: $middleFooterTextColor, bottomFooterBgColor: $bottomFooterBgColor, bottomFooterTextColor: $bottomFooterTextColor, primaryButtonBgColor: $primaryButtonBgColor, primaryButtonTextColor: $primaryButtonTextColor, infoButtonBgColor: $infoButtonBgColor, infoButtonTextColor: $infoButtonTextColor, successButtonBgColor: $successButtonBgColor, successButtonTextColor: $successButtonTextColor, dangerBtnBgColor: $dangerBtnBgColor, dangerButtonTextColor: $dangerButtonTextColor)';
  }
}
