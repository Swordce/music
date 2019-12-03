import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/netease_cloud/model/home_banner_entity.dart';
import 'package:music/pages/netease_cloud/model/user_model.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeSwiperState> buildEffect() {
  return combineEffects(<Object, Effect<HomeSwiperState>>{
    Lifecycle.initState:_onGetHomeBanner,
  });
}

void _onGetHomeBanner(Action action, Context<HomeSwiperState> ctx) async {
  HomeBannerEntity banners = await NeteaseCloudUserModel.getBanner();
  if(banners.code == 200) {
    ctx.dispatch(HomeSwiperActionCreator.onUpdateBannerAction(banners.banners));
  }
}
