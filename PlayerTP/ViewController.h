//
//  ViewController.h
//  PlayerTP
//
//  Created by Loïs Ménissier on 18/03/2015.
//  Copyright (c) 2015 Loïs Ménissier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioPlayer.h"
#import "AudioMetric.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) AudioPlayer *audioPlayer;

@property (weak, nonatomic) IBOutlet UISlider *currentTimeSlider;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *timeElapsed;
@property (weak, nonatomic) IBOutlet AudioMetric *leftChan;
@property (weak, nonatomic) IBOutlet AudioMetric *rightChan;

@property BOOL isPaused;
@property BOOL scrubbing;

@property NSTimer *timer;

@end

