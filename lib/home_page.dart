import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'lang_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title').tr(),
        actions: [LangSelector()],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "${'title'.tr()}:",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    'app_local_demo'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "${'details'.tr()}:",
                  style: const TextStyle(fontSize: 15),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text('demo_details'.tr(),
                      style: const TextStyle(fontSize: 15)),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
