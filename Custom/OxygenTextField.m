//
//  OxygenTextField.m
//  Car Insurance
//
//  Created by Dheina Lundi A on 06/05/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "OxygenTextField.h"
#import "ColorUtilities.h"

@implementation OxygenTextField

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
    
    if ([self.attributedPlaceholder length])
    {
        // Extract attributes
        NSDictionary * attributes = (NSMutableDictionary *)[ (NSAttributedString *)self.attributedPlaceholder attributesAtIndex:0 effectiveRange:NULL];
        
        NSMutableDictionary * newAttributes = [[NSMutableDictionary alloc] initWithDictionary:attributes];
        
        [newAttributes setObject:[ColorUtilities colorWithHexString:@"92a1b3"] forKey:NSForegroundColorAttributeName];
        
        // Set new text with extracted attributes
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[self.attributedPlaceholder string] attributes:newAttributes];
        
    }
}

//-(void)drawPlaceholderInRect:(CGRect)rect
//{
//    [[UIColor blueColor] setFill];
//    [[self placeholder] drawInRect:rect withFont:[UIFont fontWithName:@"Oxygen" size:self.font.pointSize]];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
