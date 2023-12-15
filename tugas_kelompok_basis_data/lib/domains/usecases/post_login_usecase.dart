import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class PostLoginUsecase {
  AdminRepository repository;

  PostLoginUsecase(this.repository);

  Future<void> postLogin({required String email, required String password}) {
    return repository.postLogin(email, password);
  }
}
