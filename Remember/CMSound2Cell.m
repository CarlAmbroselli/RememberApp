//
//  CMSound2Cell.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMSound2Cell.h"
#import "Media.h"
#import "SoundManager.h"

@implementation CMSound2Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)playButtonPressed:(id)sender {
    [[SoundManager sharedManager] playMusic:((Media *)[[[self.post.media allObjects] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"mediaType == %@", @"music"]] lastObject]).fileName looping:YES];
}

-(void)setPost:(Post *)post
{
    [super setPost:post];
    self.leftImageView.image = [UIImage imageNamed:((Media *)[[[post.media allObjects] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"mediaType == %@", @"image"]]firstObject]).fileName];
    self.rightImageView.image = [UIImage imageNamed:((Media *)[[[post.media allObjects] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"mediaType == %@", @"image"]] lastObject]).fileName];
}
@end
