//import material.dart;
import 'package:flutter/material.dart';

// create a class that extends the stateless widget
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  // create a state with name : name
  String name = "";

  @override
  void initState() {
    super.initState();
  }

  // create a method that will be called when the button is pressed
  onTap() {
    // print hello
    print('Hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/image.jpeg'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(height: 10),
              const RowText(label: 'Phone', value: '+977-9876543210'),
              const SizedBox(height: 10),
              const RowText(
                label: 'Address',
                value: 'Pokhara',
              ),
              const Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Text('Hello! My name is Prasiddha Neupane'),
                    Text('Hello! My name is Prasiddha Neupane'),
                    Text('Hello! My name is Prasiddha Neupane'),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (name == '') {
                      name = "Prasiddha Neupane";
                    } else {
                      name = "";
                    }
                    setState(() {});
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) => const Page2()));
                  },
                  child: const Text('Go to page 2'))
            ],
          ),
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String label;
  final String value;

  const RowText({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$label: '),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
