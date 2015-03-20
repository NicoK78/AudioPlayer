//
//  AudioMetric.m
//  PlayerTP
//
//  Created by nkervoern on 18/03/2015.
//  Copyright (c) 2015 Loïs Ménissier. All rights reserved.
//

#import "AudioMetric.h"

@interface AudioMetric() {
    float heightMetric;
    float widthMetric;
    UIView *myView;
}
@end

@implementation AudioMetric

-(AudioMetric*)initWithFrame:(CGRect)aRect {
    self = [super initWithFrame:aRect];
    
    [self initialisation];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    
    [self initialisation];
    
    return self;
}

-(void)initialisation {
    UIGraphicsBeginImageContext(self.frame.size);
    [[UIImage imageNamed:@"audioMetric.png"] drawInRect:self.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.backgroundColor = [UIColor colorWithPatternImage:image];
    //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"audioMetric.jpg"]];
    
    heightMetric = self.frame.size.height;
    widthMetric = self.frame.size.width;
    myView = [[UIView alloc]initWithFrame:self.frame];
    myView.backgroundColor = [UIColor blackColor];
    //NSString *hei = [[NSNumber numberWithFloat:self.frame.size.height] stringValue];
    //NSLog(hei);
    [self insertSubview:myView atIndex:0];
}

-(void)create:(float) db {
    
    myView.frame = CGRectMake(0, 0, self.frame.size.width, db);
}

@end
