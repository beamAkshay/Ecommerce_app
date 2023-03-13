import 'package:unicorn_store/Data/Data_Providers/Banner/banner_details_api.dart';

import '../../Models/banner/banner_details.dart';

class BannerDetailsRepository {
  final BannerDetailsApi bannerDetailsApi = BannerDetailsApi();
  Future<BannerDetails> viewHomePageBanner() {
    return bannerDetailsApi.viewHomePageBanner();
  }
}
