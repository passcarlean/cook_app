//This is a Model class For implementing the Json Data
// All values given here are to be replaced or augmented by actual values if need be


class MainData {
  String id;
  String state;
  String name;
  String description;
  String ingredients;
  String steps;
  String imageLink;
  String videoLink;


  MainData(
    this.id,
    this.state,
    this.name,
    this.description,
    this.ingredients,
    this.steps,
    this.imageLink,
    this.videoLink,

  );

}

class Ingredients {
  String ingre1;
  String ingre2;
  String ingre3;

  Ingredients(this.ingre1, this.ingre2, this.ingre3);

}

class Steps {
  String step1;
  String step2;
  String step3;

  Steps(this.step1, this.step2, this.step3);

}