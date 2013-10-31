//
//  ViewController.h
//  AntiKomar
//
//  Created by Sasha Pont on 29.09.13.
//  Copyright (c) 2013 Sasha Pont. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController  <AVAudioPlayerDelegate>
{
    IBOutlet UIButton *OnButton;
    IBOutlet UIWebView *webView;
    IBOutlet UITextField *textField;
    AVAudioPlayer *audioPlayer;
    IBOutlet UILabel * label;
}


@property (nonatomic, retain) IBOutlet UIButton *OnButton;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *aboutView;
@property (strong, nonatomic) IBOutlet UIView *SpravkaView;
@property (strong, nonatomic) IBOutlet UILabel * label;
- (IBAction)OnButtonAction:(id)sender;
- (IBAction)mnuAbout:(id)sender;
- (IBAction)mnuHelp:(id)sender;
- (IBAction)closePopupAction1:(id)sender;
- (IBAction)Ssilka;

@end
