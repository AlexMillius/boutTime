//
//  ViewController.swift
//  boutTime
//
//  Created by Mohamed Lee on 22.07.16.
//  Copyright © 2016 TumTum. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var boxOneView: UIView!
    @IBOutlet weak var boxTwoView: UIView!
    @IBOutlet weak var boxThreeView: UIView!
    @IBOutlet weak var boxFourView: UIView!
    @IBOutlet weak var boxInfosView: UIView!
    
    @IBOutlet weak var bottomInfoLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var yourScoreLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nextRoundBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var infoBtn: UIButton!
    
    
    @IBOutlet weak var boxOneHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxTwoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxFourHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxThreeHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxInfoHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var boxTwoUpArrowHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxTwoDownArrowHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxThreeUpArrowConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxThreeDownArrowConstraint: NSLayoutConstraint!
    
    var correctSound:SystemSoundID = 0
    var failSound:SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBoxesHeiht(factor: 6)
        makeCornerRound(Viewradius: 5, buttonRadius: 15)
        laodAllSounds()
        selectInterface(.roundResultFail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - Helper Method
    
    //MARK: UI Helper
    func makeCornerRound(Viewradius radius:CGFloat, buttonRadius:CGFloat){
        boxOneView.layer.cornerRadius = radius
        boxTwoView.layer.cornerRadius = radius
        boxThreeView.layer.cornerRadius = radius
        boxFourView.layer.cornerRadius = radius
        logoImg.layer.cornerRadius = radius
        playAgainBtn.layer.cornerRadius = buttonRadius
    }
    
    func hideBoxes(hidden:Bool){
        boxOneView.hidden = hidden
        boxTwoView.hidden = hidden
        boxThreeView.hidden = hidden
        boxFourView.hidden = hidden
        boxInfosView.hidden = hidden
    }
    
    func bottomUIRoundInProgress(hidden:Bool){
        nextRoundBtn.hidden = hidden
        timerLbl.hidden = !hidden
        bottomInfoLbl.hidden = !hidden
        infoBtn.hidden = hidden
    }
    
    func hideResultUI(hidden:Bool){
        logoImg.hidden = hidden
        yourScoreLbl.hidden = hidden
        scoreLbl.hidden = hidden
        playAgainBtn.hidden = hidden
    }
    
    enum Interfaces {
        case instruction
        case roundInProgress
        case roundResultSuccess
        case roundResultFail
        case gameResult
    }
    
    enum NextRoundImg:String {
        case next_round_success
        case next_round_fail
        
        func icon() -> UIImage {
            if let image = UIImage(named: self.rawValue){
                return image
            } else {
                return UIImage()
            }
        }
    }
    
    func selectInterface(interface:Interfaces){
        switch interface {
        case .instruction:
            //use the score Label and the play again button to display some instructions
            yourScoreLbl.text = "Welcome to the game\nClass the moovies in order of release\nYou have 60 seconds per round\nGood Luck!"
            playAgainBtn.setTitle("Let's Go", forState: .Normal)
            hideResultUI(false)
            hideBoxes(true)
        case .roundInProgress:
            hideResultUI(true)
            hideBoxes(false)
            bottomUIRoundInProgress(true)
        case .roundResultSuccess:
            hideResultUI(true)
            hideBoxes(false)
            nextRoundBtn.setImage(NextRoundImg.next_round_success.icon(), forState: .Normal)
            bottomUIRoundInProgress(false)
            playSound(correctSound)
        case .roundResultFail:
            hideResultUI(true)
            hideBoxes(false)
            nextRoundBtn.setImage(NextRoundImg.next_round_fail.icon(), forState: .Normal)
            bottomUIRoundInProgress(false)
            playSound(failSound)
        case .gameResult:
            yourScoreLbl.text = "Your Score"
            playAgainBtn.setTitle("Play Again", forState: .Normal)
            hideResultUI(false)
            hideBoxes(true)
            bottomUIRoundInProgress(true)
        }
    }
    
    func setBoxesHeiht(factor factor: CGFloat){
        //Get the height of the screen and divide it by a factor to get the height of every box
        let heightOfBox = UIScreen.mainScreen().bounds.height / factor

        boxOneHeightConstraint.constant = heightOfBox
        boxTwoHeightConstraint.constant = heightOfBox
        boxThreeHeightConstraint.constant = heightOfBox
        boxFourHeightConstraint.constant = heightOfBox
        boxInfoHeightConstraint.constant = heightOfBox
        
        //Call the function to set the height of arrows in the middle boxes
        setDoubleArrowHeight(heightOfArrow: heightOfBox / 2)
    }
    
    func setDoubleArrowHeight(heightOfArrow height:CGFloat){
        boxTwoUpArrowHeightConstraint.constant = height
        boxTwoDownArrowHeightConstraint.constant = height
        boxThreeUpArrowConstraint.constant = height
        boxThreeDownArrowConstraint.constant = height
    }
    
    //MARK: sound Helper
    enum Sounds:String{
        case CorrectDing
        case IncorrectBuzz
    }
    
    func laodAllSounds(){
        let wav = "wav"
        correctSound = loadSound(correctSound, pathName: Sounds.CorrectDing.rawValue, type: wav)
        failSound = loadSound(failSound, pathName: Sounds.IncorrectBuzz.rawValue, type: wav)
    }
    
    func loadSound(systSoundId:SystemSoundID, pathName:String, type:String) -> SystemSoundID{
        var sound = SystemSoundID()
        let pathToSoundFile = NSBundle.mainBundle().pathForResource(pathName, ofType: type)
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        return sound
    }
    
    func playSound(soundId:SystemSoundID) {
        AudioServicesPlaySystemSound(soundId)
    }
}

