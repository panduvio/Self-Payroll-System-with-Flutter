import 'package:dio/dio.dart';

class EmployeeApi {
  String baseUrl = 'http://192.168.43.155:8000/api/employee/withdraw/';
  Dio dio = Dio();

  Future<bool> getSalary(int id, String pin) async {
    try {
      Map<String, dynamic> privatePin = {'private_pin': pin};
      // ignore: unused_local_variable
      final response = await dio.post('$baseUrl$id', data: privatePin);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('Sukses');
        return true;
      } else {
        print('Sukses');
        return false;
      }
    } catch (e) {
      print('Gagal');
      return false;
    }
  }
}
