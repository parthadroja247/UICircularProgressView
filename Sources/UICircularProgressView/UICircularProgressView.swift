import UIKit

open class UICircularProgressView: UIView {
    
    open var backgroundCircleColor: UIColor = .black {
        didSet {
            backgroundCircle.strokeColor = backgroundCircleColor.cgColor
        }
    }
    open var fillColor: UIColor = .white {
        didSet {
            progressCircle.strokeColor = fillColor.cgColor
        }
    }
    open var lineWidth: CGFloat = 4 {
        didSet {
            backgroundCircle.lineWidth = lineWidth
            progressCircle.lineWidth = lineWidth
        }
    }
    open var defaultProgress: CGFloat = 0 {
        didSet {
            updateProgress(progress: defaultProgress)
        }
    }
    
    private var backgroundCircle: CAShapeLayer!
    private var progressCircle: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        drawBackgroundCircle()
        drawProgressCircle()
    }
    
    private func drawBackgroundCircle() {
        backgroundCircle = CAShapeLayer()
        let centerPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius: CGFloat = self.bounds.width / 2
        let circlePath = UIBezierPath(arcCenter: centerPoint,
                                      radius: circleRadius,
                                      startAngle: CGFloat(-0.5 * .pi),
                                      endAngle: CGFloat(1.5 * .pi),
                                      clockwise: true)
        backgroundCircle.path = circlePath.cgPath
        backgroundCircle.strokeColor = UIColor.green.cgColor
        backgroundCircle.fillColor = UIColor.clear.cgColor
        backgroundCircle.lineWidth = 4
        backgroundCircle.lineCap = .round
        backgroundCircle.lineJoin = .round
        backgroundCircle.strokeStart = 0
        backgroundCircle.strokeEnd = 1.0
        self.layer.addSublayer(backgroundCircle)
    }
    
    private func drawProgressCircle() {
        progressCircle = CAShapeLayer()
        let centerPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius: CGFloat = self.bounds.width / 2
        let circlePath = UIBezierPath(arcCenter: centerPoint,
                                      radius: circleRadius,
                                      startAngle: CGFloat(-0.5 * .pi),
                                      endAngle: CGFloat(1.5 * .pi),
                                      clockwise: true)
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = UIColor.red.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 4
        progressCircle.lineCap = .round
        progressCircle.lineJoin = .round
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = 0.0
        self.layer.addSublayer(progressCircle)
    }
    
    open func updateProgress(progress: CGFloat) {
        progressCircle.strokeEnd = CGFloat(progress / 100)
    }
}
