//
//  CMImageCell.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMImageCell.h"
#import "Media.h"

@implementation CMImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setPost:(Post *)post
{
    [super setPost:post];
    self.mainImageView.image = [UIImage imageNamed:((Media *)[[post.media allObjects] firstObject]).fileName];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
