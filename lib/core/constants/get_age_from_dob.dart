int getAgeFromDateOf(DateTime dob) {
  var age = DateTime.now().compareTo(dob);
  return age;
}