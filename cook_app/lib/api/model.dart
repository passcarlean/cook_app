//This is a Model class For implementing the Json Data
// All values given here are to be replaced or augmented by actual values if need be


class MainData {
  String state;
  Ingredients ingredients;
  Steps steps;
  String name;
  String description;
  int id;
  String imageLink;
  String videoLink;


  MainData({
    this.state,
    this.ingredients,
    this.steps,
    this.description,
    this.id,
    this.imageLink,
    this.name,
    this.videoLink,

  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return new MainData(
      state: json['state'],
      ingredients: Ingredients.fromJson(json['ingredients']),
      steps: Steps.fromJson(json['steps']),
      description: json['description'],
      id: json['id'],
      imageLink: json['imageLink'],
      name: json['name'],
      videoLink: json['videoLink'],
    );
  }
}

class Ingredients {
  String ingre1;
  String ingre2;
  String ingre3;

  Ingredients({this.ingre1, this.ingre2, this.ingre3});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return new Ingredients(
      ingre1: json['ingredient_1'],
      ingre2: json['ingredient_2'],
      ingre3: json['ingredient_3'],
    );
  }
}

class Steps {
  String step1;
  String step2;
  String step3;

  Steps({this.step1, this.step2, this.step3});

  factory Steps.fromJson(Map<String, dynamic> json) {
    return new Steps(
      step1: json['step_1'],
      step2: json['step_2'],
      step3: json['step_3'],
    );
  }
}