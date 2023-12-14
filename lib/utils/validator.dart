class Validator {
  static String? checkEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return "Message cant be empty";
    }
    return null;
  }

  static String? checkEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cant be empty";
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Didn`t valid email";
    }

    return null;
  }

  static String? checkName(String? value) {
    if (value != null && value.isNotEmpty) {
      return value.length >= 3 ? null : "Name must be at least 3 characters";
    }
    return "Name cant be empty";
  }
}
