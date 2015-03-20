//
//  AudioPlayer.h
//  PlayerTP
//
//  Created by Loïs Ménissier on 18/03/2015.
//  Copyright (c) 2015 Loïs Ménissier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioPlayer : NSObject  {
    
}

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

// Public methods
- (void)initPlayer:(NSString*) audioFile fileExtension:(NSString*)fileExtension;
- (void)playAudio;
- (void)pauseAudio;
- (void)setCurrentAudioTime:(float)value;
- (float)getAudioDuration;
- (NSString*)timeFormat:(float)value;
- (NSTimeInterval)getCurrentAudioTime;
-(void)getGain:(NSTimer*)sender;

@end

