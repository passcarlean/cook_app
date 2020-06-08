//This is a Model class For implementing the Json Data
// All values given here are to be replaced or augmented by actual values if need be


class MainData {
  String state;
  SubInfo subInfo;
  String name;
  String description;
  int id;
  String imageLink;
  String videoLink;


  MainData({
    this.state,
    this.subInfo,
    this.description,
    this.id,
    this.imageLink,
    this.name,
    this.videoLink,

  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return new MainData(
      state: json['country'],
      subInfo: SubInfo.fromJson(json['subInfo']),
      description: json['description'],
      id: json['id'],
      imageLink: json['imageLink'],
      name: json['name'],
      videoLink: json['videoLink'],
    );
  }
}

class SubInfo {
  String step1;
  String step2;
  String step3;

  SubInfo({this.step1, this.step2, this.step3});

  factory SubInfo.fromJson(Map<String, dynamic> json) {
    return new SubInfo(
      step1: json['step_1'],
      step2: json['step_2'],
      step3: json['step_3'],
    );
  }
}