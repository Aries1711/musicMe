// ignore_for_file: prefer_collection_literals

class MusicData {
  late int trackId;
  late String trackTitle, artistName, albumName, albumImage, trackPreview;

  MusicData({
    required this.trackId,
    required this.trackTitle,
    required this.artistName,
    required this.albumName,
    required this.albumImage,
    required this.trackPreview,
  });

  MusicData.fromJson(Map<String, dynamic> json) {
    trackId = json['trackId'];
    trackTitle = json['trackName'];
    artistName = json['artistName'];
    albumName = json['collectionName'];
    albumImage = json['artworkUrl100'];
    trackPreview = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['trackId'] = trackId;
    data['trackTitle'] = trackTitle;
    data['artistName'] = artistName;
    data['albumName'] = albumName;
    data['albumImage'] = albumImage;
    data['trackPreview'] = trackPreview;
    return data;
  }
}
