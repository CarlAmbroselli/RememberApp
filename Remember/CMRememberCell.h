//
//  CMRememberCell.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface CMRememberCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *yearIcon;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;

@property (strong, nonatomic) Post *post;

- (IBAction)soundButtonPressed:(id)sender;
- (IBAction)likeButtonPressed:(UIButton *)sender;

@end
