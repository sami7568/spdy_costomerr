import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Menu/home_page.dart';

class TellUsWhy extends StatefulWidget {
  const TellUsWhy({Key? key}) : super(key: key);

  @override
  _TellUsWhyState createState() => _TellUsWhyState();
}

class _TellUsWhyState extends State<TellUsWhy> {
  TextEditingController textareaController = TextEditingController();
  double starCounter = 0;
  Color submitcolor = buttonUnPressColor();
  Color submittextcolor = textblackColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:  backgroundColor(),
          child:
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20, right: 15, left: 15),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rate Order", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15,),
                    Container(
                      height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Order #ABC-123",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5,),
                              Text("Nancy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(height: 5,),
                              Text("Request: Light Towing, Battery Replacement"),
                            ],
                          ),
                        ),
                    ),
                    const SizedBox(height: 30,),
                    const Text("Tell us what happened",style: TextStyle(fontSize: 22,color: Colors.white),),
                    const SizedBox(height:10),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: textareaController,
                        decoration: const InputDecoration(
                          border:  OutlineInputBorder(),
                          hintText: 'Type here???',
                        ),
                        onChanged : (value){
                          //change color
                          changecolr(value);
                        },
                        maxLines: 13,
                      ),
                    ),
                    const SizedBox(height:30),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        },
                        child: Container(
                          width: 280,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: submitcolor,
                          ),
                          child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: submittextcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70,),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.menu, color: Colors.white, size: 39,),
                      Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }


  void changecolr(String value){
    if(value.isNotEmpty)
    {
      setState(() {
        submitcolor = buttonPressColor();
        submittextcolor = textWhiteColor();
      });
    }
    else{
      setState(() {
        submitcolor = buttonUnPressColor();
        submittextcolor = textblackColor();
        // ignore: avoid_print
        print("colors changed");
        // ignore: avoid_print
        print(value.length);
      });
    }
  }
}


