/*
 * This is a generated file
 * 
 * If you would like to make any changes, please edit the source file instead.
 * run `nimble genFile "{SOURCE_FILE}"` upon completion.
 * 
 * Source: examples/student.struct
 */

package kt

import java.util.ArrayList

// Any person who is studying in a class
class Student {
    var ID: Int = -1
    var name: String = ""
    var curClass: String = ""
    var isActive: Boolean = true
    var year: Date = Date()
    var homeworks: ArrayList<Homework> = ArrayList<Homework>()

    fun toJsonKey(key: string): string {
        when (key) {
            "ID" -> return "id"
            "name" -> return "name"
            "curClass" -> return "cur_class"
            "isActive" -> return "is_active"
            "year" -> return "year"
            "homeworks" -> return "homeworks"
            else -> return key
        }
    }
}
