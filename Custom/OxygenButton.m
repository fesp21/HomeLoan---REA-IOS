//
//  OxygenButton.m
//  Car Insurance
//
//  Created by Dheina Lundi A on 06/05/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "OxygenButton.h"

@implementation OxygenButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.titleLabel.font = [UIFont fontWithName:@"Oxygen" size:self.titleLabel.font.pointSize];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
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
