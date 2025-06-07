import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        itemCount: 10,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return const Card(
            elevation: 1,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondary,
                radius: 20,
                child: Icon(Icons.person,color: Colors.white,size: 22),
              ),
              title: Text("User Name"),
              subtitle: Text("Some heading "),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20),
            ),
          );
        },
      ),
    );
  }
}