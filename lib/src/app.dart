import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/controller/app_controller.dart';

// root route '/'
// 이 위젯에서 사용되는 컨트롤러 등록 statelesswidget -> getview
class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // controller에서 state를 가져오기 위해 Obx로 감싸줌
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          // 애니메이션 타입
          type: BottomNavigationBarType.fixed,
          // 현재 선택된 메뉴
          currentIndex: controller.currentIndex.value,
          // 선택되었을때 라벨 출력
          showSelectedLabels: true,
          // 선택되었을때 색상
          selectedItemColor: Colors.black,
          // items를 누를때 이벤트
          onTap: (index) {
            controller.changePageIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/icons/compass_off.svg',
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/icons/compass_on.svg',
                width: 22,
              ),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/icons/plus.svg',
                  width: 35,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg'),
              label: '구독',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg'),
              label: '보관함',
            ),
          ],
        ),
      ),
    );
  }
}
