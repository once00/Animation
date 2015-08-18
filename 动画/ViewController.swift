//
//  ViewController.swift
//  动画
//
//  Created by Once on 15/7/13.
//  Copyright (c) 2015年 com.once*. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mFirstView: UIView!
    @IBOutlet var mSecondView: UIView!
    
    var mOriginFrame1:CGRect!//记录mFirstView的原始参数
    var mOriginFrame2:CGRect!//记录mFirstView的原始参数
    
    var mFirstsubView:UIView!
    var mOriginFrameSubView :CGRect!=CGRectMake(5, 5, 50, 50)//记录mFirstsubView的原始参数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mOriginFrame1=self.mFirstView.frame
        self.mOriginFrame2=self.mSecondView.frame
        self.mFirstsubView=UIView(frame:self.mOriginFrameSubView)
        self.mFirstsubView.backgroundColor=UIColor.purpleColor()
        self.mFirstView.addSubview(self.mFirstsubView )
        self.mOriginFrameSubView=self.mFirstsubView.frame
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startAnimate(sender: AnyObject) {
        //动画1
//        self.basicAnimate()
        //动画2
//        self.optionAnimate()
        //动画3
//        self.beginCommitAnimate()
        //操作视图的动画
//        self.operateSubView()
        //
        self.replaceView()
        
    }
    @IBAction func fallackAnimate(sender: AnyObject) {
        self.mFirstView.frame=mOriginFrame1
        self.mFirstView.layer.removeAllAnimations()
        
        self.mSecondView.frame=mOriginFrame2
        self.mSecondView.layer.removeAllAnimations()
        
        self.mFirstsubView.frame=mOriginFrameSubView
        self.mFirstsubView.layer.removeAllAnimations()
    }

    /**
    <#Description#>
    */
    func basicAnimate(){
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.mFirstView.frame.origin.x+=100
        })
    }
    /**
    <#Description#>
    */
    func optionAnimate(){
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            
            self.mFirstView.frame.origin.x+=100
            
            UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.OverrideInheritedDuration | UIViewAnimationOptions.OverrideInheritedCurve | UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.mSecondView.frame.origin.x+=100
            }, completion: { (finish) -> Void in
                println("inner animate finished")
            })
            
        }) { (finish) -> Void in
            println("outter animater finished")
        }
    }
    /**
    老版本动画(iOS6.0)
    */
    func beginCommitAnimate(){
        //1.声明动画开始
        UIView.beginAnimations("testAnimate", context: nil)
        UIView.setAnimationDuration(2.0)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10)
        //动画代理
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStartSelector("animationDidStar:")
        UIView.setAnimationDidStopSelector("animationDidStop:finished:")
        
        //2.操作视图
        self.mFirstView.backgroundColor=UIColor.magentaColor()
        
        //3.提交动画
        UIView.commitAnimations()
    }
    override func animationDidStart(anim: CAAnimation!) {
        println("Animation Start")
    }
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("Animation stop")
    }
    
    /**
    *  MARK:Operate View
    */
    func operateSubView(){
        UIView.transitionWithView(self.mFirstView, duration: 2.0, options: UIViewAnimationOptions.TransitionCrossDissolve | UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            self.mFirstsubView.frame.origin.x+=100
        }) { (finish) -> Void in
            println("finished")
        }
    }
    /**
    *  <#Description#>
    */
    func  replaceView(){
        var view=UIView(frame: CGRectMake(50, 400, 268, 68))
        view.backgroundColor=UIColor.magentaColor()
        UIView.transitionFromView(self.mSecondView, toView: view, duration: 2.0, options: UIViewAnimationOptions.TransitionCrossDissolve) { ( finish) -> Void in
            println("finished ")
        }
    }
}







