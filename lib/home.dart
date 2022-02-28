import 'package:firebaseconnect/my_widgets.dart';
import 'package:flutter/material.dart';

import 'grid.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: const Text('Get Lost'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'hola',
                  icon: Icon(Icons.account_balance,color: Colors.amberAccent,),
                ),
                Tab(
                  text: 'hola',
                  icon: Icon(Icons.email,color: Colors.grey,),

                ),
                Tab(
                  text: 'hola',
                  icon: Icon(Icons.login,color: Colors.cyanAccent,),

                ),
                Tab(
                  text: 'hola',
                  icon: Icon(Icons.password,size: 45,),

                )
              ],
            ),
          ),
          body: Column(
            children: [
              ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (ctx)=>gridview()));
              }, child: Text('View Gridview')),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                leading: Text(
                  "new list",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                trailing: Icon(Icons.delete),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: 40,
                    //shrinkWrap: true,
                    itemExtent: 110,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return mycircle();
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemExtent: 500,
                    itemBuilder: (context, index) {
                      return const myvertical();
                    }),
              )
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            items: [
               BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  title: new Text("Home")
              ),
               BottomNavigationBarItem(
                  icon: const Icon(Icons.work),
                  title: new Text("Self Help")
              ),
               BottomNavigationBarItem(
                  icon: const Icon(Icons.face),
                  title: new Text("Profile")
              ),

            ],
            selectedItemColor: Colors.black,
            currentIndex: 1,
          ),
        ),
      ),
    );
  }
}
