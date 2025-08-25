import "package:coin_info/services/http_services.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _HomePageState();
}
}

class _HomePageState extends State<HomePage>{
  double? _deviceWidth, _deviceHeight;
  HTTPServices? _http;

  @override
  void initState() {
    super.initState();
    _http = GetIt.instance.get<HTTPServices>();
  }
  @override
  Widget build(BuildContext context){
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _selectedCoinDropdown(),
              ],
            ),
          ),
      ),
    );
  }

  Widget _selectedCoinDropdown(){
    List<String> _coins = ["Bitcoin", "Ethereum", "Dogecoin"];
    List<DropdownMenuItem> _item = _coins.map((el) => DropdownMenuItem(
      child: Text(el, style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold),
      ),
      value: el,),
    ).toList();

    return DropdownButton(
        items: _item,
        value: _coins.first,
        onChanged: (_value){},
        iconSize: 30,
        icon: Icon(Icons.arrow_drop_down_sharp),
        iconEnabledColor: Colors.black,
        underline: Container(),
        dropdownColor: Color.fromARGB(210, 230, 162, 2),
        padding: EdgeInsets.only(left: 10, right: 10),
    );
  }
}