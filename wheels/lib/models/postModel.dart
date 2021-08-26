class TripPost {
  String name;
  int price;
  String time;
  bool fromUniandes;
  String destinationOrigin;
  String place1;
  String place2;
  String place3;
  int whatsapp;
  String color;
  String groupTitle;
  String groupSubtitle;

  TripPost({
    required this.name,
    required this.price,
    required this.time,
    required this.fromUniandes,
    required this.destinationOrigin,
    required this.place1,
    required this.place2,
    required this.place3,
    required this.whatsapp,
    required this.color,
    required this.groupTitle,
    required this.groupSubtitle,
  });

  static List<TripPost> getAllTrips() => [
        TripPost(
          name: "Alejandro",
          price: 3000,
          time: "7:00 AM",
          fromUniandes: false,
          destinationOrigin: "7ma # 125",
          place1: "Cra 7",
          place2: "Circunvalar",
          place3: "127",
          whatsapp: 3212344321,
          color: "B21B31",
          groupSubtitle: "Septima",
          groupTitle: "Usaquen",
        ),
        TripPost(
          name: "Gina",
          price: 2000,
          time: "9:00 AM",
          fromUniandes: false,
          destinationOrigin: "7ma # 127",
          place1: "Cra 9",
          place2: "Circunvalar",
          place3: " ",
          whatsapp: 3212344321,
          color: "E59503",
          groupSubtitle: "Cedritos",
          groupTitle: "134",
        ),
        TripPost(
          name: "Alejandro",
          price: 3000,
          time: "7:00 AM",
          fromUniandes: true,
          destinationOrigin: "7ma # 125",
          place1: "Cra 7",
          place2: "Circunvalar",
          place3: "127",
          whatsapp: 3212344321,
          color: "B21B31",
          groupSubtitle: "Septima",
          groupTitle: "Usaquen",
        ),
        TripPost(
          name: "Alejandro",
          price: 3000,
          time: "7:00 AM",
          fromUniandes: true,
          destinationOrigin: "7ma # 125",
          place1: "Cra 7",
          place2: "Circunvalar",
          place3: "127",
          whatsapp: 3212344321,
          color: "B21B31",
          groupSubtitle: "Septima",
          groupTitle: "Usaquen",
        )
      ];
}
