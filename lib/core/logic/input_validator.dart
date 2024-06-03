class InputValidator{
  static final  _phoneNumberRegex=RegExp(r"01[0-2]\d{1,8}");
  static final _passwordRegex=RegExp(r"(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[0-9]){2,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}");
// لو ميش عايز اسبيشيال كاراكتر شيل النجمة وحط +
  static String? phone(String? value){
   if (value!.trim().isEmpty) {
      return "Phone Must be Not Empty";
   } else if (!_phoneNumberRegex.hasMatch(value)) {
      return "Invalid Phone Number";
   }
    return null;
  }

  static String? password(String? value){
    if (value!.trim().isEmpty) {
      return "password Must be Not Empty";
    } else if (!_passwordRegex.hasMatch(value)) {
      return "Weak password";
    }
    return null;
  }

 static String? normalInput(String title,
     String? value,{int length=3}){
    if (value!.trim().isEmpty) {
      return "$title Must be Not Empty";
    } else if (value.length < length) {
      return "$title must be at least $length Characters";
    }
    return null;
  }
}