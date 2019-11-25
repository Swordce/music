import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/home/adapter/item/page.dart';
import 'package:music/pages/home/adapter/item/state.dart';
import 'package:music/pages/home/state.dart';

class HomePageAdapter extends DynamicFlowAdapter<HomeState> {
  HomePageAdapter()
      : super(
          pool: <String, Component<Object>>{
            'HomePageItem':HomePageItemPage(),
          },
          connector: _HomePageConnector(),
          );
}

class _HomePageConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    if(state.itemState?.isNotEmpty == true) {
      return state.itemState
          .map<ItemBean>((HomePageItemState data) => ItemBean('HomePageItem', data))
          .toList(growable: true);
    }
    return <ItemBean>[];
  }

  @override
  void set(HomeState state, List<ItemBean> items) {
    if(items?.isNotEmpty ==  true) {
      state.itemState = List<HomePageItemState>.from(
          items.map<HomePageItemState>((ItemBean bean) => bean.data).toList());
    }else{
      state.itemState = <HomePageItemState>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
