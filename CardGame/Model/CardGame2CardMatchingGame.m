//
//  CardGame2CardMatchingGame.m
//  CardGame
//
//  Created by Satish Asok on 7/14/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "CardGame2CardMatchingGame.h"
#import "Card.h"
#import "CardDeck.h"

@interface CardGame2CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) NSInteger flipCount;

@property (nonatomic, strong) NSMutableArray *cards; // array of Card

@end


@implementation CardGame2CardMatchingGame

static NSInteger MISMATCH_PENALTY = 2;
static NSInteger MATCH_BONUS = 4;
static NSInteger FLIP_COST = 1;

- (id)initWithCards:(NSInteger)cardCount usingDeck:(CardDeck *)cardDeck
{
    self = [super init];
    
    if (self) {
        _score = 0;
        _flipCount = 0;
        
        for (int i = 0; i < cardCount; i++) {
            Card * card = [cardDeck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            
        }
    }
    
    return self;
}

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (Card *)cardAtIndex:(NSInteger)index
{
    return ((index >= 0 && index < self.cards.count) ? self.cards[index] : nil);
}

- (void)chooseCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match with other card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    NSInteger matchScore = [card matchWithCards:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += (matchScore * MATCH_BONUS);
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
            self.flipCount++;
            card.chosen = YES;
        }
    }
}

@end
