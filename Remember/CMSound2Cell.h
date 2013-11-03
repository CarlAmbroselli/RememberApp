//
//  CMSound2Cell.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMRememberCell.h"

@interface CMSound2Cell : CMRememberCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
- (IBAction)playButtonPressed:(id)sender;

@end
