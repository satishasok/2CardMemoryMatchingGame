//
//  CardDeck.m
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "CardDeck.h"
#import "Card.h"

@interface CardDeck ()

@property (nonatomic, strong)  NSMutableArray *cards;

@end

@implementation CardDeck

@synthesize cards=_cards;
- (NSMutableArray *)cards
{
    if (_cards == nil) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void)addCard:(Card *)card
{
    [self addCard:card onTop:NO];
}

- (void)addCard:(Card *)card onTop:(BOOL)onTop
{
    if (onTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    if (self.cards.count == 0 ) {
        return randomCard;
    }
    
    NSUInteger randomIndex = arc4random()%self.cards.count;
    
    randomCard = self.cards[randomIndex];
    [self.cards removeObjectAtIndex:randomIndex];
    
    return randomCard;
}

@end
