import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double loanAmount = 100000;
  double loanInterest = 10;
  double loanYears = 9;

  double totalInterest = 0;
  double perMonthEMI = 0;
  double perMonthInterest = 0;

  int interestPerMonth = 0;
  int emiPerMonth = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff20295c),
          leading: Icon(Icons.menu),
          elevation: 0,
          centerTitle: true,
          title: Text("EMI CALCULATOR",
              style: TextStyle(color: Color(0xFFE7F6F2))),
        ),
        body: Stack(
          children: [
            // main container background
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 5),
                ],
                color: Color(0xff20295c),
              ),
            ),

            // per month emi text / container
            Container(
              height: 150,
              width: double.infinity,
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // per month emi
                      Container(
                        height: 100,
                        width: 200,
                        //color: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              "Your Loan Emi",
                              style: TextStyle(
                                color: Color(0xFFE7F6F2),
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "\$ $emiPerMonth",
                              style: TextStyle(
                                  color: Color(0xFFE7F6F2),
                                  letterSpacing: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Per month",
                              style: TextStyle(
                                color: Color(0xFFE7F6F2),
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // per month interest
                      Container(
                        height: 100,
                        width: 200,
                        //color: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              "Your Interest",
                              style: TextStyle(
                                color: Color(0xFFE7F6F2),
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "\$ $interestPerMonth",
                              style: TextStyle(
                                  color: Color(0xFFE7F6F2),
                                  letterSpacing: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Per month",
                              style: TextStyle(
                                color: Color(0xFFE7F6F2),
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // container of slider
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 110),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 5),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        // loan amount slider
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Loan Amount",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 180, top: 20),
                              child: Text("\$ $loanAmount",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 1000000,
                          divisions: 10,
                          activeColor: Color(0xff12205a),
                          inactiveColor: Color(0xffbecce8),
                          // thumbColor: Color(0xff12205a),
                          value: loanAmount,
                          onChanged: (value) {
                            setState(() {
                              loanAmount = value;
                            });
                          },
                        ),

                        // interest slider
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Loan Interest",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 225, top: 20),
                              child: Text("$loanInterest%",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 15,
                          divisions: 15,
                          activeColor: Color(0xff12205a),
                          inactiveColor: Color(0xffbecce8),
                          value: loanInterest,
                          onChanged: (value) {
                            setState(() {
                              loanInterest = value;
                            });
                          },
                        ),

                        // emi by year
                        // Total year slider
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Total Years",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 200, top: 20),
                              child: Text("$loanYears Years",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 10,
                          divisions: 10,
                          activeColor: Color(0xff12205a),
                          inactiveColor: Color(0xffbecce8),
                          value: loanYears,
                          onChanged: (value) {
                            setState(() {
                              loanYears = value;
                            });
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        // row for clear and calculate

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // clear container
                            InkWell(
                              onTap: () {
                                setState(() {
                                  loanAmount = 0;
                                  loanInterest = 0;
                                  loanYears = 0;
                                  emiPerMonth = 0;
                                  interestPerMonth = 0;
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF2C3333),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: Color(0xFF395B64),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    color: Color(0xFF2C3333),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff20295c),
                                      Color(0xffbecce8),
                                    ])),
                                child: Center(
                                  child: Text("Reset",
                                      style: TextStyle(
                                        color: Color(0xFFE7F6F2),
                                        fontSize: 25,
                                        letterSpacing: 2,
                                      )),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 50,
                            ),

                            // count container for all calculation
                            InkWell(
                              onTap: () {
                                setState(() {
                                  totalInterest =
                                      (loanAmount * loanInterest) / 100;
                                  perMonthEMI = (loanAmount + totalInterest) /
                                      (loanYears * 12);
                                  perMonthInterest =
                                      totalInterest / (loanYears * 12);

                                  interestPerMonth = perMonthInterest.toInt();
                                  emiPerMonth = perMonthEMI.toInt();
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF2C3333),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: Color(0xFF395B64),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff20295c),
                                      Color(0xffbecce8),
                                    ])),
                                child: Center(
                                  child: Text("Calculate",
                                      style: TextStyle(
                                        color: Color(0xFFE7F6F2),
                                        fontSize: 25,
                                        letterSpacing: 2,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
