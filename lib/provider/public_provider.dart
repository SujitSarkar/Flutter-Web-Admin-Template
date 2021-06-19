import 'package:flutter/material.dart';
import 'package:web_admin_panel_template/pages/dashboard_page.dart';


class PublicProvider extends ChangeNotifier{
  String _category='';
  String _subCategory='';

  String  get category=>_category;
  String get subCategory=> _subCategory;

  set subCategory(String value){
    _subCategory=value;
    notifyListeners();
  }
  set category(String value){
    _category=value;
    notifyListeners();
  }

  double pageWidth(Size size){
    if(size.width<1300) return size.width;
    else return size.width*.8;
  }

  String pageHeader(){
    if(_category.isNotEmpty && _subCategory.isNotEmpty) return '$_category \u276D $_subCategory';
    else return 'Dashboard';
  }

  Widget pageBody(){
    return DashBoardPage();
  }

  // Future<bool> validateAdmin(BuildContext context, String phone, String password)async{
  //   try{
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Admin')
  //         .where('phone', isEqualTo: phone).get();
  //     final List<QueryDocumentSnapshot> user = snapshot.docs;
  //     if(user.isNotEmpty && user[0].get('password')==password){
  //       return true;
  //     }else{
  //       return false;
  //     }
  //   }catch(error){
  //     showToast(error.toString());
  //     return false;
  //   }
  // }
}