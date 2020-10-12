import '../models/user.dart';
import '../models/video.dart';

class ServerCommunications {
  static final String _recentVideos =
      "[{\"thumbnail\":\"cont1.png\",\"title\":\"Surah Mulk-Part3\",\"subtitle\":\"\",\"url\":\"\"},{\"thumbnail\":\"cont2.png\",\"title\":\"Tafsir Surah Baqarah 1.3\",\"subtitle\":\"\",\"url\":\"\"},{\"thumbnail\":\"cont3.png\",\"title\":\"Surah Yasin Part1\",\"subtitle\":\"\",\"url\":\"\"},{\"thumbnail\":\"cont4.png\",\"title\":\"Al Ihkam Part 1 Episode 1\",\"subtitle\":\"\",\"url\":\"\"},{\"thumbnail\":\"cont5.png\",\"title\":\"Qisas Al Nabiyeen Vol 1.2\",\"subtitle\":\"\",\"url\":\"\"},{\"thumbnail\":\"cont6.png\",\"title\":\"Arabiyyah Lil Nashieen Vol 1.7b\",\"subtitle\":\"\",\"url\":\"\"}]";
  static final String _qnaVideos =
      "[{\"thumbnail\":\"qna1.png\",\"title\":\"Live Questions and Answers\",\"subtitle\":\"1 season\",\"url\":\"\"}]";
  static final String _quranVideos =
      "[{\"thumbnail\":\"quran1.png\",\"title\":\"Tafsir of Surah Yasin\",\"subtitle\":\"1 season\",\"url\":\"\"},{\"thumbnail\":\"quran2.png\",\"title\":\"Exploring the Pearls of The Qur'an\",\"subtitle\":\"1 season\",\"url\":\"\"},{\"thumbnail\":\"quran3.png\",\"title\":\"Surah Aal Imran\",\"subtitle\":\"15 seasons\",\"url\":\"\"},{\"thumbnail\":\"quran4.png\",\"title\":\"Tafsir of Juz Amma\",\"subtitle\":\"13 seasons\",\"url\":\"\"},{\"thumbnail\":\"quran5.png\",\"title\":\"Tafsir of Surah Kahf\",\"subtitle\":\"4 seasons\",\"url\":\"\"}]";
  static final String _homeBannerVideos =
      "[{\"thumbnail\":\"pillars.jpg\",\"title\":\"Pillars of Islam\",\"subtitle\":\"5 seasons\",\"url\":\"\"},{\"thumbnail\":\"lives.jpg\",\"title\":\"Lives of Khulafa Al Rashidoon\",\"subtitle\":\"4 seasons\",\"url\":\"\"},{\"thumbnail\":\"stress.jpg\",\"title\":\"Stress and Anger Management\",\"subtitle\":\"1 season\",\"url\":\"\"},{\"thumbnail\":\"quran.jpg\",\"title\":\"Exploring the Pearls of The Qur'an\",\"subtitle\":\"1 season\",\"url\":\"\"},{\"thumbnail\":\"females.jpg\",\"title\":\"History of Female Scholars\",\"subtitle\":\"7 seasons\",\"url\":\"\"}]";

  static Future<List<DeepDeenVideo>> getRecentVideos() async {
    return Future.delayed(Duration(milliseconds: 100)).then((onValue) => myVideoFromJson(_recentVideos));
  }

  static Future<List<DeepDeenVideo>> getQnaVideos() {
    return Future.delayed(Duration(milliseconds: 100)).then((onValue) => myVideoFromJson(_qnaVideos));
  }

  static Future<List<DeepDeenVideo>> getQuranVideos() {
    return Future.delayed(Duration(milliseconds: 100)).then((onValue) => myVideoFromJson(_quranVideos));
  }

  static Future<List<DeepDeenVideo>> getHomeBannerVideos() async {
    return Future.delayed(Duration(milliseconds: 100)).then((onValue) => myVideoFromJson(_homeBannerVideos));
  }

  static Future<DeepDeenUser> login(String email, String password) async {
    return Future.delayed(Duration(milliseconds: 5000))
        .then((onValue) => DeepDeenUser(email: email, password: password));
  }
}
