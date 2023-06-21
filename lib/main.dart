import 'package:flutter/material.dart';

void main() => runApp(const ScreenAreaCalculation());

class ScreenAreaCalculation extends StatefulWidget {
  const ScreenAreaCalculation({Key? key}) : super(key: key);

  @override
  State<ScreenAreaCalculation> createState() => _ScreenAreaCalculationState();
}

class _ScreenAreaCalculationState extends State<ScreenAreaCalculation> {
  final Title = '평형 계산기';
  final ment = '평형 계산기는 *"평" 과 ㎡(제곱미터) 간 단위변환 한 결과를 제공해주는 서비스를 제공합니다 \n\n'
      '＊"평" : 한국에서 사용하는 집의 면적에 대한 단위입니다.';

  String user_input = '';
  String result = '';
  String result2 = '';
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
    textEditingController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: Title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        // primaryColor: Colors.blueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0, //AppBar 그림자 없게
          centerTitle: false,
          title: Text(Title, style: const TextStyle(color: Colors.white)),
        ),
        body: Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.all(2.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    const Icon(Icons.android, color: Colors.amber),
                    Text(
                      "$ment",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        // fontSize: 10.0,
                        fontSize: 12.5,
                      ),
                    ),
                    Form(//하위 TextFormField에 대한 상태를 관리할 수 있는 위젯
                      child:  TextFormField(
                        controller: null,
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: '㎡',
                          hintText: 'ex )  3.3 / 58',
                        ),
                        // validator: (value) {if (value!.isEmpty) {return '입력되지 않았네요.다시 작성해주세요.';}return null;},
                        onChanged: (text) {
                          setState(() {
                            user_input = text;
                            print(user_input);
                            result = (double.parse(text) / 3.3).toStringAsFixed(2) + ' ' + '평';
                            print("onChanged: ${result}");

                            // if (value!.isEmpty) {}
                          });
                        },
                        // onSaved: (value) {setState(() {result = ' ';});},
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          // Icon(Icons.read_more),
                          const Icon(Icons.arrow_downward_outlined),
                          const Icon(Icons.calculate_rounded),
                          const Icon(Icons.arrow_downward_outlined),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "$result",
                            style: const TextStyle(
                              // color: Colors.cyanAccent,
                              color: Colors.amber,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),


                    TextFormField(
                      controller: null,
                      initialValue: '',
                      decoration: const InputDecoration(
                        labelText: '평',
                        hintText: 'ex )  1 / 5 / 17 / 32 / 48',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '입력되지 않았네요.다시 작성해주세요.';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          user_input = text;
                          print(user_input);
                          result2 = (double.parse(text) * 3.3).toStringAsFixed(2) + ' ' + '㎡';
                          print("onChanged: ${result2}");
                        });
                      },
                      onTapOutside: (text){
                        print("onTapOutside:");
                      },
                      // onFieldSubmitted: (value) {setState(() {}); },
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          // Icon(Icons.read_more),
                          const Icon(Icons.arrow_downward_outlined),
                          const Icon(Icons.calculate_rounded),
                          const Icon(Icons.arrow_downward_outlined),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "$result2",
                            style: const TextStyle(
                              // color: Colors.cyanAccent,
                              color: Colors.amber,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
