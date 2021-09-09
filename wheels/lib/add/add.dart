import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wheels/models/groupModel.dart';

import '../styles.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final dbref = FirebaseDatabase.instance.reference();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic time;
  late TextEditingController _nameInputController;
  late TextEditingController _priceInputController;
  late TextEditingController _destinationOriginInputController;
  late TextEditingController _whatsAppInputController;
  var items1 = [
    'Cra 1',
    'Cra 2',
    'Cra 3',
    'Cra 4',
    'Cra 5',
    'Cra 6',
    'Cra 7',
    'Cra 8',
    'Cra 9',
    'Cra 10',
  ];
  var items2 = [
    'Cra 1',
    'Cra 2',
    'Cra 3',
    'Cra 4',
    'Cra 5',
    'Cra 6',
    'Cra 7',
    'Cra 8',
    'Cra 9',
    'Cra 10',
  ];
  var items3 = [
    'Cra 1',
    'Cra 2',
    'Cra 3',
    'Cra 4',
    'Cra 5',
    'Cra 6',
    'Cra 7',
    'Cra 8',
    'Cra 9',
    'Cra 10',
  ];
  var grupos = [
    'Cra 1',
    'Cra 2',
    'Cra 3',
    'Cra 4',
    'Cra 5',
    'Cra 6',
    'Cra 7',
    'Cra 8',
    'Cra 9',
    'Cra 10',
  ];
  String dropdownvalue = 'Cra 1';
  String dropdownvalue2 = 'Cra 1';
  String dropdownvalue3 = 'Cra 1';
  String dropdownvalue4 = 'Cra 1';

  dynamic _originUniandes = false;

  String getTimeText() {
    if (time == null) {
      return "Hora";
    } else {
      return "${time.hour}:${time.minute}";
    }
  }

  String test = "";

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );
    setState(() {
      time = newTime;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameInputController = TextEditingController();
    _priceInputController = TextEditingController();
    _destinationOriginInputController = TextEditingController();
    _whatsAppInputController = TextEditingController();
  }

  @override
  void dispose() {
    _nameInputController.dispose();
    _priceInputController.dispose();
    _destinationOriginInputController.dispose();
    _whatsAppInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publica tu ruta"),
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Información",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _nameInputController,
                    cursorColor: Color(0xffB21B31),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      labelStyle: TextStyle(color: Color(0xffB21B31)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Tu nombre',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _priceInputController,
                    cursorColor: Color(0xffB21B31),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.monetization_on, color: Color(0xffB21B31)),
                      labelText: "Tarifa",
                      labelStyle: TextStyle(color: Color(0xffB21B31)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Tu tarifa',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pickTime(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffB21B31), width: 2.3),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                getTimeText(),
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.4,
                                child: Radio(
                                  activeColor: Color(0xffB21B31),
                                  value: true,
                                  groupValue: _originUniandes,
                                  onChanged: (value) {
                                    setState(() {
                                      _originUniandes = value;
                                    });
                                  },
                                ),
                              ),
                              Text("Desde Uniandes",
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.4,
                                child: Radio(
                                  activeColor: Color(0xffB21B31),
                                  value: false,
                                  groupValue: _originUniandes,
                                  onChanged: (value) {
                                    setState(() {
                                      _originUniandes = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Hacia  Uniandes",
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _destinationOriginInputController,
                    cursorColor: Color(0xffB21B31),
                    decoration: InputDecoration(
                      labelText: "Ruta",
                      labelStyle: TextStyle(color: Color(0xffB21B31)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Tu destino / origen',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Por donde pasas ?",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton(
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items1.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          dropdownvalue = value;
                        });
                      },
                    ),
                    DropdownButton(
                      value: dropdownvalue2,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items2.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          dropdownvalue2 = value;
                        });
                      },
                    ),
                    DropdownButton(
                      value: dropdownvalue3,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items3.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          dropdownvalue3 = value;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "En que grupo quieres publicar ?",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Center(
                  child: DropdownButton(
                    value: dropdownvalue4,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: grupos.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        dropdownvalue4 = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _whatsAppInputController,
                    cursorColor: Color(0xffB21B31),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "WhatsApp",
                      labelStyle: TextStyle(color: Color(0xffB21B31)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Tu WhatsApp',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.3,
                          color: Color(0xffB21B31),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      dbref.child("Viajes").push().set({
                        "Nombre": _nameInputController.text,
                        "Precio": _priceInputController.text,
                        "Hora": "${time.hour}:${time.minute}",
                        "OrigenUniandes": _originUniandes,
                        "Ruta": _destinationOriginInputController.text,
                        "Lugar1": dropdownvalue,
                        "Lugar2": dropdownvalue2,
                        "Lugar3": dropdownvalue3,
                        "Grupo": dropdownvalue4,
                        "Numero Whatsapp": _whatsAppInputController.text,
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_right, size: 34, color: Colors.white),
                        Text(
                          "Publicar Wheels !",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(5)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffb21b31)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
