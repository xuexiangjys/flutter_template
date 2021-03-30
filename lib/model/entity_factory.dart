/*
 * @Author: Nathaniel
 * @Date: 2021-03-25 17:20:44
 */
class EntityFactory {
  static T generateObject<T>(json) {
    if (json == null) {
      return null;
    } else {
      return json as T;
    }
  }
}
