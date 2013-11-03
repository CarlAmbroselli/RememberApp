//
//  CMSoundCell.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMRememberCell.h"
#import "SoundManager.h"

@interface CMSoundCell : CMRememberCell
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
- (IBAction)soundButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end
