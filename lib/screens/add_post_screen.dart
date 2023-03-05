import "dart:typed_data";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:instagram_clone/models/user.dart";
import "package:instagram_clone/providers/user_provider.dart";
import "package:instagram_clone/utils/colors.dart";
import "package:instagram_clone/utils/utils.dart";
import "package:provider/provider.dart";

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _image;

  _selectImage(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title: const Text("Create a post"),
        children: [
          SimpleDialogOption(
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List image = await pickImage(ImageSource.camera);
              setState(() {
                _image = image;
              });
            },
            padding: const EdgeInsets.all(20),
            child: const Text("Take a photo"),
          ),
          SimpleDialogOption(
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List image = await pickImage(ImageSource.gallery);
              setState(() {
                _image = image;
              });
            },
            padding: const EdgeInsets.all(20),
            child: const Text("Choose from gallery"),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return _image == null ? Center(
      child: IconButton(
        onPressed: () => _selectImage(context),
        icon: const Icon(Icons.upload)
      ),
    ) : Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBgColor,
        leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Post to"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Post",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            )
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Write a caption...",
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(_image!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      )
                    ),
                  ),
                )
              ),
              const Divider()
            ],
          )
        ],
      ),
    );
  }
}
