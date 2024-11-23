import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/screens/tic_tac_toe_screen/widget/button_item.dart';
import 'package:tic_tac_toe/screens/tic_tac_toe_screen/widget/dialog_item.dart';
import 'package:tic_tac_toe/screens/tic_tac_toe_screen/widget/main_item.dart';
import 'package:tic_tac_toe/utils/colors/app_colors.dart';
import 'package:tic_tac_toe/utils/images/app_images.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> board = List.filled(9, '');
  bool isXTurn = true;


  int x = 0 ;
  int o = 0;

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      isXTurn = true;
    });
  }

  void _onTap(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
      });
      String winner = checkWinner();
      if (winner != '') {
        if (winner == "X") {
          x++;
          setState(() {});
        } else {
          o++;
          setState(() {});
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.c391898,
            content : DialogItem(
              image: AppImages.winner,
              text: "Player $winner Win",
              onTap: () {
                Navigator.pop(context);
                resetGame();
              },
            ),
          ),
        );
      } else if (!board.contains('')) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.c391898,
            content: DialogItem(
              image: AppImages.draw,
              text: "Draw",
              onTap: () {
                Navigator.pop(context);
                resetGame();
              },
            ),
          ),
        );
      }
    }
  }

  String checkWinner() {
    const winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var positions in winningPositions) {
      String a = board[positions[0]];
      String b = board[positions[1]];
      String c = board[positions[2]];
      if (a != '' && a == b && a == c) {
        return a;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c5D5FEF,
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonItem(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
                Text(
                  "$x : $o",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ButtonItem(
                  icon: Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.all(15.w),
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                  color: AppColors.c391898,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                children: [
                  Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.sp),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => _onTap(index),
                      child: MainItem(
                        board: board[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
