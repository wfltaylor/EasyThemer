//
//  PointerArray.swift
//  EasyThemer
//
//  Created by William Taylor on 15/9/18.
//

import Foundation

/**
 More convenient version of NSPointerArray
 */
class PointerArray<Type>: Sequence {
    
    typealias Iterator = PointerArrayIterator
    
    private var value: NSPointerArray
    
    var valueAdded: ((Type) -> Void)?
    
    /**
     Creates a PointerArray that either has weak or strong references
     
     - Parameter type: Weak or strong references
     
     */
    init(type: PointerArrayType) {
        switch type {
        case .weak:
            value = NSPointerArray.weakObjects()
        case .strong:
            value = NSPointerArray.strongObjects()
        }
    }
    
    /**
     Adds an element to the PointerArray
     
     - Parameter object: The item being added
     
     */
    func append(_ object: Type) {
        let strongObject = object as AnyObject
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        value.addPointer(pointer)
        valueAdded?(object)
    }
    
    /**
     Gets the object at a given index.
     
     As objects are automatically removed when they become nil, be careful what index you are using
     
     - Parameter index: The index of the object
     
     - Returns: The item at the given index if it exists
     
     */
    func object(at index: Int) -> Type? {
        guard index < value.count, let pointer = value.pointer(at: index) else { return nil }
        return Unmanaged<AnyObject>.fromOpaque(pointer).takeUnretainedValue() as? Type
    }
    
    /**
     Creates a personalized greeting for a recipient.
     
     - Parameter index: The index of the object being replaced
     
     - Parameter object: The object to replace with
     
     */
    func replace(at index: Int, withObject object: Type?) {
        guard index < value.count else { return }
        let strongObject = object as AnyObject
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        value.replacePointer(at: index, withPointer: pointer)
    }
    
    /**
     Returns an iterator that will iterate over all of the values in the PointerArray
     
     - Returns: An iterator that will iterate over all of the values
     
     */
    func makeIterator() -> PointerArray<Type>.Iterator<Type> {
        return PointerArrayIterator(value: self)
    }
    
    /**
     The last value in the PointerArray
     */
    var last: Type? {
        get {
            return object(at: value.count-1)
        }
        set {
            replace(at: value.count-1, withObject: newValue)
        }
    }
    
    /**
     The number of elements in the array
     */
    var count: Int {
        get {
            return value.count
        }
    }
    
    subscript(index: Int) -> Type? {
        get {
            return object(at: index)
        }
        
        set (value) {
            replace(at: index, withObject: value)
        }
    }
    
}
/**
 An iterator that iterates over all of the pointers in a PointerArray
 */
class PointerArrayIterator<Type>: IteratorProtocol {
    
    typealias Element = Type
    var currentIndex = 0
    var pointerArray: PointerArray<Type>
    
    /**
     Creates an iterator with a given PointerArray
     
     - Parameter value: The PointerArray to iterate over
     
     */
    init(value: PointerArray<Type>) {
        pointerArray = value
    }
    
    /**
     The next value in the PointerArray
     
     - Returns: The next value
     
     */
    func next() -> PointerArrayIterator.Element? {
        defer {
            currentIndex += 1
        }
        if pointerArray[currentIndex] == nil && currentIndex < pointerArray.count {
            while pointerArray[currentIndex] == nil {
                if currentIndex >= pointerArray.count {
                    return nil
                }
                currentIndex += 1
            }
        }
        return pointerArray[currentIndex]
    }
    
}
/**
 The type of PointerArray to initilise
 */
enum PointerArrayType {
    case weak
    case strong
}
