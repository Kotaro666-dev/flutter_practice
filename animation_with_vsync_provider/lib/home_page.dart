import 'package:animation_with_vsync_provider/home_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

const content =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet velit pharetra urna porttitor maximus. Fusce porttitor viverra nibh, sed lobortis massa porta a. Sed pharetra sem in urna elementum, et commodo felis tincidunt. Phasellus volutpat fringilla dui sit amet ullamcorper. Etiam consectetur viverra justo. Nullam nec sodales nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget suscipit tortor, et eleifend arcu.';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VsyncProvider(
      isSingleTicker: true,
      child: ChangeNotifierProvider(
        create: (_) => HomePageModel(
          vsync: VsyncProvider.of(context),
        ),
        child: _HomePage(),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomePageModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation with VsyncProvider'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
          ),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                children: [
                  Text('コンテンツ内容'),
                  Divider(
                    height: 0,
                    thickness: 1.0,
                    color: Colors.blueAccent,
                  ),
                  SizeTransition(
                    sizeFactor: model.animation,
                    axisAlignment: 1.0,
                    child: Text(content),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.0,
                    color: Colors.blueAccent,
                  ),
                  TextButton(
                    onPressed: model.onTapTextButton,
                    child: model.isOpened ? Text('とじる') : Text('ひらく'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
