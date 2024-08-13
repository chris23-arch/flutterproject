// void main() {
//   int age = 18;
//   switch(age){
//     case 11:
//       print("age is 11");
//       break;
      
//     case 20: 
//       print("age is 20");
//       break;
      
//     case 18:
//       print("age is 18");
//       break;
      
//     case 40:
//       print("age is 40");
//       break;
      
//     default:
//       print("None of the above");
//       break;
//   }
// }

/*
import 'package:flutter/material.dart';

LOOP
loops are syntax that is used to make an event reoccur
depending on the condition. Reoccurence is directly proportional to the condition.
there are four types of loop;
1. For Loop
        which consits of
        a) initialization
        b) Condition
        c) control(Decrement or Increment)
        * contine - Skips and Continues a loop and dosen`t return or break
        * return/break - stops a loop once once the target or comparison is reached
 2. While Loop
 3. Do While Loop
 4. For each Loop        
*/

/*
//    For loop
//   1. loop 1 from numbers 100 to 0
  for (int i = 100; i > 0; i--) {
    print(i);
  }
//   2. loop j from numbers 0 to 100
  for (int j = 0; j < 100; j++) {
    print(j);
  }
//   3. loop k from 30 to 56
  for(int k = 30; k < 57; k++) {
    print(k);
  }
  
//   continue for loop
  
  for(int l = 1; l < 10; l++) {
    if(l ==5) {
      continue;
//       break;
//       return;
    }
    print(l);
  }
  
//   While loop
  int m = 100;
  while(m > 0) {
    m--;
    print(m);
  }
  
//   Do While
  int n = 0;
  do{
    n++;
    print(n);
  }while(n < 100);
}
 */

/*
  
List<String> names = ["Sylva", "Somtee", "Amos", "Victor"];
List<int> number = [3, 6, 7, 4, 6, 8];
List<dynamic> both = ["Saint", 3, 6, "King", "queen", 4];

for(int i = 0; i < names.length; i++) {
  print(names[i]);
}
    
    List<List<String>> jss1 = [
      ["Ezinne", "Sylva"],
       ["Somtee", "Victor"],
       ["Austine", "Samuel"],
        ["Vincent", "Toochi"],
    ];
    
    print(jss1[2][1]);
 */

/*
  
  var myList = [];
  
  myList.add("somtee");
  myList.add("Dennis");
  print(myList);
  
  myList.removeAt(0);
  print(myList);

}
 */




/*
List<List<String>> jss1 = [
    ["Ezinne", "Sylva"],
    ["Somtee", "Victor"],
    ["Austine", "Samuel"],
    ["Vincent", "Toochi"],
  ];

   // SvgPicture.asset(
                  //   'assets/images/image1.svg',
                  //   width: 160.0,
                  //   height: 94.0,
                  // ),

  print(jss1[0][0]);
  print(jss1[0][1]);
  print(jss1[1][0]);
  print(jss1[1][1]);
  print(jss1[2][0]);
  print(jss1[2][1]);
  print(jss1[3][0]);
  print(jss1[3][1]);
 */






/*
  
  for (
int i = 1; i <= 12; i++) {
    for(int j = 1; j<= 12; j++) {
      print('$i x $j = ${i * j}');
    }
  }
 */

  /* INTRO TO MAPS
    In Flutter, maps refer to the data structure used to store key-value 
    pairs. It is similar to the concept of an associative array in other
    programming language.
    Flutter provide a built-in class called Map for working with maps.
   */
  
 /*
 Map<String, dynamic> jss2 = {
    "name": "Amos",
    "gender": "Male",
    "class": "Jss2",
    "level": 1,
  };
  
  print(jss2["name"]);
  print(jss2["gender"]);
  
  jss2.forEach((key, value) {
    print(key);
    print(value);
  });

  Map<String, dynamic> bio = {
    "profile": {"name": "Amos", "gender": "Male"},
    "education": {"secondary": "Airforce", "tertiary": "Unn"},
  };
  
  print(bio["profile"]["name"]);
  print(bio["education"]["tertiary"]);
  
  List<Map<String, dynamic>> students = [
    {"Usrname": "Somtee", "Class": "SS3", "Password":  1234},
     {"Usrname": "Sylva", "Class": "SS2", "Password":  5678},
     {"Usrname": "Davies", "Class": "SS1", "Password":  9012},
     {"Usrname": "Carl", "Class": "Jss3", "Password":  2345},
  ];
  
  for(int i = 0; i < students.length; i++) {
    print(students[1]);
  }
   for(int i = 0; i < students.length; i+=2) {
    print(students[1]);
  }
  
  
  var myMap = {};
  myMap["name"] = "somtee";
  myMap["gender"] = "Male";
  
  print(myMap);
  
  myMap.remove("name");
  print(myMap);
  */









