import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_charts/models/retail_sales.dart';

class RetailSalesPage extends StatefulWidget {
  const RetailSalesPage({super.key});

  @override
  State<RetailSalesPage> createState() => _RetailSalesPageState();
}

class _RetailSalesPageState extends State<RetailSalesPage> {
  List<RetailSales> _retailSalesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: _retailSalesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Year : ${data![index].year}"),
                  subtitle: Text("Sum Qty : ${data[index].sumQty}"),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Text("No Data"));
          }
        },
      ),
    );
  }

  Future<List<RetailSales>?> getData() async {
    final response =
        await rootBundle.loadString("assets/data/retail_sales_data.json");
    final data = json.decode(response) as List;
    _retailSalesList = data.map((e) => RetailSales.fromJson(e)).toList();
    return _retailSalesList;
  }
}
