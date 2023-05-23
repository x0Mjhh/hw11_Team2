import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Middelwares/User/CheckTokenMiddelware.dart';
import '../Response/displayContactById.dart';
import '../Response/displayUserResponse.dart';

class UserRoute {
  Handler get handler {
    final router = Router()
    ..get("/display_user", displayUserresponse)
    ..get("/contact_by_id/<id>", displayUsebyId);

    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
