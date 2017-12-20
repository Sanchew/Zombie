//
//  Codable.swift
//  Alamofire
//
//  Created by Sanchew on 2017/12/20.
//

import Foundation

public func <<Key>(container: KeyedDecodingContainer<Key>, key: Key) -> Bool {
    return try! container.decode(Bool.self, forKey: key)
}

public func <<Key>(container: KeyedDecodingContainer<Key>, key: Key) -> String {
    return try! container.decode(String.self, forKey: key)
}

public func <<Key>(container: KeyedDecodingContainer<Key>, key: Key) -> Int {
    return try! container.decode(Int.self, forKey: key)
}


public func <<Key>(container: KeyedDecodingContainer<Key>, key: Key) -> Double {
    return try! container.decode(Double.self, forKey: key)
}


public func <<Key,Value: Decodable>(container: KeyedDecodingContainer<Key>, key: Key) -> Value {
    return try! container.decode(Value.self, forKey: key)
}


