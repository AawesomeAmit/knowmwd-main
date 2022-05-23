
import 'package:custom_searchable_dropdown/Custom_Searchable_Dropdown.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';




class MyCustomSD extends StatefulWidget {

  final InputDecoration? decoration;
  final ValueChanged onChanged;
  final List listToSearch;
  final String? label;
  final String valFrom;
  final IconData? prefixIcon;
  final List? initialValue;
  final bool? hideSearch;
  final double? height;
  final Color? borderColor;

  const MyCustomSD({Key? key,

    this.decoration,
    this.label,
    this.prefixIcon,
    required this.listToSearch,
    this.initialValue,
    this.hideSearch,
    this.height,
    this.borderColor,
    required this.valFrom,
    required this.onChanged,}) : super(key: key);

  @override
  _MyCustomSDState createState() => _MyCustomSDState();
}

class _MyCustomSDState extends State<MyCustomSD> {

  bool obscure=false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return CustomSearchableDropDown(
      searchBarHeight: 40,
      padding: const EdgeInsets.all(0),
      initialValue: widget.initialValue,
      primaryColor: AppColor.greyDark,
      hideSearch: widget.hideSearch?? false,
      menuHeight: widget.height??80,
      menuMode: true,
      labelStyle: MyTextTheme().mediumBCN,
      items: widget.listToSearch,
      label: widget.label??'Select Name',
      dropdownItemStyle: MyTextTheme().mediumBCN,


      dropDownMenuItems: widget.listToSearch.map((item) {
        return item[widget.valFrom];
      }).toList(),
      onChanged: (val){
        widget.onChanged(val);
      },
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: widget.borderColor??AppColor.greyLight)
      ),

    );
  }
}


