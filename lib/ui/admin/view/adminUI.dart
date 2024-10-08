import 'package:flutter/material.dart';
import 'package:todo_apps/ui/add_task_bar.dart';

import '../../../services/csv_services.dart';
import '../../../services/excel_services.dart';
import '../../../services/pdf_services.dart';

class AdminUI extends StatefulWidget {
  const AdminUI({super.key});

  @override
  State<AdminUI> createState() => _AdminUIState();
}

class _AdminUIState extends State<AdminUI> {
  static const List<String> _options = <String>[
    "Sivakami",
    "Keerthi",
    "Madhu",
    "Madhavi",
    "Ravi",
    "Manoj",
    "Karthick",
    "Barani",
    "Dinesh kannan",
    "Selvam",
    "Vimal"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 6,
                    child: Text(
                      "Employee & Task List",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddTaskPage()),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_task),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Asign")
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              RawAutocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _options.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                        hintText: "Search Employee and thier task here",
                        suffixIcon: Icon(Icons.search_sharp),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                  );
                },
                optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options,
                ) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
                              },
                              child: ListTile(
                                title: Text(option),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        backgroundColor: Colors.blueGrey,
                        collapsedBackgroundColor: Colors.blueGrey,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        collapsedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        title: const Text(
                          "Employee Name",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Login Screen UI/ UX",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Scheduled Date",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "09/08/2024 - 15/08/2024",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Status",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "IN - progrees",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FilledButton(
                                                  onPressed: () {},
                                                  child:
                                                      const Text("Delete Task"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FilledButton(
                                                  onPressed: () {},
                                                  child:
                                                      const Text("Update Task"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Happy Working"),
      elevation: 0,
      actions: [
        PopupMenuButton<String>(
          offset: const Offset(0, 25),
          // color: Get.isDarkMode ? darkGreyColor : Colors.white,
          icon: const Icon(Icons.download),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          tooltip: "More",
          onSelected: (value) async {
            if (value == "Export to CSV") {
              // Export the taskList to CSV
              await exportTasksToCSV([]);
            } else if (value == "Export to Excel") {
              // Export the taskList to Excel
              await exportTasksToExcel([]);
            } else if (value == "Save as PDF") {
              // Export the taskList to PDF
              await exportTasksToPDF([]);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Export to CSV",
                child: Text("Export to CSV"),
              ),
              const PopupMenuItem(
                value: "Export to Excel",
                child: Text("Export to Excel"),
              ),
              const PopupMenuItem(
                value: "Save as PDF",
                child: Text("Save as PDF"),
              ),
            ];
          },
        ),
      ],
    );
  }
}
