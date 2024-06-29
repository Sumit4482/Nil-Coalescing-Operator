//
//  Person.swift
//  Nil Coalescing Operator
//
//  Created by E5000855 on 29/06/24.
//

import Foundation

class Person {
    var name: String?
    var age: Int?
    var id: Int?

    init(name: String?, age: Int?, id: Int?) {
        self.name = name
        self.age = age
        self.id = id
    }
}
