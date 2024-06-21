import 'package:flutter/foundation.dart';

class ESRController with ChangeNotifier {
  List<Map<String, dynamic>> familyMembers = [];
  List<Map<String, dynamic>> familyMembersDetails = [];

  void addFamilyMember(Map<String, dynamic> member) {
    familyMembers.add(member);
    notifyListeners();
  }

  void removeFamilyMember(Map<String, dynamic> member) {
    familyMembers.remove(member);
    notifyListeners();
  }

  void addFamilyMemberDetails(Map<String, dynamic> member) {
    familyMembersDetails.add(member);
    notifyListeners();
  }

  void removeFamilyMemberDetails(Map<String, dynamic> member) {
    familyMembersDetails.remove(member);
    notifyListeners();
  }

  void submitForm() {
    print(familyMembers);
    print(familyMembersDetails);
  }
}
