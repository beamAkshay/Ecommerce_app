// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'banner_data.dart';

class BannerDetails {
  final List<BannerData>? Banners;
  BannerDetails({
    this.Banners,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'Banners': Banners!.map((x) => x.toJson()).toList(),
    };
  }

  factory BannerDetails.fromJson(Map<String, dynamic> map) {
    return BannerDetails(
      Banners: map['Banners'] != null
          ? List<BannerData>.from(
              (map['Banners'] as List<dynamic>).map<BannerData?>(
                (x) => BannerData.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() => 'BannerDetails(Banners: $Banners)';
}
