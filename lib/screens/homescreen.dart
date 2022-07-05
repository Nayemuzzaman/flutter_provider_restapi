import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider_restapi/helpers/apihelpers.dart';
import 'package:flutter_provider_restapi/models/postmodel.dart';
import 'package:flutter_provider_restapi/provider/homeScreenProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  getPostModel() async {
    var provider = Provider.of<HomeScreenProvider>(context, listen: false);
    var response = await APIHelper.getPostModel();

    if (response.isSuccessful) {
      provider.setPostModelList( response.data!);
    } else {
      _showSnackbar(response.message, Colors.red);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    super.initState();
    getPostModel();

  }

  _showSnackbar(String message, Color bgColor) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Loading..."),
        backgroundColor: Colors.red,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest APi Provider'),
      ),
      body: Consumer<HomeScreenProvider>(
        builder: (_, provider, __) => provider.isProcessing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            :ListView.builder(
                itemBuilder: (context, index) {
                  PostModel postModel = provider.getPostByIndex(index);
                  return ListTile(
                    title: Text(postModel.title),
                    subtitle: Text(
                      postModel.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
                itemCount: provider.postList.length,
              ),
      ),
    );
  }
}
