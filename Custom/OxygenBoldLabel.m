//
//  OxygenBoldLabel.m
//  Car Insurance
//
//  Created by Dheina Lundi A on 08/05/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "OxygenBoldLabel.h"

@implementation OxygenBoldLabel

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
    self.font = [UIFont fontWithName:@"Oxygen-Bold" size:self.font.pointSize];
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
