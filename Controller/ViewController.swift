import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var smileView: SmileView!
    
    var dataSource: DataSource = DataSourceImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        smileView.setDataSource(dataSource)
        smileView.setNeedsDisplay()
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
