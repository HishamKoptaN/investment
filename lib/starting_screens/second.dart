import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'termsandconditions.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  String intro =
      "تعتبر شركة الجواهر الذهبية الرائدة وهي رائدة في مجال الإبتكار والتجديد في ما يخص التصاميم والأفكار وهذا جعل اسمها داخل وخارج السلطنة ،حيث تمكنت الجواهر الذهبية الرائدة من حصد العديد من التتويجات المحلية والدولية كان اخرها حصولها على جائزة أفضل مصممة ذهب في الشرق الأوسط وذلك في باريس ضمن فعاليات الغرفة الأوربية العمانية للصناعة والإبتكار كما حصلت الشركة على العديد من الجوائز المحلية والإقليمية على سبيل الذكر وليس الحصر جائزة أحسن تصميم ذهبي وذلك في المملكة العربية السعودية فيفري ٢٠٢٣.نحن لسنا الوحيدين بل نسعى دوما أن نكون متميزين وذلك بفضل مصدقيتنا والإلتزام بالشفافية مع زبائننا الكرام شعارنا في ذلك الصدق في القول والإخلاص في العمل";
  String message =
      "رسالتنا تتلخّص في الحفاظ على التقاليد المتوارثة عن المؤسسين الأوائل في تجارة الذهب، وتقديم مجموعة عالميّة متنوّعة من المجوهرات تعبّر عمّا يدور في خلد كل امرأة ويشكّل لها حضور أنيق وأصيل وفريد يختلف عن كل امرأة أخرى.";
  String vision =
      "الرؤية أن نستمر في تجارة الذهب إلى أن يجد زبائننا في كل متجر لنا مجموعة مجوهرات لا تضاهى في الجودة، والسعر، والتصميم، ونأسر قلوبهم بمجوهرات تليق بهم على اختلاف أذواقهم. ننطلق من سلطنة عمان إلى العالم أملاً في أن نصبح من أبرز العلامات التجارية في تجارة الذهب ونكسب قلوب زبائننا أينما كانوا.";

  int selected = 0;
  Widget getSelected() {
    switch (selected) {
      case 0:
        return Text(
          intro,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.cairo(fontSize: 20, color: Colors.black),
        );
      case 1:
        return Text(
          message,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.cairo(fontSize: 20, color: Colors.black),
        );
      case 2:
        return Text(
          vision,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.cairo(fontSize: 20, color: Colors.black),
        );
      default:
        return Image.asset('assets/all3.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: -20,
            child: Image.asset(
              'assets/second_image.png',
              width: 300,
              height: 300,
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Text(
              '       رائدة\nالوهيبية',
              textDirection: TextDirection.rtl,
              style: GoogleFonts.arefRuqaa(
                  fontSize: 70, color: Colors.white, height: 0.7),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 150, left: 20, right: 20, bottom: 20),
              width: MediaQuery.sizeOf(context).width,
              height: 450,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, 0),
                  colors: [
                    Colors.white,
                    Colors.amber,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(200, 150),
                  topRight: Radius.elliptical(200, 150),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              selected = 0;
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        margin: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'المقدمة',
                                          textDirection: TextDirection.rtl,
                                          style: GoogleFonts.cairo(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        intro,
                                        textDirection: TextDirection.rtl,
                                        style: GoogleFonts.cairo(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              selected = 1;
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        margin: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'الرسالة',
                                          textDirection: TextDirection.rtl,
                                          style: GoogleFonts.cairo(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        message,
                                        textDirection: TextDirection.rtl,
                                        style: GoogleFonts.cairo(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              selected = 2;
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        margin: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'الرؤية',
                                          textDirection: TextDirection.rtl,
                                          style: GoogleFonts.cairo(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        vision,
                                        textDirection: TextDirection.rtl,
                                        style: GoogleFonts.cairo(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              selected = 3;
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(20),
                                            decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            alignment: Alignment.center,
                                          ),
                                          Image.asset('assets/all3.png'),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsAndConditions()),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
