import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/home_banner_entity.dart';

//TODO replace with your own action
enum HomeSwiperAction { getHomeBanner,updateBanner}

class HomeSwiperActionCreator {
  static Action onGetHomeBannerAction() {
    return const Action(HomeSwiperAction.getHomeBanner);
  }

  static Action onUpdateBannerAction(List<HomeBannerBanner> mlist) {
    return Action(HomeSwiperAction.updateBanner,payload: mlist);
  }
}
