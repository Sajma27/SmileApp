import Foundation

protocol DataSource {
    func setCurrentValue(_ sliderValue: Float)
    var value: Float{ get }
}

class DataSourceImpl: DataSource{
    private(set) var value: Float
    
    init(value: Float){
        self.value = value;
    }
    
    convenience init() {
        self.init(value: 0)
    }
    
    func setCurrentValue(_ sliderValue: Float) {
        self.value = sliderValue
    }
}


