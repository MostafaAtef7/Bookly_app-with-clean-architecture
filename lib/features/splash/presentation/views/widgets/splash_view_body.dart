import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

// SingleTickerProviderStateMixin => handle rate of values' changes and "Single" because we use one AnimationController
class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // AnimationController => it has 0:1 values to change animation
  late AnimationController animationController;
  // Make me able to give AnimationController take value 0: any number
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlideAnimation();
    navigatToHomeView();
    super.initState();
  }

// any controller must disposed because if we didn't it will work for nothing
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //stretch => make children has frame take all width of the screen
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsPathes.logo),
          const SizedBox(
            height: 10,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void navigatToHomeView() {
    // to apply something after the duration
    Future.delayed(const Duration(seconds: 2), () {
      // using getx to navigator
      // Get.to(() => const HomeView(),
      //     duration: kTransitionDuration, transition: Transition.fade);

      // Navigate using go_router package
      GoRouter.of(context).push(AppRouter.homeView);
    });
  }

  void initSlideAnimation() {
    animationController = AnimationController(
      vsync: this /*refere to SingleTickerProviderStateMixin*/,
      duration: const Duration(seconds: 3), /*Animation works for the duration*/
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 15),
      end: const Offset(0, 0),
    ).animate(animationController);
    // start playing animation
    animationController.forward();

    // listen to any change and setState but we user AnimatedBuilder so it listen instead addListener
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }
}
