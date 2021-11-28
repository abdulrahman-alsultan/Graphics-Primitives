import UIKit
import Darwin

struct Point{
    var X: Double
    var Y: Double
}

struct Line{
    var start: Point
    var end: Point
    
    func getLineLength() -> Double{
        return sqrt(pow((start.X - end.X), 2) + pow((start.Y - end.Y), 2))
    }
}

struct Triangle{
    var points: [Point]
    init(points: [Point]){
        self.points = points
    }
    
    func getTriangleArea() -> Double{
        if points.count == 3 {
            var base: Double
            var hieght: Double
            
            if points[0].Y != points[1].Y{
                hieght = abs(points[0].Y - points[1].Y)
            }
            else{
                hieght = abs(points[0].Y - points[2].Y)
            }
            
            base = max(
                (Line(start: self.points[0], end: self.points[1]).getLineLength() * 100).rounded() / 100,
                (Line(start: self.points[0], end: self.points[2]).getLineLength() * 100).rounded() / 100,
                (Line(start: self.points[1], end: self.points[2]).getLineLength() * 100).rounded() / 100
            )
            print((Line(start: self.points[0], end: self.points[1]).getLineLength() * 100).rounded() / 100)
            print((Line(start: self.points[0], end: self.points[2]).getLineLength() * 100).rounded() / 100)
            print((Line(start: self.points[1], end: self.points[2]).getLineLength() * 100).rounded() / 100)
            
            print(base)
            print(hieght)
            
            return 0.5 * hieght * base
        }
        return -1.0
    }
}


var triangle = Triangle(points: [Point(X: 1.0, Y: 5.0), Point(X: -2.0, Y: 1.0), Point(X: 3.0, Y: 2.0)])

print("The triangle area = 1/2 * h * b = \(triangle.getTriangleArea())")
