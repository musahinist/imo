class AssetConstant {
  // use this code block if want create an singleton instance.
  // static AssetConstant? _instance;
  // static AssetConstant get instance {
  //   _instance ??= AssetConstant._();
  //   return _instance!;
  // }

  AssetConstant._();

  static final appIcon = 'app_icon'.iconToPng;
  static final markerUser = 'ic_marker_user'.imageToPng;
  static final sampleSvg = 'sampleSvg'.toSVG;
  static final logo = 'logo'.toSVG;
  static final deleteIcon = 'del'.toSVG;
  static final illustration = 'illustration'.toSVG;
  static final chemistryLab = 'chemistry_lab'.toSVG;
}

extension _AssetConstantExtension on String {
  String get imageToPng => 'assets/icon/$this.png';
  String get iconToPng => 'assets/icon/$this.png';
  String get toSVG => 'assets/svg/$this.svg';
}
