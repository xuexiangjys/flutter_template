/*
 * @Author: Nathaniel
 * @Date: 2021-03-25 16:30:28
 */
class Project {
  List<Object> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  Project.fromJson(Map<String, dynamic> json)
      : children = json['children'],
        courseId = json['courseId'],
        id = json['id'],
        name = json['name'],
        order = json['order'],
        parentChapterId = json['parentChapterId'],
        userControlSetTop = json['userControlSetTop'],
        visible = json['visible'];

  Map<String, dynamic> toJson() => {
        'children': this.children,
        'courseId': this.courseId,
        'id': this.id,
        'name': this.name,
        'order': this.order,
        'parentChapterId': this.parentChapterId,
        'userControlSetTop': this.userControlSetTop,
        'visible': this.visible,
      };
}
