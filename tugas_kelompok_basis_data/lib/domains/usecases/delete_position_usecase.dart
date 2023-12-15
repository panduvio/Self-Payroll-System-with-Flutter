import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class DeletePositionUsecase {
  AdminRepository repository;

  DeletePositionUsecase(this.repository);

  Future<void> removePosition(String id) {
    return repository.deletePosition(id);
  }
}
