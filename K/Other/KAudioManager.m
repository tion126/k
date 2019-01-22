//
//  KAudioManager.m
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KAudioManager.h"
#import "AEAudioController.h"
#import "AERecorder.h"
#import <AVFoundation/AVFoundation.h>
#import "AEPlaythroughChannel.h"

@interface KAudioManager()

@property (strong,nonatomic) AEAudioFilePlayer *player;
@property (strong,nonatomic) AERecorder        *recorder;
@property (strong,nonatomic) AEAudioController *controller;
@property (strong,nonatomic) KSongListEntity  *data;
@end

@implementation KAudioManager
implementationSingleton(KAudioManager)


-(AERecorder *)recorder{
    if (!_recorder) {
        _recorder = [[AERecorder alloc] initWithAudioController:self.controller];
    }
    return _recorder;
}

-(AEAudioController *)controller{
    if (!_controller) {
        _controller = [[AEAudioController alloc] initWithAudioDescription:[AEAudioController nonInterleavedFloatStereoAudioDescription] inputEnabled:YES];
        _controller.preferredBufferDuration = 0.005;
        _controller.useMeasurementMode = YES;
    }
    return _controller;
}

-(void)setData:(KSongListEntity *)data{
    _data = data;
}

-(void)start{
    
    NSError *error = NULL;
//    if ( ![self.recorder beginRecordingToFileAtPath:self.getPath fileType:kAudioFileWAVEType error:&error] ) {
//        _recorder = nil;
//        return;
//    }
    AEPlaythroughChannel *channel = [AEPlaythroughChannel new];
    channel.volume = 80;
//    [self.controller addOutputReceiver:self.recorder];
//    [self.controller addInputReceiver:self.recorder];
    [self.controller addInputReceiver:channel];
//    [self.controller addOutputReceiver:channel];
    
    self.player = [AEAudioFilePlayer audioFilePlayerWithURL:self.data.localMp3 error:nil];
    [self.controller addChannels:@[self.player,channel]];
    [self.controller start:nil];
}

-(void)stop{
    
}

- (NSString *)getPath
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYYMMddhhmmss"];
    NSString *recordName = [NSString stringWithFormat:@"%@.wav", [formatter stringFromDate:[NSDate date]]];
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:recordName];
    return path;
}


-(void)requestPermission{
    
    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        
    }];
}

@end
