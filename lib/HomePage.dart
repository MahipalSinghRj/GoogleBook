import 'package:flutter/material.dart';

import 'JobTitleModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var jobTitleEditingController = TextEditingController();
  var jobDescriptionEditingController = TextEditingController();
  String thisValue = "";
  List<JobPost> listData = [];
  int? editIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: jobTitleEditingController,
            ),
            TextField(
              controller: jobDescriptionEditingController,
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (itemContext, index) {
                    return ListTile(
                      title: Text(
                        listData[index].title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        listData[index].description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  listData.removeAt(index);
                                });
                              },
                              child: const Icon(Icons.delete)),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  editIndex = index;
                                  jobTitleEditingController.text = listData[index].title;
                                  jobDescriptionEditingController.text = listData[index].description;
                                });
                              },
                              child: const Icon(Icons.edit)),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/AboutPage");
                  setState(() {
                    if (jobTitleEditingController.text.isEmpty && jobDescriptionEditingController.text.isEmpty) {
                    } else {
                      if (editIndex == null) {
                        listData.add(JobPost(jobTitleEditingController.text, jobDescriptionEditingController.text));
                        jobTitleEditingController.clear();
                        jobDescriptionEditingController.clear();
                      } else {
                        var jobEditPost = listData[editIndex!];
                        jobEditPost.title = jobTitleEditingController.text;
                        jobEditPost.description = jobDescriptionEditingController.text;
                        setState(() {
                          editIndex = null;
                          jobTitleEditingController.clear();
                          jobDescriptionEditingController.clear();
                        });
                      }
                    }
                  });
                },
                child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
