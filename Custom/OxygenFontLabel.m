//
//  OxygenFontLabel.m
//  Car Insurance
//
//  Created by Dheina Lundi A on 06/05/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "OxygenFontLabel.h"

@implementation OxygenFontLabel

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
    self.font = [UIFont fontWithName:@"Oxygen" size:self.font.pointSize];
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
