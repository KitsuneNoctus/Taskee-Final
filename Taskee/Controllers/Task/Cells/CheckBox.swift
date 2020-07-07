//
//  CheckBox.swift
//  Taskee
//
//  Created by Henry Calderon on 7/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

//Using this code https://medium.com/swift-india/simple-checkbox-component-in-ios-311a865c0b02

import UIKit

@IBDesignable
public class CheckBox: UIControl {
    
    public enum Style{
        case fill
        case tick
    }
    
    public enum BorderStyle{
        case roundedSquare(radius: CGFloat)
    }
    
    var style: Style = .tick
    var borderStyle: BorderStyle = .roundedSquare(radius: 5)
    
    @IBInspectable
    var borderWidth: CGFloat = 1.75
    var checkmarkSize: CGFloat = 0.5
    
    @IBInspectable
    var todoColor: UIColor = UIColor(named: "todoGreen")!
    
    var checkBackground: UIColor = .white
    
    var increasedTouchRadius: CGFloat = 5
    
    var useHapticFeedback: Bool = true
    
    @IBInspectable
    var isChecked: Bool = false {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    //UIImpactFeedbackGenerator object to wake up the device engine to provide feed backs
    private var feedbackGenerator: UIImpactFeedbackGenerator?
    
    
    //MARK: Setup and Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
    }
    
    //MARK: Touches
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.feedbackGenerator = UIImpactFeedbackGenerator.init(style: .light)
        self.feedbackGenerator?.prepare()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isChecked = !isChecked
        self.sendActions(for: .valueChanged)
        if useHapticFeedback{
            self.feedbackGenerator?.impactOccurred()
            self.feedbackGenerator = nil
        }
    }
    
    //MARK: Draw
    open override func draw(_ rect: CGRect) {
        let newRect = rect.insetBy(dx: borderWidth/3, dy: borderWidth/2)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(self.isChecked ? todoColor.cgColor : tintColor.cgColor)
        context.setFillColor(todoColor.cgColor)
        context.setLineWidth(borderWidth)
        
        var shapePath: UIBezierPath!
        switch self.borderStyle {
        case .roundedSquare(let radius):
            shapePath = UIBezierPath(roundedRect: newRect, cornerRadius: radius)
        }
        
        context.addPath(shapePath.cgPath)
        context.strokePath()
        context.fillPath()
        
        if isChecked{
            switch self.style {
            case .tick:
                self.drawCheckMark(frame: newRect)
            case .fill:
                self.drawFill()
            }
        }
    }
    
    //MARK: Subviews & Builder
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setNeedsDisplay()
    }
    
    //MARK: Point
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -increasedTouchRadius, left: -increasedTouchRadius, bottom: -increasedTouchRadius, right: -increasedTouchRadius)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
    
    func drawCheckMark(frame: CGRect) {
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.50000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38000 * frame.width, y: frame.minY + 0.60000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.70000 * frame.width, y: frame.minY + 0.24000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.78000 * frame.width, y: frame.minY + 0.30000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.20000 * frame.width, y: frame.minY + 0.58000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        todoColor.setFill()
//        checkmarkColor.setFill()
        bezierPath.fill()
    }
    
    func drawFill(){
        
    }
    
}
