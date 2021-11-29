import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  createState() => SkeletonState();
}

class SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation? gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller!.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14))),
          width: Adaptive.w(45),
          height: Adaptive.h(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: Adaptive.w(45),
                height: Adaptive.h(22.5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(gradientPosition!.value, 0),
                        end: const Alignment(-1, 0),
                        colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ]),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Adaptive.w(20),
                      height: Adaptive.h(1.5),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(gradientPosition!.value, 0),
                              end: const Alignment(-1, 0),
                              colors: const [
                                Colors.black12,
                                Colors.black26,
                                Colors.black12
                              ]),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14))),
                    ),
                    SizedBox(
                      height: Adaptive.h(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Adaptive.w(32),
                          height: Adaptive.h(1.5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(gradientPosition!.value, 0),
                                  end: const Alignment(-1, 0),
                                  colors: const [
                                    Colors.black12,
                                    Colors.black26,
                                    Colors.black12
                                  ]),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14))),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
