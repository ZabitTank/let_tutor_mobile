class AssetsManager {
  const AssetsManager();
  static const String imagePath = "assets/images";
  static const String iconPath = "assets/icons";

  // LETTUTOR
  static const String lettutorIcon = "$imagePath/lettutor_icon.png";
  static const String vnIcon = "$iconPath/vn_icon.png";
  static const String enIcon = "$iconPath/en_icon.png";

  static const String lettutorLoginBanner = "$imagePath/login_banner.png";
  // GPT
  static const String userImage = "$imagePath/person.png";
  static const String chatImage = "$imagePath/chat_logo.png";
  static const String openAILogo = "$imagePath/openai_logo.jpg";
}

const List<String> specifiers = [
  "All",
  "english-for-kids",
  "business-english",
  "conversational-english",
  "starters",
  "movers",
  "flyers",
  "ket",
  "pet",
  "ielts",
  "toefl",
  "toeic"
];

const Map<String, List<String>> tutorsNationFilter = {
  "en": <String>["Foreign Tutor", "Vietnamese Tutor", "Native English Tutor"],
  "vi": <String>["Gia sư nước ngoài", "Gia sư Việt Nam", "Gia sư bản sứ"],
};

class CommonString {
  const CommonString();
  static const String errorContactowner =
      "Something went wrong! Try to contact owner";
}
