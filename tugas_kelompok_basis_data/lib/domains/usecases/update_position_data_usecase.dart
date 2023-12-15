import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class UpdatePositionUsecase {
  AdminRepository repository;

  UpdatePositionUsecase(this.repository);

  Future<void> updatePosition(PositionEntity positionData) {
    return repository.updatePositionData(positionData);
  }
}
