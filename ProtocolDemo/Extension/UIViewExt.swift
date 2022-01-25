//
//  UIViewExt.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import UIKit

extension UIView {
    public var top: CGFloat {
        get {
            return frame.minY
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    public var left: CGFloat {
        get {
            return frame.minX
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return frame.maxY
        }
    }
    
    public var right: CGFloat {
        get {
            return frame.maxX
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = CGPoint(x: newValue.x, y: newValue.y)
        }
    }

    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = CGSize(width: newValue.width, height: newValue.height)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
}
