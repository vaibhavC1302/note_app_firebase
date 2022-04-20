import 'package:flutter/material.dart';
import 'package:note_app_firebase/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.png'),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(
                "Create and Manage your Notes",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Continue with Google",
                      style: TextStyle(fontFamily: 'Lato', fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage(
                        'assets/images/google.png',
                      ),
                      height: 32,
                    )
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[700]),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12))),
              ),
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
