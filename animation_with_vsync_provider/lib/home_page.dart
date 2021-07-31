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
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text('コンテンツ詳細'),
                        SizedBox(height: 10),
                        Divider(
                          height: 0,
                          color: Colors.blueAccent,
                        ),
                        SizeTransition(
                          sizeFactor: model.animation,
                          axisAlignment: 1.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Text(content),
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: Colors.blueAccent,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: model.onTapTextButton,
                            child: model.isOpened ? Text('とじる') : Text('ひらく'),
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (state) {
                                return Colors.transparent;
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
