//
//  UITintedButton.m
//  Classes
//
//  Created by Marcel Ruegenberg on 05.08.13.
//  Copyright (c) 2013 Dustlab. All rights reserved.
//

#import "UIRoundedTintedButton.h"
#import "UIKit+DrawingHelpers.h"
#import "UIColor+DLHelperAdditions.h"
#import "DLVersionCheck.h"

@implementation UIRoundedTintedButton

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        if(majorOSVersion() >= 7) {
            [self setBackgroundImage:nil forState:UIControlStateNormal];
            self.titleLabel.shadowOffset = CGSizeZero;
            [self setTitleShadowColor:[UIColor clearColor] forState:UIControlStateNormal];
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if(majorOSVersion() >= 7) {
        CGContextRef c = UIGraphicsGetCurrentContext();
        
        CGRect r = self.bounds;
        r.origin.x += 0.5;
        r.origin.y += 0.5;
        r.size.width -= 1;
        r.size.height -= 1;
        if(self.state == UIControlStateHighlighted) {
            [self.tintColor setFill];
            CGContextFillRoundedRect(c, r, 7);
            CGContextSetBlendMode(c, kCGBlendModeClear);
            if ([self.titleLabel.text respondsToSelector:@selector(drawWithRect:options:attributes:context:)]) {
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode = self.titleLabel.lineBreakMode;
                paragraphStyle.alignment = self.titleLabel.textAlignment;
                NSDictionary *attributes = @{NSFontAttributeName: self.titleLabel.font,
                                             NSParagraphStyleAttributeName: [paragraphStyle copy]
                                             };
                [self.titleLabel.text drawWithRect:self.titleLabel.frame
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:attributes
                                           context:[[NSStringDrawingContext alloc] init]];
            } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                [self.titleLabel.text drawInRect:self.titleLabel.frame
                                        withFont:self.titleLabel.font
                                   lineBreakMode:self.titleLabel.lineBreakMode
                                       alignment:self.titleLabel.textAlignment];
#pragma clang diagnostic pop
            }
            self.titleLabel.hidden = YES;
        }
        else {
            [self.tintColor setStroke];
            CGContextSetLineWidth(c, 1);
            CGContextStrokeRoundedRect(c, r, 7);
            self.titleLabel.hidden = NO;
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if(majorOSVersion() >= 7)
        [self setNeedsDisplay];
}

- (void)tintColorDidChange {
    UIColor *tintColor = [self titleColorForState:UIControlStateNormal];
    if([self respondsToSelector:@selector(tintColor)]) {
        tintColor = [self tintColor];
    }
    [self setTitleColor:tintColor forState:UIControlStateNormal];
    // [self setTitleColor:[tintColor colorMultipliedByScalar:0.9] forState:UIControlStateHighlighted];
    
}

@end
