// // ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'login.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool passwordObsecured = true;

//   late final TextEditingController _emailcontroller;
//   late final TextEditingController _passwordcontroller;

//   void _signUp() async {
//     const url = "http://localhost:3000/signup";
//     final email = _emailcontroller.text;
//     final password = _passwordcontroller.text;

//     final body = jsonEncode({'email': email, 'password': password});

//     final resposne = await http.post(
//       Uri.parse(url),
//       headers: {'Content-Type': 'application/json'},
//       body: body,
//     );
//     print(resposne.body);
//     print(resposne.statusCode);
//     if (resposne.statusCode == 200) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text("success"),
//               content: const Text("your account has been created"),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Ok"))
//               ],
//             );
//           });
//     } else if (resposne.statusCode == 409) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text("error"),
//               content: const Text("Failed to sign up"),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Ok"))
//               ],
//             );
//           });
//     }
//   }

//   @override
//   void initState() {
//     _emailcontroller = TextEditingController();
//     _passwordcontroller = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _emailcontroller.dispose();
//     _passwordcontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 240, 227, 250),
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             Stack(children: [
//               Container(
//                 height: 190,
//                 decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     borderRadius:
//                         BorderRadius.only(bottomRight: Radius.circular(90))),
//               ),
//               Column(
//                 children: [
//                   Container(
//                       alignment: Alignment.topLeft,
//                       padding: const EdgeInsets.only(top: 90, left: 30),
//                       child: const Text(
//                         "Wlcome!",
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Color.fromARGB(255, 97, 43, 139),
//                             fontWeight: FontWeight.w700),
//                       )),
//                   Container(
//                       alignment: Alignment.topLeft,
//                       padding: const EdgeInsets.only(left: 30),
//                       child: const Text(
//                         "Sign Up and get started",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Color.fromARGB(255, 48, 48, 48),
//                             fontWeight: FontWeight.w500),
//                       ))
//                 ],
//               ),
//             ]),
//             const SizedBox(
//               height: 55,
//             ),
//             Form(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 30, right: 30),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       controller: _emailcontroller,
//                       decoration: InputDecoration(
//                           hintText: 'Email',
//                           hintStyle: const TextStyle(fontSize: 17),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(22),
//                             borderSide: const BorderSide(
//                               width: 0,
//                               style: BorderStyle.none,
//                             ),
//                           ),
//                           filled: true,
//                           contentPadding: const EdgeInsets.all(16),
//                           fillColor: const Color.fromARGB(255, 255, 255, 255)
//                               .withOpacity(0.6),
//                           suffixIcon: const Icon(Icons.email_sharp)),
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     TextField(
//                       controller: _passwordcontroller,
//                       obscureText: passwordObsecured,
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                           hintText: 'Password',
//                           hintStyle: const TextStyle(fontSize: 17),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(22),
//                             borderSide: const BorderSide(
//                               width: 0,
//                               style: BorderStyle.none,
//                             ),
//                           ),
//                           filled: true,
//                           contentPadding: const EdgeInsets.all(16),
//                           fillColor: const Color.fromARGB(255, 255, 255, 255)
//                               .withOpacity(0.6),
//                           suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   passwordObsecured = !passwordObsecured;
//                                 });
//                               },
//                               icon: Icon(passwordObsecured
//                                   ? Icons.visibility
//                                   : Icons.visibility_off))),
//                     ),
//                     const SizedBox(
//                       height: 65,
//                     ),
//                     const SizedBox(
//                       height: 7,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 50),
//                       child: Row(
//                         children: [
//                           const Text(
//                             "Already have an account?",
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 94, 94, 94),
//                                 fontSize: 16),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => (const LoginScreen())));
//                             },
//                             child: const Text(
//                               "Login",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 97, 43, 139),
//                                   fontSize: 17.5,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () async {
//                         _signUp();
//                       },
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 97, 43, 139),
//                             fontSize: 17.5,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )));
//   }
// }
