import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_info/database/database.dart';

class Question extends StatefulWidget {
  Question({required this.category, super.key});
  String category;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool show = false;
  getOnTheLoad() async {
    quizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    // TODO: implement initState
    super.initState();
  }

  Stream? quizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
      stream: quizStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
              controller: controller,
              itemCount: snapshot.data.docs.length,
              // itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20, top: 40),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              ds['image'],
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            show = true;
                            setState(() {});
                          },
                          child: show
                              ? Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ds["correct answer"] ==
                                                    ds["option1"]
                                                ? Colors.green
                                                : Colors.red,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option1'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF818181),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option1'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            show = true;
                            setState(() {});
                          },
                          child: show
                              ? Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ds["correct answer"] ==
                                                    ds["option2"]
                                                ? Colors.green
                                                : Colors.red,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option2'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF818181),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option2'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            show = true;
                            setState(() {});
                          },
                          child: show
                              ? Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ds["correct answer"] ==
                                                    ds["option3"]
                                                ? Colors.green
                                                : Colors.red,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option3'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF818181),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option3'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            show = true;
                            setState(() {});
                          },
                          child: show
                              ? Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ds["correct answer"] ==
                                                    ds["option4"]
                                                ? Colors.green
                                                : Colors.red,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option4'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF818181),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      ds['option4'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            show = false;
                            controller.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF004840),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004840),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Color(0xFFf35b32),
                          borderRadius: BorderRadius.circular(60)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    widget.category,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
