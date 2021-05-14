abstract class InfoError{
  static String title;
  static String content;
  static String responseText;
  static bool _empty = true;

  static clear(){
    _empty = true;
  }

  static add({String title, String content, String responseText}){
    InfoError.title = title;
    InfoError.content = content;
    InfoError.responseText = responseText;
    InfoError._empty = false;
  }

  static isEmpty(){
    return _empty;
  }
}