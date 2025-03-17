import 'package:flutter/material.dart';
import 'package:new_structure/core/theme_data/theme_cubit.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              )
          
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
