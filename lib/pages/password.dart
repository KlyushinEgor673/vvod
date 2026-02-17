import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  List<String> numbers = ['', '', '', '', '', ''];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
    _controller.addListener(() {
      for (int i = 0; i < numbers.length; ++i) {
        setState(() {
          numbers[i] = '';
        });
      }
      for (int i = 0; i < _controller.text.length; ++i) {
        setState(() {
          numbers[i] = _controller.text[i];
        });
      }
      if (_controller.text.length == 6) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/another',
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              // width: 300,
              // height: 50,
              opacity: 0,
              child: TextField(
                focusNode: _focusNode,
                controller: _controller,
                keyboardType: TextInputType.number,
                onChanged: (value){
                  setState(() {
                    _controller.text = value.replaceAll(RegExp('[^0-9]'), '');
                  });
                },
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            GestureDetector(
              onTap: () {
                _focusNode.requestFocus();
              },
              child: ListView(
                children: [
                  SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(child: Text(numbers[0])),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(child: Text(numbers[1])),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(child: Text(numbers[2])),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(child: Text(numbers[3])),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(child: Text(numbers[4])),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Center(child: Text(numbers[5])),
                      ),
                      SizedBox(width: 10),
                    ],
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
