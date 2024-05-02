
import 'package:councils/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';

import '../activation_screen/activate.dart';

class BoardingModel {
  String? address;
   String? image;
  String? text;

  BoardingModel({this.address,this.image, this.text});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        address: 'Welcome',
        image: 'assets/images/Animation - 1710159036531 (1).json',
        text:
            'councils application is one of the most important applications that helps in organizing the councils’ appointments as well as adding members to these councils, and everything that happens in these councils is done electronically.'
    ),
    BoardingModel(
        address: 'About',
        image: 'assets/images/img_2.json',
        text: 'Everything is done electronically, starting with uploading topics on the website, choosing the topics that will be discussed in the councils, and choosing the members who will participate in the council.'
    ),
    BoardingModel(
        address: 'About',
        image: 'assets/images/img_5.json',
        text: 'Through this App, you can upload your topics as a member, as well as find out which councils you join. You can also vote in the council electronically.'
    ),
    BoardingModel(
        address: 'Agreements',
        image: 'assets/images/img_3.json',
        text: 'IF you want to enjoy the features offered by our application, all you have to do is agree to begin the login procedure'
    ),
    BoardingModel(
        address: 'Congratulations',
        image: 'assets/images/img_4.json',
        text: 'You have reached the end of our introduction ,you must now activate your account, so that you can enjoy the services provided by our application '
    ),
  ];
  var current_index=0;

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              Expanded(
                child: PageView.builder(
                  controller: boardingController,
                  onPageChanged: (index) {
                  //  current_index=index;
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                    current_index=index;
                    //print('last');
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              SmoothPageIndicator(
                controller: boardingController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10.h,
                  dotWidth: 10.w,
                  activeDotColor: const Color(0xff2752e7),
                  dotColor: Colors.grey,
                  // radius: 10.r
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              (current_index>0)? Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      IconButton(
                          onPressed: (){
                            boardingController.previousPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastOutSlowIn);
                          },
                          icon: Icon(Icons.arrow_back_ios_new)
                      ),
                      // TextButton(
                      //     onPressed: (){
                      //       Navigator.pushAndRemoveUntil(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const ChairManHome()),
                      //               (route) => false);
                      //     },
                      //     child:Text(
                      //       'Skip',
                      //       style: TextStyle(
                      //           fontSize: 18.sp,
                      //           color: Color(0xff2752e7)
                      //       ),
                      //     )
                      // ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {
                          if (isLast) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ActivateScreen()),
                                    (route) => false);
                          } else {
                            boardingController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastOutSlowIn);
                          }

                        },
                        height: 43.h,
                        minWidth: 160.w,
                        shape: RoundedRectangleBorder(
                          //  side:new  BorderSide(color: Color(0xFF2A8068)), //the outline color
                            borderRadius: BorderRadius.all(Radius.circular(10.r))),
                        color: const Color(0xff2752e7),
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 15.sp, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      )
                    ],
                  ):
                  MaterialButton(
                      onPressed: (){
                        boardingController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastOutSlowIn);
                      },
                      minWidth:290.w,
                      height:43.h ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      color: Color(0xff2752e7),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 16.sp
                        ),
                      ),
                  ),



              SizedBox(
                height: 45.h,
              ),
            ],

          )

        )



        );
  }

}

Widget buildBoardingItem(BoardingModel model) => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      '${model.address}',
      style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold
      ),
    ),
    SizedBox(
      height: 12.h,
    ),
    Lottie.asset(
        '${model.image}',
        height: 200.h
    ),
    SizedBox(
      height: 20.h,
    ),
    Padding(
      padding: EdgeInsetsDirectional.only(
        start: 12.w,
        end: 8.w
      ),
      child: Text(
          '${model.text}',

          style: TextStyle(
            fontSize: 16.sp,

          ),
      ),
    ),
  ],
);


