class MusicDataResponse {
  String? status, message;
  List<MusicDataModel>? data;

  MusicDataResponse({required this.status, this.data, required this.message});

  MusicDataResponse.fromJson(
      Map<String, dynamic> json, String statusCode, String message) {
    if (json['results'] != null) {
      status = statusCode;
      message = message;
      data = <MusicDataModel>[];
      json['results'].forEach((v) {
        data!.add(MusicDataModel.fromJson(v));
      });
    } else {
      status = statusCode;
      message = message;
      data = <MusicDataModel>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    status = status;
    message = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicDataModel {
  late int trackId;
  late String trackTitle, artistName, albumName, albumImage, trackPreview;

  MusicDataModel({
    required this.trackId,
    required this.trackTitle,
    required this.artistName,
    required this.albumName,
    required this.albumImage,
    required this.trackPreview,
  });

  MusicDataModel.fromJson(Map<String, dynamic> json) {
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
