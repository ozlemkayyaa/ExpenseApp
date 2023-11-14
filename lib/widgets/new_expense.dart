import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // TextEditingController sınıfı, metin alanlarını kontrol etmek için kullanılır.
  final _expenseNameController =
      TextEditingController(); // Harcama adını tutan bir TextEditingController değişkenidir.
  final _expensePriceController =
      TextEditingController(); // Harcama miktarını tutan bir TextEditingController değişkenidir.
  var _selectedDate =
      DateTime.now(); // Seçilen tarihi tutan bir DateTime değişkenidir.

  // Tarih seçiciyi açan ve seçilen tarihi _selectedDate değişkenine atayan bir fonksiyondur.

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        // showDatePicker() fonksiyonu, tarih seçiciyi açmak için kullanılır.
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now());

    // initialDate parametresi, tarih seçicinin başlangıç tarihini ayarlamak için kullanılır.
    // firstDate ve lastDate parametreleri, tarih seçicinin minimum ve maksimum tarihlerini ayarlamak için kullanılır.

    if (picked != null && picked != _selectedDate) {
      // picked != null && picked != _selectedDate koşulu,
      // seçilen tarihin null olup olmadığını ve seçilen tarihin _selectedDate değişkenindeki tarihle aynı olup olmadığını kontrol eder.
      setState(() {
        _selectedDate =
            picked; //  _selectedDate değişkenini picked değişkenine atar.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          // TextField: Kullanıcının harcama adı ve miktarını girmesine izin veren bir widget'tır.
          TextField(
            controller: _expenseNameController,
            maxLength:
                50, // metin alanına girilebilecek maksimum karakter sayısını belirlemek için kullanılır.
            decoration: const InputDecoration(labelText: "Harcama Adı"),
          ),
          TextField(
            controller: _expensePriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Harcama Miktarı"),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
          Text(DateFormat.yMMMMEEEEd().format(_selectedDate)),
          ElevatedButton(
            onPressed: () {
              print(
                  "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceController.text}");
            },
            child: const Text("Ekle"),
          ),
        ]),
      ),
    );
  }
}
