//
//  CMRememberCell.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMRememberCell.h"

@implementation CMRememberCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setPost:(Post *)post
{
    _post = post;
    self.titleLabel.text = post.headline;
}

- (IBAction)likeButtonPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
}
@end
