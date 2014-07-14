//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank=1; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *playingCard = [[PlayingCard alloc] initWithRank:rank suit:suit];
                [self addCard:playingCard onTop:YES];
            }
        }
    }
    
    return self;
}

@end
