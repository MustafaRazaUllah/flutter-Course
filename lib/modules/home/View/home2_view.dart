import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/custom_toast.dart';

import '../../Map/View/map_view.dart';
import 'home_view.dart';

class Home2View extends StatefulWidget {
  final String title;
  final HomeTypes type;
  const Home2View({super.key, required this.title, required this.type});

  @override
  State<Home2View> createState() => _Home2ViewState();
}

class _Home2ViewState extends State<Home2View> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.amber,
        shadowColor: Colors.grey.withOpacity(0.6),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.message,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            if (widget.type == HomeTypes.home1) ...[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.amber,
                    width: 5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Colors.pink,
                      Colors.purple,
                      Colors.red,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.5),
                  child:
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       "https://fastly.picsum.photos/id/514/200/300.jpg?hmac=2SFAKrM0w5MkU7I_tQM9mq1m6POUDSPrTYu5tb5Sqlg",
                      //   fit: BoxFit.cover,
                      //   placeholder: (context, url) =>
                      //       const CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) => const Icon(Icons.error),
                      // ),
                      Image.network(
                    "https://fastly.picsum.photos/id/514/200/300.jpg?hmac=2SFAKrM0w5MkU7I_tQM9mq1m6POUDSPrTYu5tb5Sqlg",
                    // https://fastly.picsum.photos/id/514/200/300.jpg?hmac=2SFAKrM0w5MkU7I_tQM9mq1m6POUDSPrTYu5tb5Sqlg
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ] else ...[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.amber,
                    width: 5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Colors.pink,
                      Colors.purple,
                      Colors.red,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.5),
                        child: Image.network(
                          "https://fastly.picsum.photos/id/514/200/300.jpg?hmac=2SFAKrM0w5MkU7I_tQM9mq1m6POUDSPrTYu5tb5Sqlg",
                          // https://fastly.picsum.photos/id/514/200/300.jpg?hmac=2SFAKrM0w5MkU7I_tQM9mq1m6POUDSPrTYu5tb5Sqlg
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 100, 100, 10),
                        child: Text(
                          "data",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100, 10, 10, 100),
                        child: Text(
                          "new",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  MapViewScreen(),
                    ),
                  );
                },
                child: const Text(
                  "View Map",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        child: DilogBoxTile(),
      );
    },
  );
}

class DilogBoxTile extends StatelessWidget {
  const DilogBoxTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 470,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red.withOpacity(0.1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Text('AlertDialog Title'),
                const Text('This is a demo alert dialog.'),
                const Text('Would you like to approve of this message?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text('Toast'),
                      onPressed: () {
                        CustomAppToast().onSuccess("Hyee");
                      },
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      child: const Text('Approve'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
