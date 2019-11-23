import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var smileView: SmileView!
    
    var dataSource: DataSource = DataSourceImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        smileView.setDataSource(dataSource)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        smileView.draw(CGRect())  //Niestety nie wiem jak użyć tej metody
        refreshText()
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        dataSource.setCurrentValue(slider.value)
        smileView.setDataSource(dataSource)
        smileView.setNeedsDisplay()
        refreshText()
    }

    private func refreshText() {
        let sliderValue = dataSource.value
        if sliderValue < -0.4{
            mainLabel.text = "Sad 😫"
        }else if sliderValue <= 0.4{
            mainLabel.text = "Meh... 😐"
        }else{
            mainLabel.text = "Smile! 😁"
        }
        mainLabel.sizeToFit()
    }
}
