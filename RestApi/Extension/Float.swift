//
//  Float.swift
//  RestApi
//

extension Float{
    func moneyStyle() -> String{
        String(format: "%.2f", self)
    }
}
