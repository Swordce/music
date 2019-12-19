import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/home_banner_entity.dart';

class HomeSwiperState implements Cloneable<HomeSwiperState> {
  List<HomeBannerBanner> bannerList;

  @override
  HomeSwiperState clone() {
    return HomeSwiperState()..bannerList = bannerList;
  }
}

HomeSwiperState initState(Map<String, dynamic> args) {
  HomeSwiperState swiperState = new HomeSwiperState();
   swiperState.bannerList = args != null? args['homeBanner'] : null;
  return swiperState;
}
