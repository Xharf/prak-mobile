import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:pertemuan7/loginpage.dart';
import 'package:pertemuan7/model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  Box<UserModel> localDB = Hive.box<UserModel>("user_model");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Stack(
        children: [
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width / 3,
            top: MediaQuery.of(context).size.height * 4 / 5,
            child: Container(
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.centerRight)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.perm_identity,
                              color: Color(0xFFFF4891),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                            labelText: "Nama",
                            hintText: "Nama Lengkap",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                        controller: _namaController,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Color(0xFFFF4891),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                            labelText: "Email",
                            hintText: "example@mail.com",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                        controller: _emailController,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Color(0xFFFF4891),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                            labelText: "Password",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                        controller: _passwordController,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key_outlined,
                              color: Color(0xFFFF4891),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                            labelText: "Password Confirmation",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                        controller: _confirmPasswordController,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 45,
                        child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_passwordController.text ==
                                    _confirmPasswordController.text
                                    && (_passwordController.text!=''
                                        ||_confirmPasswordController.text!='')) {

                                  localDB.add(UserModel(
                                      fullname: _namaController.text, email: _emailController.text, password: _passwordController.text));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                }
                              },
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                              ),
                            ),
                            // child: InkWell(
                            //   borderRadius: BorderRadius.circular(25),
                            //   splashColor: Colors.amber,
                            //   onTap: () {},
                            //   child: const Center(
                            //     child: Text(
                            //       "SIGN UP",
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.w700),
                            //     ),
                            //   ),
                            // ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFB226B2),
                                    Color(0xFFFF4891)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        elevation: 0,
                        backgroundColor: Color(0xFFBB001B),
                        icon: Icon(
                          Icons.mark_email_read,
                          color: Color(0xFFFFFFFF),
                        ),
                        label: Text("Gmail"),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sudah punya akun ? ",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFFF4891),
                              fontWeight: FontWeight.w800),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//
// class RegisterPage extends StatelessWidget {
//   const RegisterPage({Key? key}) : super(key: key);
//
//   double getSmallDiameter(BuildContext context) =>
//       MediaQuery.of(context).size.width * 2 / 3;
//   double getBiglDiameter(BuildContext context) =>
//       MediaQuery.of(context).size.width * 7 / 8;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEEEEEE)  ,
//       body: Stack(
//         children: [
//           Positioned(
//             right: -getSmallDiameter(context)/3,
//             top: -getSmallDiameter(context)/3,
//             child: Container(
//               width: getSmallDiameter(context),
//               height: getSmallDiameter(context),
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                       colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter)),
//             ),
//           ),
//           Positioned(
//             left: -MediaQuery.of(context).size.width / 3,
//             top: MediaQuery.of(context).size.height * 4/5,
//             child: Container(
//               width: getBiglDiameter(context),
//               height: getBiglDiameter(context),
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                       colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.centerRight)),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ListView(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       //border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10)),
//                   margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                             icon: const Icon(
//                               Icons.perm_identity,
//                               color: Color(0xFFFF4891),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.grey.shade100 )),
//                             labelText: "Nama",
//                             hintText: "Nama Lengkap",
//                             enabledBorder: InputBorder.none,
//                             labelStyle: const TextStyle(color: Colors.grey)),
//                       ),
//                       TextField(
//                         decoration: InputDecoration(
//                             icon: const Icon(
//                               Icons.email,
//                               color: Color(0xFFFF4891),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.grey.shade100 )),
//                             labelText: "Email",
//                             hintText: "example@mail.com",
//                             enabledBorder: InputBorder.none,
//                             labelStyle: const TextStyle(color: Colors.grey)),
//                       ),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             icon: const Icon(
//                               Icons.vpn_key,
//                               color: Color(0xFFFF4891),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.grey.shade100)),
//                             labelText: "Password",
//                             enabledBorder: InputBorder.none,
//                             labelStyle: const TextStyle(color: Colors.grey)),
//                       ),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             icon: const Icon(
//                               Icons.vpn_key_outlined,
//                               color: Color(0xFFFF4891),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide:
//                                 BorderSide(color: Colors.grey.shade100)),
//                             labelText: "Password Confirmation",
//                             enabledBorder: InputBorder.none,
//                             labelStyle: const TextStyle(color: Colors.grey)),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.5,
//                         height: 45,
//                         child: Container(
//                           child: Material(
//                             borderRadius: BorderRadius.circular(25),
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(25),
//                               splashColor: Colors.amber,
//                               onTap: () {},
//                               child: const Center(
//                                 child: Text(
//                                   "SIGN UP",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ),
//
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xFFB226B2),
//                                     Color(0xFFFF4891)
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter)),
//                         ),
//                       ),
//                       FloatingActionButton.extended(
//                         onPressed: () {},
//                         elevation: 0,
//                         backgroundColor: Color(0xFFBB001B),
//                         icon: Icon(
//                           Icons.mark_email_read,
//                           color: Color(0xFFFFFFFF),
//                         ),
//                         label: Text("Gmail"),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "Sudah punya akun ? ",
//                       style: TextStyle(
//                           fontSize: 11,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     TextButton(
//                         onPressed: () {
//
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(builder: (context) => LoginPage())
//                           );
//                         },
//                         child: const Text(
//                       "Login",
//                       style: TextStyle(
//                           fontSize: 11,
//                           color: Color(0xFFFF4891),
//                           fontWeight: FontWeight.w800),
//                     )
//                     )
//
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
