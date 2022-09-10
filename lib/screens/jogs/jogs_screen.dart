import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:starter_flutter/db/jogs_database.dart';
import '../../models/jog_model.dart';
import '../shared_elements/jog_card_widget.dart';
import 'edit_jog_page.dart';
import 'jog_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JogsScreen extends StatefulWidget {
  @override
  State<JogsScreen> createState() => _JogsScreenState();
}

class _JogsScreenState extends State<JogsScreen> {
  late List<Jog> jogs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshJogs();
  }

  Future refreshJogs() async {
    setState(() => isLoading = true);

    this.jogs = await JogsDatabaseHelper.instanceJogHelper.readAllJogs();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'Notes about Jogs',
      //     style: TextStyle(fontSize: 24),
      //   ),
      // ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Notes about Jogs",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : jogs.isEmpty
                    ? const Text(
                        'No Jogs',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      )
                    : buildJogs(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditJogPage()),
          );

          refreshJogs();
        },
      ),
    );
  }

  Widget buildJogs() => StaggeredGridView.countBuilder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemCount: jogs.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final jog = jogs[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => JogDetailPage(jogId: jog.id!),
              ));
              refreshJogs();
            },
            child: JogCardWidget(jog: jog, index: index),
          );
        },
      );
}
