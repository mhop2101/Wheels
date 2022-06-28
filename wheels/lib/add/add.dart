import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheels/sharedPreferences/preferences.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _preferenceService = PreferencesService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic time; // TimeOfDay
  dynamic dateInput;
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

  var storedTripsShow = [
    "Rutas guardadas",
  ];

  var storedTrips = [];

  String dropdownvalue4 = '-';
  String dropdownvalueStoredTrips = 'Rutas guardadas';

  dynamic _originUniandes = false;

  String getTimeText() {
    if (time == null) {
      return "Hora";
    } else {
      return time.format(context);
    }
  }

  String getDayText() {
    if (dateInput == null) {
      return "Día";
    } else {
      return DateFormat.yMMMd().format(dateInput);
    }
  }

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

  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 1)),
    ).then((value) {
      if (value != null) {
        setState(() {
          dateInput = value;
        });
      }
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

    // dbref.once().then((DataSnapshot snapshot) {
    //   for (var item in snapshot.value["Grupos"].keys) {
    //     setState(() {
    //       grupos.add(
    //           "${snapshot.value["Grupos"][item]["titulo"]} ${snapshot.value["Grupos"][item]["subtitulo"]}");
    //     });
    //   }
    // });

    _preferenceService.getTripInfo().then((dynamic snapshot) {
      if (snapshot != null) {
        for (var i = 0; i < snapshot.length; i += 1) {
          var storedTripMap = json.decode(snapshot[i]);

          if (storedTripMap["OrigenUniandes"] == "true") {
            String fromUni = "Desde Uniandes";
            storedTripsShow.add(
                "Nombre: ${storedTripMap["Nombre"]} \nTarifa: ${storedTripMap["Precio"].toString()}\n$fromUni\nRuta: ${storedTripMap["destinationOrigin"]}\nLugar 1: ${storedTripMap["Lugar1"]}\nLugar 2: ${storedTripMap["Lugar2"]}\nLugar 3: ${storedTripMap["Lugar3"]}\nGrupo: ${storedTripMap["Grupo"]}\nNumero: ${storedTripMap["Numero Whatsapp"]}");
          } else {
            String fromUni = "Hacia Uniandes";
            storedTripsShow.add(
                "Nombre: ${storedTripMap["Nombre"]} \nTarifa: ${storedTripMap["Precio"].toString()}\n$fromUni\nRuta: ${storedTripMap["destinationOrigin"]}\nLugar 1: ${storedTripMap["Lugar1"]}\nLugar 2: ${storedTripMap["Lugar2"]}\nLugar 3: ${storedTripMap["Lugar3"]}\nGrupo: ${storedTripMap["Grupo"]}\nNumero: ${storedTripMap["Numero Whatsapp"]}");
          }

          storedTrips.add(storedTripMap);
        }
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
                // Rutas guardadas ?
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DropdownButton(
                      value: dropdownvalueStoredTrips,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: storedTripsShow.map((items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items,
                                style: TextStyle(fontSize: 20),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          int i = storedTripsShow.indexOf(value);
                          if (i != -1 && i != 0) {
                            dynamic tripData = storedTrips[i - 1];
                            _nameInputController.text = tripData["Nombre"];
                            _ruta1Controller.text = tripData["Lugar1"];
                            _ruta2Controller.text = tripData["Lugar2"];
                            _ruta3Controller.text = tripData["Lugar3"];
                            _priceInputController.text = tripData["Precio"];
                            _destinationOriginInputController.text =
                                tripData["destinationOrigin"];
                            _whatsAppInputController.text =
                                tripData["Numero Whatsapp"];
                            dropdownvalue4 = tripData["Grupo"];
                            if (tripData["OrigenUniandes"] == "true") {
                              _originUniandes = true;
                            } else {
                              _originUniandes = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
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
                      Column(
                        children: [
                          // Dia
                          InkWell(
                            onTap: () {
                              pickDate();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffB21B31), width: 2.3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    getDayText(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            // Hora
                            child: InkWell(
                              onTap: () {
                                pickTime(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffB21B31), width: 2.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      getTimeText(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                      String name = _nameInputController.text;
                      String price = _priceInputController.text;
                      String destinationOrigin =
                          _destinationOriginInputController.text;
                      String ruta1 = _ruta1Controller.text;
                      String ruta2 = _ruta2Controller.text;
                      String ruta3 = _ruta3Controller.text;
                      String grupo = dropdownvalue4;
                      String whatsapp = _whatsAppInputController.text;

                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text("Guardar ruta?"),
                                content: Text(
                                    "Desea guardar la información de esta ruta ?"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        _ruta1Controller.clear();
                                        _ruta2Controller.clear();
                                        _ruta3Controller.clear();
                                        _nameInputController.clear();
                                        _priceInputController.clear();
                                        _destinationOriginInputController
                                            .clear();
                                        _whatsAppInputController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text("No")),
                                  ElevatedButton(
                                      onPressed: () {
                                        _preferenceService.addTripInfo(
                                            name,
                                            price,
                                            _originUniandes,
                                            destinationOrigin,
                                            ruta1,
                                            ruta2,
                                            ruta3,
                                            grupo,
                                            whatsapp);
                                        _ruta1Controller.clear();
                                        _ruta2Controller.clear();
                                        _ruta3Controller.clear();
                                        _nameInputController.clear();
                                        _priceInputController.clear();
                                        _destinationOriginInputController
                                            .clear();
                                        _whatsAppInputController.clear();
                                        setState(() {
                                          _preferenceService
                                              .getTripInfo()
                                              .then((dynamic snapshot) {
                                            if (snapshot != null) {
                                              for (var i = 0;
                                                  i < snapshot.length;
                                                  i += 1) {
                                                var storedTripMap =
                                                    json.decode(snapshot[i]);

                                                if (storedTripMap[
                                                        "OrigenUniandes"] ==
                                                    "true") {
                                                  String fromUni =
                                                      "Desde Uniandes";
                                                  storedTripsShow.add(
                                                      "Nombre: ${storedTripMap["Nombre"]} \nTarifa: ${storedTripMap["Precio"].toString()}\n$fromUni\nRuta: ${storedTripMap["destinationOrigin"]}\nLugar 1: ${storedTripMap["Lugar1"]}\nLugar 2: ${storedTripMap["Lugar2"]}\nLugar 3: ${storedTripMap["Lugar3"]}\nGrupo: ${storedTripMap["Grupo"]}\nNumero: ${storedTripMap["Numero Whatsapp"]}");
                                                } else {
                                                  String fromUni =
                                                      "Hacia Uniandes";
                                                  storedTripsShow.add(
                                                      "Nombre: ${storedTripMap["Nombre"]} \nTarifa: ${storedTripMap["Precio"].toString()}\n$fromUni\nRuta: ${storedTripMap["destinationOrigin"]}\nLugar 1: ${storedTripMap["Lugar1"]}\nLugar 2: ${storedTripMap["Lugar2"]}\nLugar 3: ${storedTripMap["Lugar3"]}\nGrupo: ${storedTripMap["Grupo"]}\nNumero: ${storedTripMap["Numero Whatsapp"]}");
                                                }

                                                storedTrips.add(storedTripMap);
                                              }
                                            }
                                          });
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Text("Si")),
                                ],
                              ),
                          barrierDismissible: false);
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
