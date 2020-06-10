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


  MainData(
    this.state,
    this.ingredients,
    this.steps,
    this.description,
    this.id,
    this.imageLink,
    this.name,
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