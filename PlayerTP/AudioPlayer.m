//
//  AudioPlayer.m
//  PlayerTP
//
//  Created by Loïs Ménissier on 18/03/2015.
//  Copyright (c) 2015 Loïs Ménissier. All rights reserved.
//

#import "AudioPlayer.h"
#import "ViewController.h"

@interface AudioPlayer ()
    
@end

@implementation AudioPlayer

/*
 * Init the Player with Filename and FileExtension
 */
- (void)initPlayer:(NSString*) audioFile fileExtension:(NSString*)fileExtension
{
    NSURL *audioFileLocationURL = [[NSBundle mainBundle] URLForResource:audioFile withExtension:fileExtension];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileLocationURL error:&error];
    
    [self.audioPlayer setMeteringEnabled: YES];
}

/*
 * Simply fire the play Event
 */
- (void)playAudio {
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(getGain:)
                                   userInfo:nil
                                    repeats:YES];
    [self.audioPlayer play];
}

/*
 * Simply fire the pause Event
 */
- (void)pauseAudio {
    [self.audioPlayer pause];
}

/*
 * Format the float time values like duration
 * to format with minutes and seconds
 */
-(NSString*)timeFormat:(float)value{
    
    float minutes = floor(lroundf(value)/60);
    float seconds = lroundf(value) - (minutes * 60);
    
    long roundedSeconds = lroundf(seconds);
    long roundedMinutes = lroundf(minutes);
    
    NSString *time = [[NSString alloc]
                      initWithFormat:@"%ld:%02ld",
                      roundedMinutes, roundedSeconds];
    return time;
}

/*
 * To set the current Position of the
 * playing audio File
 */
- (void)setCurrentAudioTime:(float)value {
    [self.audioPlayer setCurrentTime:value];
}

/*
 * Get the time where audio is playing right now
 */
- (NSTimeInterval)getCurrentAudioTime {
    return [self.audioPlayer currentTime];
}

/*
 * Get the whole length of the audio file
 */
- (float)getAudioDuration {
    return [self.audioPlayer duration];
}

-(void)getGain:(NSTimer*)sender{
    [_audioPlayer updateMeters];
    float peakPowerLeft = [_audioPlayer peakPowerForChannel:0];
    NSLog(@"peakLEFT : %f",peakPowerLeft+160.0);
    
    float peakPowerRight = [_audioPlayer peakPowerForChannel:1];
    NSLog(@"peakRIGHT : %f",peakPowerRight+160.0);
}

@end
