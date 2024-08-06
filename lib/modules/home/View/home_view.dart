import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/DB/cache_handler.dart';
import 'package:flutter_application/modules/auth/view/login_view.dart';
import 'package:flutter_application/modules/home/View/home2_view.dart';
import 'package:flutter_application/utils/custom_toast.dart';
import 'package:flutter_application/utils/loader.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../Viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int counter = 0;
  bool isChecked = false;

  MCQs mcqs = MCQs.other;

  final homeVM = HomeViewmodel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  void getProfile() async {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      bool isResult = await homeVM.getProfileMethod(context);
      if (isResult) {
        setState(() {});
      }
    });
  }

  final List<String> entries = <String>['A', 'B', 'C', 'D'];
  final List<String> entries1 = <String>[
    'Ali',
    'Mustafa',
    'Numan',
    'Khizar',
    'haider',
    'Saiyan',
    'Abbas'
  ];
  final List<int> colorCodes = <int>[600, 500, 100, 300];

// Scaffold State Key
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
        title: const Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () async {
              try {
                showLoadingIndicator(context: context);
                await CacheHandler().logout();
                hideOpenDialog(context: context);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                  (route) => false,
                );
              } catch (e) {
                hideOpenDialog(context: context);
                print("object $e");
              }
            },
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home2View(
                    title: 'This is test',
                    type: HomeTypes.home2,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        // reverse: true,
        children: [
          const SizedBox(height: 20),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: entries1
                .map(
                  (item) => Chip(
                    label: Text(item),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Text("My Email is ${homeVM.userData.user.email}"),
          const SizedBox(height: 20),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeLeft: true,
            removeRight: true,
            removeBottom: true,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.zero,
                  color: Colors.purple[colorCodes[index]],
                  child: Center(child: Text("Entry ${entries[index]}")),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[300],
                child: const Text('Sound of screams but the'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[400],
                child: const Text('Who scream'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[500],
                child: const Text('Revolution is coming...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: const Text('Revolution, they...'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Entry ${entries[index]}'),
                  subtitle: Text('Count $index'),
                  tileColor: Colors.amber[colorCodes[index]],
                );
                // Container(
                //   height: 50,
                //   color: Colors.amber[colorCodes[index]],
                //   child: Center(child: Text('Entry ${entries[index]}')),
                // );
              }),
          const SizedBox(height: 20),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Click"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("On Pressed");
                },
                onLongPress: () {
                  print("On Long Press");
                },
                child: const Text("Click"),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Click"),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.red,
                    activeColor: Colors.green,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text("hello World."),
                ],
              ),
              const SizedBox(height: 20),
              Switch(
                value: isChecked,
                onChanged: (bool? val) {
                  print("object $val");
                  setState(() {
                    isChecked = val!;
                  });
                },
              ),
              const SizedBox(height: 20),
              CupertinoSwitch(
                value: isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    isChecked = val!;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text("What's your name ?"),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Mustafa'),
                          leading: Radio<MCQs>(
                            value: MCQs.mustafa,
                            groupValue: mcqs,
                            onChanged: (MCQs? value) {
                              setState(() {
                                mcqs = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Ali'),
                          leading: Radio<MCQs>(
                            value: MCQs.ali,
                            groupValue: mcqs,
                            onChanged: (MCQs? value) {
                              setState(() {
                                mcqs = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Mahnoor'),
                          leading: Radio<MCQs>(
                            value: MCQs.mahnoor,
                            groupValue: mcqs,
                            onChanged: (MCQs? value) {
                              setState(() {
                                mcqs = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Other'),
                          leading: Radio<MCQs>(
                            value: MCQs.other,
                            groupValue: mcqs,
                            onChanged: (MCQs? value) {
                              setState(() {
                                mcqs = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return DatePickerDialog(
                        restorationId: 'date_picker_dialog',
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                    },
                  );
                },
                child: const Text("Date Picker"),
              ),
              TextButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return TimePickerDialog(
                        restorationId: 'date_picker_dialog',
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      );
                    },
                  );
                },
                child: const Text("Time Picker"),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/sunset-silhouettes-trees-mountains-generative-ai_169016-29371.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: GlassmorphicContainer(
                      width: 350,
                      height: 350,
                      borderRadius: 5,
                      blur: 5,
                      alignment: Alignment.bottomCenter,
                      border: 2,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: const Center(
                        child: Text("Hello"),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
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
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              _showMyDialog(context);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("Dilog Box")),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (counter > 0) {
                      counter--;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Text("-")),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    counter.toString(),
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Text("+")),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: Container(
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  _key.currentState!.closeDrawer();
                },
                icon: const Icon(Icons.close),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.red.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/backgrounds/mypic.png"),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Mustafa Raza")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.menu),
        onPressed: () => _key.currentState!.openDrawer(), // <-- Opens drawer
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

enum HomeTypes {
  home1,
  home2,
  homeOther,
}

enum MCQs {
  mustafa,
  ali,
  mahnoor,
  other,
}
