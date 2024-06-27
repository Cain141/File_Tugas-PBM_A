//TODO: Step 6 - import story.dart
import 'story.dart';

//TOTO: Step 5 - membuat class StoryBrain
class StoryBrain {
  //TODO: Step 7 - membuat storyData sebagai private properties
  final List<Story> _storyData = [
    Story(
        storyTitle:
            'Saat berjalan di hutan, Anda menemukan sebuah rumah tua yang tampak ditinggalkan. Pintu depan terbuka sedikit, dan Anda mendengar suara aneh dari dalam. Apa yang akan Anda lakukan?',
        choice1: 'Masuk ke dalam rumah untuk menyelidiki.',
        choice2: 'Lari menjauh dan mencari bantuan.'),
    Story(
        storyTitle:
            'Anda masuk ke dalam rumah dan menemukan ruang tamu yang berantakan dengan perabotan tua.',
        choice1: 'Cari sumber suara aneh itu.',
        choice2: 'Keluar dari rumah secepatnya.'),
    Story(
        storyTitle:
            'Anda menemukan sebuah ruangan rahasia di balik lemari. Di dalamnya, Anda melihat sebuah buku sihir kuno dan berbagai ramuan misterius. Seorang wanita tua tiba-tiba muncul dan bertanya: "Mencari sesuatu?".',
        choice1: 'Tanya wanita tua itu tentang buku sihir.',
        choice2: 'Kabur dari ruangan sebelum terjadi sesuatu.'),
    Story(
        storyTitle:
            'Wanita tua itu tersenyum licik dan mulai membaca mantra dari buku sihir. Anda merasa tubuh Anda mulai berubah.',
        choice1: 'Minta dia untuk menghentikan mantranya.',
        choice2: 'Ambil buku sihir dan coba hentikan dia.'),
    Story(
        storyTitle:
            'Tubuh Anda kembali normal, dan wanita tua itu tertawa terbahak-bahak. "Kau memang berani," katanya. "Sekarang kau harus menghadapi ujian terakhir."',
        choice1: 'Siap untuk menghadapi ujian terakhir.',
        choice2: 'Tanya dia tentang ujian terakhir itu.'),
    Story(
        storyTitle:
            'Ujian terakhir adalah menjawab teka-teki yang sangat sulit. Jika Anda berhasil, Anda akan bebas. Jika gagal, Anda akan terjebak di rumah ini selamanya.',
        choice1: 'Coba jawab teka-tekinya.',
        choice2: 'Cari cara lain untuk melarikan diri.'),
  ];

  //TODO: Step 8 - membuat method getStory() yang return first storyTitle dari _storyData.
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  //TODO: Step 11 membuat method getChoice1 yang returnnya adalah choice1 dari _storyData
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  //TODO: Step 12 membuat method getChoice1 yang returnnya adalah choice2 dari _storyData
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  //TODO: Step 16 - Membuat property storyNumber yang dimulai dari nol (0).
  // Digunakan untuk tracking story yang sedang dilihat

  //TODO: Step 25 - ganti storyNumber property ke private property sehingga hanya
  // story_brain.dart yang bisa mengakses
  int _storyNumber = 0;

  void restart() {
    _storyNumber = 0;
  }

  //TODO: Step 17 - membuat method nextStory()
  void nextStory(int choiceNumber) {
    //TODO: Step 21 - menggunakan story plan, update nextStory ganti storyNumber
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    }

    //TODO: Step 22 - di nextStory() jika storyNumber 3 atau 4 atau 5,
    // artinya game berakhir dan panggil method restart()
    else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  //TODO: Step 27 - membuat method buttonShouldBeVisible() untuk mengecek apakah storyNumber is 0 or 1 or 2
  bool buttonShouldBeVisible() {
    //You could also just check if (_storyNumber < 3)
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
