import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/todo.dart';

class ToDoModel extends BaseModel {
  Api _api = locator<Api>();
  List<ToDo> todos = List<ToDo>();
  String errorMessage;

  Future getToDo() async {
    setBusy(true);
    Result result = await _api.todo();
    if (result.resultType == ResultType.Success) todos = await result.data;
    setBusy(false);
    return result;
  }
}
