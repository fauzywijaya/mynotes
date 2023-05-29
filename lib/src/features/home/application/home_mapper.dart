import 'package:notes/src/features/data.dart';
import 'package:notes/src/features/domain.dart';
import 'package:notes/src/services/services.dart';

class HomeMapper {
  static Result<HomeList> mapToRestaurantList(
      Result<HomeListResponse> response) {
    return response.when(
      success: (data) {
        return Result.success(HomeList(
          total: data.total,
          data: data.homesData
              ?.map(
                (item) => Home(
                  id: item.id,
                  email: item.email,
                  firstName: item.firstName,
                  lastName: item.lastName,
                  avatar: item.avatar,
                ),
              )
              .toList(),
        ));
      },
      failure: (error, stacktrace) {
        return Result.failure(error, stacktrace);
      },
    );
  }
}
