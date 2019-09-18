
/*
 * MIT License
 *
 * Copyright (c) 2019 Mateusz Zych
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice
 * shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS",
 * WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 *
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <Foo.h>

@implementation Foo

@synthesize x;
@synthesize y = _y;

- (void) setY : (NSString*) paramY
{
    self->_y = paramY;
    self->_z = paramY.length;
}

- (id) initWithX : (float) paramX AndY : (NSString*) paramY
{
    //
    // [Apple Developer] - NSObject init
    // ~ https://developer.apple.com/documentation/objectivec/nsobject/1418641-init?language=objc
    //
    self = [super init];

    //
    // [Apple Developer] - nil
    // ~ https://developer.apple.com/documentation/objectivec/nil-2gl?language=objc
    //
    if (self != nil)
    {
        self.x = paramX;
        self.y = paramY;
    }

    return self;
}

- (void) Print
{
    //
    // [Apple Developer] - NSLog
    // ~ https://developer.apple.com/documentation/foundation/1395275-nslog
    //
    NSLog(@"[Foo] Bar { x = %f, y = %@, _z = %d } \n", self.x, self.y, self->_z);
}

@end
