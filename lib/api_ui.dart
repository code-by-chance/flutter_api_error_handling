import 'package:flutter/material.dart';
import 'package:flutter_api_error_handling/api_controller.dart';

class API extends StatelessWidget {
  APIController controller = APIController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text('Fetch API', style: TextStyle(color: Colors.white)),
        onPressed: () async {
          print('Btn Pressed');
          await controller.fetchData(context);
        });
  }
}
