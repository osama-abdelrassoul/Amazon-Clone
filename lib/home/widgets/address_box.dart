import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone/constants/global_variables.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = GlobalVariables().getScreenSize();
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: screenSize.height * 0.04,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 164, 236, 233)
        ], stops: [
          0.5,
          1.0
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 20,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Delivery to ${user.name} - ${user.address}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ),
            )),
            const Padding(
              padding: EdgeInsets.only(left: 5, top: 2),
              child: Icon(
                Icons.arrow_drop_down_outlined,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
