import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/model/common_rank_model.dart';
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/rank_entity.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';

import 'action.dart';
import 'state.dart';

Effect<RankState> buildEffect() {
  return combineEffects(<Object, Effect<RankState>>{
    RankAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose:_onDispose,
  });
}

void _onDispose(Action action, Context<RankState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onIsBackToMain(true));
}

void _onInit(Action action, Context<RankState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onIsBackToMain(false));
  _loadRank(ctx);
}

void _onAction(Action action, Context<RankState> ctx) {}

void _loadRank(Context<RankState> ctx) async {
  RankEntity entity = await NeteaseCloudNetUtils.getRanklist();
  if (entity != null) {
    _parseRankData(entity,ctx);
  }
}

void _parseRankData(RankEntity entity,Context<RankState> ctx) {
  List<CommonRankModel> models = [];
  List<CommonRankModel> moreModels = [];//更多中需要排除掉官方榜的数量
  entity.list.forEach((rankList) {
    CommonRankModel model = CommonRankModel();
    model.name = rankList.name;
    model.id = rankList.id.toString();
    model.description = rankList.description;
    model.updateFrequency = rankList.updateFrequency;
    model.coverImgUrl = rankList.coverImgUrl;
    if(rankList.tracks != null && rankList.tracks.length > 0) {
      model.toplistType = CommonRankModel.RANK_OFFICAL;
      model.tracks = [];
      rankList.tracks.forEach((tracks){
        CommonRankTracksModel tracksModel = CommonRankTracksModel();
        tracksModel.first = tracks.first;
        tracksModel.second = tracks.second;
        model.tracks.add(tracksModel);
      });
      models.add(model);
    }else{
      moreModels.add(model);
    }
  });

  ctx.dispatch(RankActionCreator.onLoadRanks({'officalModel':models,'moreModels':moreModels}));
}
