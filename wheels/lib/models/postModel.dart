class TripPost {
  static List<TripPost> getAllTrips() => [
        TripPost(
          name: "Alejandro",
          price: 3000,
          time: "7:00 AM",
          fromUniandes: false,
          destination: "7ma # 125",
          origin: "Uniandes",
          place1: "Cra 7",
          place2: "Circunvalar",
          place3: "127",
          whatsapp: 3212344321,
          color: 0xffB21B31,
          groupSubtitle: "Septima",
          groupTitle: "Usaquen",
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
        ),
        TripPost(
          name: "Gina",
          price: 2000,
          time: "9:00 AM",
          fromUniandes: false,
          destination: "Uniandes",
          origin: "7ma # 125",
          place1: "Cra 9",
          place2: "Circunvalar",
          place3: " ",
          whatsapp: 3212344321,
          color: 0xffE59503,
          groupSubtitle: "Unicentro",
          groupTitle: "Septima",
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
        ),
        TripPost(
          name: "Miguel",
          price: 2500,
          time: "8:30 AM",
          fromUniandes: true,
          destination: "7ma # 125",
          origin: "Uniandes",
          place1: "Cra 7",
          place2: "Circunvalar",
          place3: "127",
          whatsapp: 3212344321,
          color: 0xffD561D5,
          groupSubtitle: "Cedritos",
          groupTitle: "134",
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
        ),
        TripPost(
          name: "Juan",
          price: 3000,
          time: "7:00 AM",
          fromUniandes: true,
          destination: "7ma # 125",
          origin: "7ma # 125",
          place1: "Cra 7",
          place2: "Circunvalar",
          place3: "127",
          whatsapp: 3212344321,
          color: 0xff4B0082,
          groupSubtitle: "Rosales",
          groupTitle: "Novena",
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
        )
      ];
  String name;
  int price;
  String time;
  bool fromUniandes;
  String destination;
  String origin;
  String place1;
  String place2;
  String place3;
  int whatsapp;
  int color;
  String groupTitle;
  String groupSubtitle;
  String image;

  TripPost({
    required this.name,
    required this.price,
    required this.time,
    required this.fromUniandes,
    required this.destination,
    required this.origin,
    required this.place1,
    required this.place2,
    required this.place3,
    required this.whatsapp,
    required this.color,
    required this.groupTitle,
    required this.groupSubtitle,
    required this.image,
  });
}
