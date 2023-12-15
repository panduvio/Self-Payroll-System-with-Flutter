import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class GetAllPositionUsecase {
  AdminRepository repository;

  GetAllPositionUsecase(this.repository);

  Future<List<PositionEntity>> getAllPosition() {
    return repository.getAllPosition();
  }
}
