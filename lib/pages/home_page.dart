import "dart:convert";

import "package:coin_info/pages/detailed_page.dart";
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
  String? _selectedCoin = "Bitcoin";

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
                _dataWidgets(),
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
        value: _selectedCoin,
        onChanged: (_value){
            setState(() {
              _selectedCoin = _value!;
            });
        },
        iconSize: 30,
        icon: Icon(Icons.arrow_drop_down_sharp),
        iconEnabledColor: Colors.black,
        underline: Container(),
        dropdownColor: Color.fromARGB(210, 230, 162, 2),
        padding: EdgeInsets.only(left: 10, right: 10),
    );
  }

  Widget _dataWidgets(){
    return FutureBuilder(future: _http!.get('/coins/${_selectedCoin?.toLowerCase()}/'), builder: (BuildContext context, AsyncSnapshot snapshot){
      if(snapshot.hasData){
        Map _data = jsonDecode(snapshot.data.toString());
        num _price = _data["market_data"]["current_price"]["usd"];
        num _percentageChange = _data["market_data"]["price_change_percentage_24h"];
        Map _exchangeRates = _data["market_data"]["current_price"];

        print(_exchangeRates);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailedPage(rates: _exchangeRates);
                      },));
                    },
                    child: _coinImage(_data['image']["large"])),
            _currentPrice(_price),
            _percentageChange24Hrs(_percentageChange),
            _coinDescription(_data["description"]["en"]),
          ],
        );
      }else{
        return CircularProgressIndicator();
      }
    });
  }

  Widget _currentPrice(num _rate){
    return Text("${_rate.toStringAsFixed(2)} USD", style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ));
  }

  Widget _percentageChange24Hrs(num _percentage){
    return Text("${_percentage.toString()}%", style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),);
  }
  Widget _coinImage(String _imageURL){
    return Container(
        width: _deviceWidth! * 0.18,
        height: _deviceHeight! * 0.1,
        margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: NetworkImage(_imageURL),
            fit: BoxFit.cover,
          ),
        ),
      );
  }

  Widget _coinDescription(String _description){
    return Container(
      width: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.6,
      margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
      padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01, horizontal: _deviceWidth! * 0.01),
      child: Text(_description, style: TextStyle(
        fontSize: 14,
        letterSpacing: 1.2,
        color: Colors.grey.shade900,
        fontWeight: FontWeight.w300
      )),
    );
  }
}