//
//  CardGame2CardMatchingGame.h
//  CardGame
//
//  Created by Satish Asok on 7/14/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CardDeck;
@class Card;

@interface CardGame2CardMatchingGame : NSObject

- (id)initWithCards:(NSInteger)cardCount usingDeck:(CardDeck *)cardDeck;

- (Card *)cardAtIndex:(NSInteger)index;
- (void)chooseCardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger flipCount;

@end
