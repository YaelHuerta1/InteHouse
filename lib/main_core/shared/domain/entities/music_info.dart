class MusicInfo {

  MusicInfo ({required this.isOn, required this.currentS});
  final bool isOn;
  final Song currentS;

}

class Song {

  const Song(this.artist, this.thumbURL, this.title);

  final String title;
  final String artist;
  final String thumbURL;

  static const Song defaultSong = Song(
      'MANESKIN',
      'https://i.ibb.co/bQ65QkD/manesking.jpg',
      'I wanna be your slave'
  );
}