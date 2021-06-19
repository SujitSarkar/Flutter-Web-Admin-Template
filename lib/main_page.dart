import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_admin_panel_template/provider/public_provider.dart';
import 'package:web_admin_panel_template/widgets/variables.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 60,
          width: size.width,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(
              horizontal: size.height * .02, vertical: size.height * .01),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              size.width < 1300
                  ? IconButton(
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ))
                  : InkWell(
                      onTap: () {
                        publicProvider.subCategory = 'Dashboard';
                        publicProvider.category = '';
                      },
                      child: Row(
                        children: [
                          Image.asset('assets/white_logo.png'),
                          SizedBox(width: size.height * .01),
                          Text('Dhaka Fiber Link LTD',
                              style: TextStyle(
                                  fontSize: size.height * .02,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
              Text(publicProvider.pageHeader(),
                  style: TextStyle(
                      fontSize: size.height * .03,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              Ink(
                child: InkWell(
                  onTap: () async {

                  },
                  child: Row(
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: size.height * .02, color: Colors.white),
                      ),
                      SizedBox(width: size.height * .01),
                      Icon(
                        Icons.logout,
                        size: size.height * .025,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      body: _bodyUI(size, publicProvider),
    );
  }

  Widget _bodyUI(Size size, PublicProvider publicProvider) => Container(
        height: size.height,
        width: size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [SideBar(), publicProvider.pageBody()],
        ),
      );
}

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: size.width < 1300 ? 0.0 : size.width * .2,
      height: size.height,
      color: Colors.blueGrey,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: InkWell(
              onTap: () {
                publicProvider.subCategory = 'Dashboard';
                publicProvider.category = '';
              },
              child: Text('Dashboard',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.height * .022,
                      color: Colors.grey[100])),
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Variables.sideBarMenuList().length,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => EntryItemTile(
                Variables.sideBarMenuList()[index],
                size,
                publicProvider,
                context),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Drawer(
          elevation: 0.0,
          child: Container(
            width: size.width < 1300 ? 0.0 : size.width * .2,
            color: Colors.blueGrey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      publicProvider.subCategory = 'Dashboard';
                      publicProvider.category = '';
                      Navigator.pop(context);
                    },
                    child: Text('Dashboard',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * .022,
                            color: Colors.grey[100])),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: Variables.sideBarMenuList().length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => EntryItemTile(
                        Variables.sideBarMenuList()[index],
                        size,
                        publicProvider,
                        context),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

///Create the widget for the row...
// ignore: must_be_immutable
class EntryItemTile extends StatelessWidget {
  final Entry entry;
  final Size size;
  PublicProvider publicProvider;
  BuildContext context;
  EntryItemTile(this.entry, this.size, this.publicProvider, this.context);
  String? _category;
  String? _subCategory;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        onTap: () {
          _subCategory = root.title;
          publicProvider.category = _category!;
          publicProvider.subCategory = _subCategory!;
          if (size.width < 1300) Navigator.pop(context);
        },
        contentPadding: EdgeInsets.only(left: 40),
        dense: true,
        title: Text(root.title,
            style: TextStyle(color: Colors.white, fontSize: size.height * .02)),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: size.height * .022,
              color: Colors.grey[100])),
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey[100],
      ),
      onExpansionChanged: (val) {
        _category = root.title;
      },
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
