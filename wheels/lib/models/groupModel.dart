class GroupPost {
  static List<GroupPost> getAllGroups() => [
        GroupPost(
          title: "Usaquen",
          subtitle: "Septima",
          memberQuantity: 165,
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
          userSubscribed: false,
        ),
        GroupPost(
          title: "Unicentro",
          subtitle: "Septima",
          memberQuantity: 165,
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
          userSubscribed: true,
        ),
        GroupPost(
          title: "Cedritos",
          subtitle: "134",
          memberQuantity: 165,
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
          userSubscribed: false,
        ),
        GroupPost(
          title: "Rosales",
          subtitle: "Novena",
          memberQuantity: 165,
          image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
          userSubscribed: true,
        ),
      ];
  String title;
  String subtitle;
  int memberQuantity;
  String image;
  bool userSubscribed;
  GroupPost({
    required this.title,
    required this.subtitle,
    required this.memberQuantity,
    required this.image,
    required this.userSubscribed,
  });
}
