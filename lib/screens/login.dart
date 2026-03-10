import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

String letter1 = "Р";
String letter2 = "Д";

bool hidePassword = true;

TextEditingController numberController = TextEditingController();
TextEditingController passwordController = TextEditingController();

List<String> letters = [
"А","Б","В","Г","Д","Е","Ё","Ж","З","И","Й","К","Л","М","Н","О","Ө",
"П","Р","С","Т","У","Ү","Ф","Х","Ц","Ч","Ш","Щ","Ъ","Ь","Ы","Э","Ю","Я"
];

void login(){

String register = letter1 + letter2 + numberController.text;
String password = passwordController.text;

if(register.isNotEmpty && password.isNotEmpty){

  UserModel user = UserModel(
    register: register,
    password: password,
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HomeScreen(user: user),
    ),
  );
}

}

@override
Widget build(BuildContext context) {

return Scaffold(
  backgroundColor: const Color(0xffEEF3FA),

  body: SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height:20),

            /// LOGO + LANGUAGE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Image.asset(
                  "assets/logo.png",
                  height:40,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal:12,
                    vertical:8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Text("🇲🇳"),
                      SizedBox(width:6),
                      Text("МУ-ын"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )

              ],
            ),

            const SizedBox(height:25),

            /// LOGIN METHODS
            Row(
              children: [

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Нэг удаагийн код",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width:10),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text("Банкны эрх"),
                    ),
                  ),
                )

              ],
            ),

            const SizedBox(height:10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Тоон гарын үсэг"),
              ),
            ),

            const SizedBox(height:20),

            /// SWITCH
            Row(
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal:14,
                    vertical:8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Регистрийн дугаар"),
                ),

                const SizedBox(width:10),

                const Text(
                  "Иргэний бүртгэлийн дугаар",
                  style: TextStyle(color: Colors.grey),
                )

              ],
            ),

            const SizedBox(height:20),

            /// REGISTER
            Row(
              children: [

                Container(
                  width:60,
                  padding: const EdgeInsets.symmetric(horizontal:6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton(
                    value: letter1,
                    underline: const SizedBox(),
                    items: letters.map((e)=>
                      DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      )
                    ).toList(),
                    onChanged: (v){
                      setState(() {
                        letter1 = v!;
                      });
                    },
                  ),
                ),

                const SizedBox(width:10),

                Container(
                  width:60,
                  padding: const EdgeInsets.symmetric(horizontal:6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton(
                    value: letter2,
                    underline: const SizedBox(),
                    items: letters.map((e)=>
                      DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      )
                    ).toList(),
                    onChanged: (v){
                      setState(() {
                        letter2 = v!;
                      });
                    },
                  ),
                ),

                const SizedBox(width:10),

                Expanded(
                  child: TextField(
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: "Регистрын дугаар",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                )

              ],
            ),

            const SizedBox(height:20),

            /// PASSWORD TITLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Нууц үг"),
                Text(
                  "Нууц үгээ мартсан уу?",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),

            const SizedBox(height:8),

            /// PASSWORD FIELD
            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                hintText: "Нууц үг",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off
                  ),
                  onPressed: (){
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height:25),

            /// LOGIN BUTTON
            SizedBox(
              width: double.infinity,
              height:55,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E63F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                onPressed: login,

                child: const Text(
                  "Нэвтрэх",
                  style: TextStyle(fontSize:18),
                ),

              ),
            ),

            const SizedBox(height:12),

            /// REGISTER BUTTON
            SizedBox(
              width: double.infinity,
              height:55,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                onPressed: (){},

                child: const Text(
                  "Бүртгүүлэх",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize:18,
                  ),
                ),

              ),
            ),

            const SizedBox(height:20),

            const Center(
              child: Text(
                "Бүртгэлтэй утасны дугаараа солих",
                style: TextStyle(color: Colors.blue),
              ),
            ),

            const SizedBox(height:40),

          ],
        ),
      ),
    ),
  ),
);
}
}
