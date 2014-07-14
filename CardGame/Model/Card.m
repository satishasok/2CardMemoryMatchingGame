//
//  Card.m
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSInteger)matchWithCards:(NSArray *)otherCards
{
    NSInteger score = 0;
    for (id item in otherCards)
    {
        if ([item isKindOfClass:[Card class]])
        {
            Card *card = (Card *)item;
            if ([self.contents isEqualToString:card.contents]) {
                score++;
            }
        }
    }
    
    return score;
}

@end
