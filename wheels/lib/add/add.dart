import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wheels/models/groupModel.dart';
import 'package:intl/intl.dart';
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
  late TextEditingController _ruta1Controller;
  late TextEditingController _ruta2Controller;
  late TextEditingController _ruta3Controller;

  var grupos = [
    '-',
  ];

  String dropdownvalue4 = '-';

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
    _ruta1Controller = TextEditingController();
    _ruta2Controller = TextEditingController();
    _ruta3Controller = TextEditingController();
    _nameInputController = TextEditingController();
    _priceInputController = TextEditingController();
    _destinationOriginInputController = TextEditingController();
    _whatsAppInputController = TextEditingController();
    dbref.once().then((DataSnapshot snapshot) {
      for (var item in snapshot.value["Grupos"].keys) {
        print(
            "${snapshot.value["Grupos"][item]["titulo"]} ${snapshot.value["Grupos"][item]["subtitulo"]}");
        setState(() {
          grupos.add(
              "${snapshot.value["Grupos"][item]["titulo"]} ${snapshot.value["Grupos"][item]["subtitulo"]}");
        });
      }
    });
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
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _ruta1Controller,
                          cursorColor: Color(0xffB21B31),
                          decoration: InputDecoration(
                            labelText: "Ruta",
                            labelStyle: TextStyle(color: Color(0xffB21B31)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Lugar 1',
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
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _ruta2Controller,
                          cursorColor: Color(0xffB21B31),
                          decoration: InputDecoration(
                            labelText: "Ruta",
                            labelStyle: TextStyle(color: Color(0xffB21B31)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Lugar 2',
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
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _ruta3Controller,
                          cursorColor: Color(0xffB21B31),
                          decoration: InputDecoration(
                            labelText: "Ruta",
                            labelStyle: TextStyle(color: Color(0xffB21B31)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Lugar 3',
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
                      DateTime tempDate = DateFormat("hh:mm").parse(
                          time!.hour.toString() +
                              ":" +
                              time!.minute.toString());
                      var dateFormat = DateFormat("h:mm a");
                      dbref.child("Viajes").push().set({
                        "Nombre": _nameInputController.text,
                        "Precio": _priceInputController.text,
                        "Hora": dateFormat.format(tempDate),
                        //"${time.hour}:${time.minute}",
                        "OrigenUniandes": _originUniandes,
                        "Ruta": _destinationOriginInputController.text,
                        "Lugar1": _ruta1Controller.text,
                        "Lugar2": _ruta2Controller.text,
                        "Lugar3": _ruta3Controller.text,
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
