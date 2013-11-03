//
//  CMSoundCell.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMSoundCell.h"
#import "Media.h"

@implementation CMSoundCell

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

-(void)setPost:(Post *)post
{
    [super setPost:post];
    self.mainImageView.image = [UIImage imageNamed:((Media *)[[[post.media allObjects] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"mediaType == %@", @"image"]]firstObject]).fileName];
}

- (IBAction)playButtonPressed:(id)sender {
    [[SoundManager sharedManager] playMusic:((Media *)[[[self.post.media allObjects] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"mediaType == %@", @"music"]] lastObject]).fileName looping:YES];
}

@end
