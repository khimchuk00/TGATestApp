//
//  ThreadSafeDictionary.swift
//  TGATest
//
//  Created by Valentyn Khimchuk on 25.06.2022.
//

import Foundation

class ThreadSafeDictionary<Key: Hashable, Value> {
    private var dictionary = [Key: Value]()
    
    let queue = DispatchQueue(label: "ThreadSafeDictionary", qos: .userInitiated, attributes: .concurrent)
    
    subscript(key: Key) -> Value? {
        get {
            var result: Value?
            
            queue.sync {
                result = dictionary[key]
            }
            
            return result
        }
        set {
            queue.async(flags: .barrier) {
                self.dictionary[key] = newValue
            }
        }
    }
}
