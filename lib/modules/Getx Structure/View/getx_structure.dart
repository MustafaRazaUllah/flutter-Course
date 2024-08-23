import 'package:flutter/material.dart';
import 'package:flutter_application/modules/Getx%20Structure/View%20Model/getx_structure_vm.dart';
import 'package:get/get.dart';

class StructureView extends StatelessWidget {
  StructureView({super.key});

  final StrutureViewModel viewmodel = Get.put(StrutureViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Structure"),
      ),
      body: SizedBox.expand(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter First Value",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  print("object ${int.tryParse(val) ?? 0}");
                  viewmodel.firstValues.value = double.tryParse(val) ?? 0;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter Second Value",
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  print("object ${int.tryParse(val) ?? 0}");
                  viewmodel.secondValues.value = double.tryParse(val) ?? 0;
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  signButton(
                    "+",
                    callback: () {
                      viewmodel.calculeteValues("+");
                    },
                  ),
                  signButton(
                    "-",
                    callback: () {
                      viewmodel.calculeteValues(
                        "-",
                      );
                    },
                  ),
                  signButton(
                    "*",
                    callback: () {
                      viewmodel.calculeteValues(
                        "*",
                      );
                    },
                  ),
                  signButton(
                    "/",    
                    callback: () {
                      viewmodel.calculeteValues(
                        "/",
                      );
                    },
                  ),
                ],
              ),
              // const SizedBox(height: 30),
              // ElevatedButton(
              //   onPressed: () {
              //     viewmodel.calculeteValues();
              //   },
              //   child: const Text(
              //     "Sum Values",
              //   ),
              // ),

              // if (viewmodel.sumValues.value > 0) ...[
              const SizedBox(height: 100),
              TextFormField(
                decoration: InputDecoration(
                  // labelText: "Reult",
                  hintText: viewmodel.sumValues.value.toString(),
                  border: const OutlineInputBorder(),
                ),
              ),
              // ],
            ],
          ),
        ),
      )),
    );
  }

  Widget signButton(
    String sign, {
    required Function callback,
  }) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(color: Colors.amber),
        child: Center(
          child: Text(
            sign,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
