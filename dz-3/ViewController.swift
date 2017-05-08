//
//  ViewController.swift
//  dz-3
//
//  Created by Serhii Zharyi on 07.05.17.
//  Copyright © 2017 Serhii Zharyi. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // task 1.
        print(numberOfCharactersInString(string: "Serhii"))
        
        // task 2.
        checkSuffixYch(checkYch: "Serhiiovych")
        
        // task 3.
        getApartNameAndSurname(nameSurname: "SerhiiZharyi")
        
        // task 4.
        print(reverseString(sourceString: "Indiana Jones"))
        
        // task 5.
        print(addComaForNumber(number: 1234567890))
        
        // task 6.
        checkPassword(password: "abcABC678\u{24}")
        
        // task 8.
        print(convertStrToTranslite(sourceString: "ЯЗЗЬ"))
        
        // task 9.
        daItemsInArray(stringArray: ["lada", "sedan", "baklazhan", "dada", "net", "50/50 da"])
    }
    
    /*
     1 создать строку с своим именем
     вывести количество символов содержащихся в ней
     2 создать строку с своим отчеством
     проверить его на окончание “ич/на”
     (в классе написан метод который позволяет проверить на суффикс или префикс, найдите и используйте его)
     
     3 создать строку где слитно написано Ваши ИмяФамилия “IvanVasilevich"
     разбить на две отдельных строки из предыдущей создать третью где они обе будут разделены пробелом
     str1 = “Ivan”
     str2 = “Vasilevich”
     str3 = “Ivan Vasilevich"
     
     4 вывести строку зеркально Ось -> ьсО
     не используя reverse (посимвольно)
     
     5 добавить запятые в строку как их расставляет калькулятор
     1234567 -> 1,234,567
     12345 -> 12,345
     (не использовать встроенный метод для применения формата)
     
     6 проверить пароль на надежность от 1 до 5
     a) если пароль содержит числа +1
     b) символы верхнего регистра +1
     c) символы нижнего регистра +1
     d) спец символы +1
     e) если содержит все вышесказанное
     пример:
     123456 - 1 a)
     qwertyui - 1 c)
     12345qwerty - 2 a) c)
     32556reWDr - 3 a) b) c)
     
     Прочесть главу "Collection Types"
     7 сортировка массива не встроенным методом по возрастанию + удалить дубликаты
     
     8 написать метод который будет переводить строку в транслит - пример
     print(convertStrToTranslite(:”ЯЗЗЬ”)) -> “YAZZ”
     print(convertStrToTranslite:”морДа”) -> “morDa”
     
     9 сделать выборку из массива строк в которых содержится указанная строка
     [“lada”, “sedan”, “baklazhan”] search “da”
     -> [“lada”, “sedan”] - sort() && sort using NSPredicate
     */
    
    // task 1.
    func numberOfCharactersInString(string: String) -> Int {
        return string.characters.count
    }
    
    // task 2.
    func checkSuffixYch(checkYch: String) {
        if checkYch.hasSuffix("ych") {
            print("\(checkYch) has suffix -ych")
        }
        else {
            print("\(checkYch) hasn't suffix -ych")
        }
    }
    
    // task 3.
    func getApartNameAndSurname(nameSurname: String) {
        var newStringArray: [String] = []
        for character in nameSurname.characters {
            if String(character) == String(character).uppercased() {
                newStringArray.append(" ")
            }
            newStringArray.append(String(character))
        }
        let newString = newStringArray.joined().trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
        let name = newString[0]
        let surname = newString[1]
        let stringNameSurname = newString[0] + " " + newString[1]
        print(name, surname, "=", stringNameSurname)
    }
    
    // task 4.
    func reverseString(sourceString: String) -> String {
        let charactersArray = Array(sourceString.characters)
        var reversedArray = Array<String.CharacterView._Element>()
        for i in 1...charactersArray.count {
            reversedArray.append(charactersArray[charactersArray.count - i])
        }
        return String(reversedArray)
    }
    
    // task 5.
    func addComaForNumber(number: Int) -> String {
        
        return ""
    }
    
    // task 6.
    func checkPassword(password: String) {
        let numberCharacters = NSCharacterSet.decimalDigits
        let lowercasedCharacters = NSCharacterSet.lowercaseLetters
        let uppercasedCharacters = NSCharacterSet.uppercaseLetters
        let specialCharacters = NSCharacterSet.symbols
        var passwordReliability = 0
        if password.rangeOfCharacter(from: numberCharacters) != nil {
            print("a)")
            passwordReliability += 1
        }
        if password.rangeOfCharacter(from: lowercasedCharacters) != nil {
            print("b)")
            passwordReliability += 1
        }
        if password.rangeOfCharacter(from: uppercasedCharacters) != nil {
            print("c)")
            passwordReliability += 1
        }
        if password.rangeOfCharacter(from: specialCharacters) != nil {
            print("d)")
            passwordReliability += 1
        }
        switch passwordReliability {
        case 1:
            print("password reliability is 1")
        case 2:
            print("password reliability is 2")
        case 3:
            print("password reliability is 3")
        default:
            print("password reliability is 5")
        }
    }
    
    // task 8.
    func convertStrToTranslite(sourceString: String) -> String {
        var dictRusEng = ["Я" : "YA",
                          "З" : "Z",
                          "Ь" : "'"]
        
        let sourceStringLetters = sourceString.characters.map({ (char) -> String in
            return char.description
        })
        var resultArray = [String]()
        for letter in sourceStringLetters {
            resultArray.append(dictRusEng[letter] ?? "*")
        }
        
        return resultArray.joined()
    }
    
    // task 9.
    func daItemsInArray(stringArray: Array<String>) {
        print(stringArray.sorted())
        
    }
}

