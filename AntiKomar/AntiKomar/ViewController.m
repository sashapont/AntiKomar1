//
//  ViewController.m
//  AntiKomar
//
//  Created by Sasha Pont on 29.09.13.
//  Copyright (c) 2013 Sasha Pont. All rights reserved.
//

#import "ViewController.h"
#import "ASDepthModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize OnButton;
@synthesize webView;
@synthesize textField;
@synthesize aboutView;

- (void)viewDidLoad
{
    // Create and initialize a tap gesture
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(Ssilka)];
    
    // Specify that the gesture must be a single tap
    tapRecognizer.numberOfTapsRequired = 1;
    
    // Add the tap gesture recognizer to the view
    [self.label addGestureRecognizer:tapRecognizer];
    
    // Do any additional setup after loading the view, typically from a nib
    self.aboutView.layer.cornerRadius = 12;
    self.aboutView.layer.shadowOpacity = 0.7;
    self.aboutView.layer.shadowOffset = CGSizeMake(6, 6);
    self.aboutView.layer.shouldRasterize = YES;
    self.aboutView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    self.SpravkaView.layer.cornerRadius = 12;
    self.SpravkaView.layer.shadowOpacity = 0.7;
    self.SpravkaView.layer.shadowOffset = CGSizeMake(6, 6);
    self.SpravkaView.layer.shouldRasterize = YES;
    self.SpravkaView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"a2"
                                         ofType:@"wav"]];
    
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnButtonAction:(id)sender
{
 //   NSSound * myAwesomeSound = [NSSound soundNamed:@"a2.mp3"];
     if ([OnButton.currentImage isEqual:[UIImage imageNamed:@"on.png"]])
    {
     
        [OnButton setImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
   audioPlayer.numberOfLoops=-1;
[audioPlayer play];
        
        
        
    }
    
    else
    {
        [OnButton setImage:[UIImage imageNamed:@"on.png"] forState:UIControlStateNormal];
        [audioPlayer stop];
    }
}

- (IBAction)mnuAbout:(id)sender; {
    
    [ASDepthModalViewController presentView:self.aboutView
                            backgroundColor:nil
                                    options:ASDepthModalOptionAnimationGrow
                          completionHandler:^{
                              
                          }];

    
}



- (IBAction)mnuHelp:(id)sender;
{
[ASDepthModalViewController presentView:self.SpravkaView
                        backgroundColor:nil
                                options:ASDepthModalOptionAnimationGrow
                      completionHandler:^{
                          
                      }];
// узнаем путь к файлу
NSString* filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
// помещаем в NSString
NSString* html = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];

// загружаем в UIWebView содержимое
[webView loadHTMLString:html baseURL:nil];

}



- (IBAction)closePopupAction1:(id)sender
{
    [ASDepthModalViewController dismiss];
    //  [self tableView:_tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
}

- (IBAction)Ssilka {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.pontsgames.da.ru"]];
}

@end
