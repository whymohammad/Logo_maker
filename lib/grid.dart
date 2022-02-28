import 'package:flutter/material.dart';

class gridview extends StatelessWidget {
  const gridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,),
                itemBuilder: (context, index) {
                  return  Container(
                    child: const Image(
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/people-parading-in-annual-zombie-parade-in-downtown-montreal-cold-picture-id1280793246?b=1&k=20&m=1280793246&s=170667a&w=0&h=8ngQ7MQI4jmlE1pyLCmxI8AzImykbNJrqzXgZtM8gDU='),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
