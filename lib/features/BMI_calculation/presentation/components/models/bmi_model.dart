// final data = {
//   "status": "ok",
//   "error": null,
//   "data": {
//     "height": "170 cm",
//     "weight": "70 kg",
//     "bmi": 24.221453287197235,
//     "risk": "Low risk",
//     "summary": "This weight is normal and you are healthy.",
//     "recommendation":
//         "A BMI between 18.5 and 24.9 falls within the 'normal' weight range according to the World Health Organization. This range is associated with the lowest health risk for conditions such as heart disease, diabetes, and certain cancers. However, it's important to note that BMI is not a perfect measure as it does not account for muscle mass, bone density, overall body composition, and racial and sex differences. Therefore, while it's a useful starting point, it should not be the only measure of one's health.",
//   },
// };

class BmiModel {
  final String height;
  final String weight;
  final String bmi;
  final String risk;
  final String summary;
  final String recommendation;

  BmiModel({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });

  /// perform deserialization (convert the json data into text data in the app)
  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(
      height: json['height'].toString(),
      weight: json['weight'].toString(),
      bmi: json['bmi'].toString(),
      risk: json['risk'].toString(),
      summary: json['summary'].toString(),
      recommendation: json['recommendation'].toString(),
    );
  }
}
