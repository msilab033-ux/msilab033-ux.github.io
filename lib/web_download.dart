import 'dart:html' as html;

void downloadPng(List<int> bytes, String fileName) {
  final blob = html.Blob([bytes], 'image/png');
  final url = html.Url.createObjectUrl(blob);
  html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();
  html.Url.revokeObjectUrl(url);
}

void downloadBytes(List<int> bytes, String fileName, String mime) {
  final blob = html.Blob([bytes], mime);
  final url = html.Url.createObjectUrl(blob);
  html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();
  html.Url.revokeObjectUrl(url);
}
