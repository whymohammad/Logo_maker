import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class pagination_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PaginateFirestore(
          //item builder type is compulsory.
          itemBuilder: (index, context, documentSnapshot) {
            final data = documentSnapshot.data() as Map?;
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: data == null ? const Text('Error in data') : Text(data['name']),
              subtitle: Text(documentSnapshot.id),
            );
          },
          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance.collection('users').orderBy('name'),
          //Change types accordingly
          itemBuilderType: PaginateBuilderType.listView,
          // to fetch real-time data
          isLive: false,
          itemsPerPage: 10,
        ),
      ),
    );
  }
}
class myvertical extends StatelessWidget {
  const myvertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://media.istockphoto.com/photos/people-parading-in-annual-zombie-parade-in-downtown-montreal-cold-picture-id1280793246?b=1&k=20&m=1280793246&s=170667a&w=0&h=8ngQ7MQI4jmlE1pyLCmxI8AzImykbNJrqzXgZtM8gDU="),
        ),
      ),
      child: const ListTile(
        title: Text("joker"),
        subtitle: Text("oky then "),
      )
    );
  }
}
class mycircle extends StatelessWidget {
  const mycircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          Container(
            height: 150,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage("https://pixabay.com/photos/african-arabian-aroma-aromatic-4652424/"),
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: const ListTile(
              title: Text('joker'),
              subtitle: Text("its a joker"),
            ),
          )
        ],
      ),
    );

  }
}

