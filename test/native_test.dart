
import 'package:flutter_test/flutter_test.dart';
import 'package:mockitopractice/main.dart';
import 'package:http/http.dart' as http;
void main(){

  test('Flutter native test', () async {
    http.Client client = new http.Client();
    expect(await fetchAlbum(client), isA<Album>());
  });
}