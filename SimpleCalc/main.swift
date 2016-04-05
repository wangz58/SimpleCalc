//
//  main.swift
//  SimpleCalc
//
//  Created by apple on 4/4/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation

print("Hello, World!")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding)as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

print("Enter an expression separated by returns:");
let firstInput = readLine(stripNewline: true)!;

let inputArr = firstInput.characters.split {$0 == " "}.map { String($0) }
let count = inputArr.count;
var result: Int?;

if count >= 2 {
    if inputArr[count - 1] == "count" {
        result = count - 1;
    } else if inputArr[count - 1] == "avg" {
        var element:Int?;
        result = 0;
        var i = 0
        while i < count - 1 {
            element = Int(inputArr[i]);
            result = result! + element!;
            i = i + 1;
        }
        result = result! / (count - 1);
    } else if inputArr[count - 1] == "fact" && count == 2 {
        var base: Int? = Int(inputArr[0]);
        result = 1;
        var j = base!;
        while j >= 1 {
            result = result! * j;
            j = j - 1;
        }
    } else {
        print("Invalid input!");
    }
} else if count == 1 {
    
    let firstNum:Int? = Int(firstInput);
    
    let oper = readLine(stripNewline: true)!;
    
    let secondNum: Int? = Int(readLine(stripNewline: true)!);
    
    if oper == "+" {
        result = firstNum! + secondNum!;
    } else if oper == "-" {
        result = firstNum! - secondNum!;
    } else if oper == "*" {
        result = firstNum! * secondNum!;
    } else if oper == "/" {
        result = firstNum! / secondNum!;
    } else if oper == "%" {
        result = firstNum! % secondNum!;
    }else {
        print("Invalid input!");
    }
}
if result != nil {
    print("Result: \(result!)");
}