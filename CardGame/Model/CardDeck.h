//
//  CardDeck.h
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface CardDeck : NSObject

- (void)addCard:(Card *)card;
- (void)addCard:(Card *)card onTop:(BOOL)onTop;

- (Card *)drawRandomCard;

@end
