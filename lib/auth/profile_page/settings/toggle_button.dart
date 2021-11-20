import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToggleBotton extends StatelessWidget {
  ToggleBotton({this.isToggled, this.toggleButton});
  final isToggled;
  final toggleButton;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 25.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isToggled
            ? Colors.greenAccent[700]?.withOpacity(1)
            : Colors.red.withOpacity(1),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            child: InkWell(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                child: isToggled
                    ? Icon(
                        FontAwesomeIcons.solidCircle,
                        color: Colors.white,
                        key: UniqueKey(),
                        size: 20,
                      )
                    : Icon(
                        FontAwesomeIcons.solidCircle,
                        color: Colors.white,
                        size: 20,
                        key: UniqueKey(),
                      ),
              ),
              onTap: toggleButton,
            ),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            top: 2,
            left: isToggled ? 25.0 : 0.0,
            right: isToggled ? 0.0 : 25.0,
          )
        ],
      ),
    );
  }
}
