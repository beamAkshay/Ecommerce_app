// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class BannerData {
  final String? banner_id;
  final String? banner_collection_id;
  final String? name;
  final String? category_id;
  final String? enable_date;
  final String? disable_date;
  final String? image;
  final String? mobile_image;
  final String? link;
  final String? sequence;

  BannerData(
      this.banner_id,
      this.banner_collection_id,
      this.name,
      this.category_id,
      this.enable_date,
      this.disable_date,
      this.image,
      this.mobile_image,
      this.link,
      this.sequence);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'banner_id': banner_id,
      'banner_collection_id': banner_collection_id,
      'name': name,
      'category_id': category_id,
      'enable_date': enable_date,
      'disable_date': disable_date,
      'image': image,
      'mobile_image': mobile_image,
      'link': link,
      'sequence': sequence,
    };
  }

  factory BannerData.fromJson(Map<String, dynamic> map) {
    return BannerData(
      map['banner_id'] != null ? map['banner_id'] as String : null,
      map['banner_collection_id'] != null
          ? map['banner_collection_id'] as String
          : null,
      map['name'] != null ? map['name'] as String : null,
      map['category_id'] != null ? map['category_id'] as String : null,
      map['enable_date'] != null ? map['enable_date'] as String : null,
      map['disable_date'] != null ? map['disable_date'] as String : null,
      map['image'] != null ? map['image'] as String : null,
      map['mobile_image'] != null ? map['mobile_image'] as String : null,
      map['link'] != null ? map['link'] as String : null,
      map['sequence'] != null ? map['sequence'] as String : null,
    );
  }

  @override
  String toString() {
    return 'BannerData(banner_id: $banner_id, banner_collection_id: $banner_collection_id, name: $name, category_id: $category_id, enable_date: $enable_date, disable_date: $disable_date, image: $image, mobile_image: $mobile_image, link: $link, sequence: $sequence)';
  }
}
