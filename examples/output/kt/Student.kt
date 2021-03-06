// This is a generated file
//
// If you would like to make any changes, please edit the source file instead.
// run `plz genFile -- "{SOURCE_FILE}" -c:wings.json` upon completion.
// Source: examples/input/student.wings

package kt

// Any person who is studying in a class
class Student {
  var ID: Int = -1
  var name: String = ""
  var curClass: String = ""
  var feeling: Emotion = Emotion.Meh
  var isActive: Boolean = false
  var year: Date = Date()
  var graduation: Date = Date()
  var homeworks: ArrayList<Homework> = arrayListOf<Homework>()
  var something: HashMap<String, String> = hashMapOf<String, String>()

  fun toJsonKey(key: string): string {
    when (key) {
      "ID" -> return "id"
      "name" -> return "name"
      "curClass" -> return "cur_class"
      "feeling" -> return "feeling"
      "isActive" -> return "is_active"
      "year" -> return "year"
      "graduation" -> return "graduation"
      "homeworks" -> return "homeworks"
      "something" -> return "something"
      else -> return key
    }
  }
}