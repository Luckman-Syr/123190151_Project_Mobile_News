class NegaraModel {
  String? id;
  String? name;
  String? image;

  NegaraModel({
    this.id,
    this.name,
    this.image,
  });
}

List<NegaraModel> getAllCountry() {
  return [
    NegaraModel(
        id: "id",
        name: "Indonesia",
        image: "https://pbs.twimg.com/media/DiJ51UIU8AAfD2i.jpg"),
    NegaraModel(
        id: "au",
        name: "Australia",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/284px-Flag_of_Australia.svg.png"),
    NegaraModel(
        id: "us",
        name: "United State",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/300px-Flag_of_the_United_States.svg.png"),
    NegaraModel(
        id: "kr",
        name: "South Korea",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/225px-Flag_of_South_Korea.svg.png"),
    NegaraModel(
        id: "tr",
        name: "Turkey",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/220px-Flag_of_Turkey.svg.png"),
  ];
}
