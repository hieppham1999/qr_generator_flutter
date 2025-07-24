import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/presentation/features/home_tab/home_tab_cubit.dart';
import 'package:qr_generator_flutter/presentation/features/home_tab/home_tab_state.dart';
import 'package:qr_generator_flutter/presentation/widgets/qr_card_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin{
  final cubit = getIt.get<HomeTabCubit>();

  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  void _onRefresh() async {
    await cubit.loadQrList();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CubitStateBuilder<HomeTabState>(
      cubit: cubit,
      builder:
          (_, state) =>
              state.listQr.isEmpty
                  ? Center(child: buildCreateQrButton())
                  : Column(
                    children: [
                      Expanded(
                        child: SmartRefresher(
                          header: WaterDropHeader(),
                          onRefresh: _onRefresh,
                          controller: _refreshController,
                          child: ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: state.listQr.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = state.listQr[index];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  QrCard(qr: item),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
    );
  }

  ElevatedButton buildCreateQrButton() {
    return ElevatedButton(
      onPressed: () {
        NavController.pushNamed(QrCreateRoute());
      },
      child: Text(Languages.translate.createQr),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
