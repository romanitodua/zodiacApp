class CompatibilityFormatter {
  String? value;

  CompatibilityFormatter({this.value});

  CompatibilityFormatter.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }
}