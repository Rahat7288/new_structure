import 'package:flutter/material.dart';
import 'package:new_structure/core/theme_data/theme_cubit.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                width: double.maxFinite,
                  child: FilledButton(onPressed: (){}, child: Text('Continue'),
                  ),

              ),

              const SizedBox(
                height: 20,
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'Enter your email',
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Center(
                child: Text(
                  'hello new Dev',
                  style: context.textTheme.headlineLarge,
                ),
              ),

              // FloatingActionButton(
              //   onPressed:
              // (){}, child: Icon(Icons.add),
              // )

              SizedBox(
                width: double.maxFinite,
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                         child: Center(
                             child: Text('Tab 1'),
                         ),
                     ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text('Tab Tab 1'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text('Tab Tab Tab1'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

          // Switch(
          //   // This bool value toggles the switch.
          //   value: light,
          //   // activeColor: Colors.red,
          //   onChanged: (bool value) {
          //     // This is called when the user toggles the switch.
          //     setState(() {
          //       light = value;
          //     });
          //   },
          // ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
