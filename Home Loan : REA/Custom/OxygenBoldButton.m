//
//  OxygenBoldButton.m
//  Car Insurance
//
//  Created by Dheina Lundi A on 13/06/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "OxygenBoldButton.h"

@implementation OxygenBoldButton

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
    self.titleLabel.font = [UIFont fontWithName:@"Oxygen-Bold" size:self.titleLabel.font.pointSize];
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
