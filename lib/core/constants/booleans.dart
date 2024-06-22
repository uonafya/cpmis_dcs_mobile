String boolToStr(bool item) {
  if (item == true) {
    return "AYES";
  } else {
    return "ANO";
  }
}

bool strToBool(String item) {
  if (item == "AYES") {
    return true;
  } else {
    return false;
  }
}
