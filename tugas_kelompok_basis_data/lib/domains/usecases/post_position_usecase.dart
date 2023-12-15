import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class PostPositionUsecase {
  AdminRepository repository;

  PostPositionUsecase(this.repository);

  Future<void> postPosition(PositionEntity positionData) {
    return repository.postPosition(positionData);
  }
}
