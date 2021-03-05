import Foundation
import XCTest
import Atributika

class AtributikaTests: XCTestCase {
    
    func testParams() {
        let a = "<a href=\"http://google.com\">Hello</a> World!!!".style()
        
        let reference = NSMutableAttributedString(string: "Hello World!!!")
        
        XCTAssertEqual(a.attributedString, reference)
        
        XCTAssertEqual(a.detections[0].range, a.string.startIndex..<a.string.index(a.string.startIndex, offsetBy: 5))
        
        if case .tag(let tag) = a.detections[0].type {
            XCTAssertEqual(tag.name, "a")
            XCTAssertEqual(tag.attributes, ["href": "http://google.com"])
        }
        
    }
    
    func testHrefTuner() {
        
        let a = Style("a")
        
        let test = "<a href=\"https://github.com/psharanda/Atributika\">link</a>".style(tags: a, tuner: { style, tag in
            if tag.name == a.name {
                if let link = tag.attributes["href"] {
                    return style.link(URL(string: link)!)
                }
            }
            return style
        }).attributedString
        
        let reference = NSMutableAttributedString(string: "link")
        reference.addAttributes([NSAttributedString.Key.link: URL(string: "https://github.com/psharanda/Atributika")!], range: NSMakeRange(0, 4))
        XCTAssertEqual(test, reference)
    }
}
