/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import "JRCaptureObject+Internal.h"
#import "JROinoinoL2Object.h"

@interface JROinoinoL3Object (JROinoinoL3Object_InternalMethods)
+ (id)oinoinoL3ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToOinoinoL3Object:(JROinoinoL3Object *)otherOinoinoL3Object;
@end

@interface JROinoinoL2Object ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JROinoinoL2Object
{
    NSString *_string1;
    NSString *_string2;
    JROinoinoL3Object *_oinoinoL3Object;
}
@synthesize canBeUpdatedOnCapture;

- (NSString *)string1
{
    return _string1;
}

- (void)setString1:(NSString *)newString1
{
    [self.dirtyPropertySet addObject:@"string1"];
    _string1 = [newString1 copy];
}

- (NSString *)string2
{
    return _string2;
}

- (void)setString2:(NSString *)newString2
{
    [self.dirtyPropertySet addObject:@"string2"];
    _string2 = [newString2 copy];
}

- (JROinoinoL3Object *)oinoinoL3Object
{
    return _oinoinoL3Object;
}

- (void)setOinoinoL3Object:(JROinoinoL3Object *)newOinoinoL3Object
{
    [self.dirtyPropertySet addObject:@"oinoinoL3Object"];
    _oinoinoL3Object = newOinoinoL3Object;

    [_oinoinoL3Object setAllPropertiesToDirty];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/oinoinoL1Object/oinoinoL2Object";
        self.canBeUpdatedOnCapture = YES;

        _oinoinoL3Object = [[JROinoinoL3Object alloc] init];

        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)oinoinoL2Object
{
    return [[JROinoinoL2Object alloc] init];
}

- (NSDictionary*)toDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null])
                   forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null])
                   forKey:@"string2"];
    [dictionary setObject:(self.oinoinoL3Object ? [self.oinoinoL3Object toDictionaryForEncoder:forEncoder] : [NSNull null])
                   forKey:@"oinoinoL3Object"];

    if (forEncoder)
    {
        [dictionary setObject:([self.dirtyPropertySet allObjects] ? [self.dirtyPropertySet allObjects] : [NSArray array])
                       forKey:@"dirtyPropertiesSet"];
        [dictionary setObject:(self.captureObjectPath ? self.captureObjectPath : [NSNull null])
                       forKey:@"captureObjectPath"];
        [dictionary setObject:[NSNumber numberWithBool:self.canBeUpdatedOnCapture] 
                       forKey:@"canBeUpdatedOnCapture"];
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

+ (id)oinoinoL2ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JROinoinoL2Object *oinoinoL2Object = [JROinoinoL2Object oinoinoL2Object];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        oinoinoL2Object.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
    }

    oinoinoL2Object.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    oinoinoL2Object.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    oinoinoL2Object.oinoinoL3Object =
        [dictionary objectForKey:@"oinoinoL3Object"] != [NSNull null] ? 
        [JROinoinoL3Object oinoinoL3ObjectObjectFromDictionary:[dictionary objectForKey:@"oinoinoL3Object"] withPath:oinoinoL2Object.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [oinoinoL2Object.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [oinoinoL2Object.dirtyPropertySet removeAllObjects];
    
    return oinoinoL2Object;
}

+ (id)oinoinoL2ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JROinoinoL2Object oinoinoL2ObjectObjectFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    if (![dictionary objectForKey:@"oinoinoL3Object"] || [dictionary objectForKey:@"oinoinoL3Object"] == [NSNull null])
        self.oinoinoL3Object = nil;
    else if (!self.oinoinoL3Object)
        self.oinoinoL3Object = [JROinoinoL3Object oinoinoL3ObjectObjectFromDictionary:[dictionary objectForKey:@"oinoinoL3Object"] withPath:self.captureObjectPath fromDecoder:NO];
    else
        [self.oinoinoL3Object replaceFromDictionary:[dictionary objectForKey:@"oinoinoL3Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSSet *)updatablePropertySet
{
    return [NSSet setWithObjects:@"string1", @"string2", @"oinoinoL3Object", nil];
}

- (void)setAllPropertiesToDirty
{
    [self.dirtyPropertySet addObjectsFromArray:[[self updatablePropertySet] allObjects]];

}

- (NSDictionary *)snapshotDictionaryFromDirtyPropertySet
{
    NSMutableDictionary *snapshotDictionary =
             [NSMutableDictionary dictionaryWithCapacity:10];

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"oinoinoL2Object"];

    if (self.oinoinoL3Object)
        [snapshotDictionary setObject:[self.oinoinoL3Object snapshotDictionaryFromDirtyPropertySet]
                               forKey:@"oinoinoL3Object"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"oinoinoL2Object"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"oinoinoL2Object"] allObjects]];

    if ([snapshotDictionary objectForKey:@"oinoinoL3Object"])
        [self.oinoinoL3Object restoreDirtyPropertiesFromSnapshotDictionary:
                    [snapshotDictionary objectForKey:@"oinoinoL3Object"]];

}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dictionary setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dictionary setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    if ([self.dirtyPropertySet containsObject:@"oinoinoL3Object"])
        [dictionary setObject:(self.oinoinoL3Object ?
                              [self.oinoinoL3Object toUpdateDictionary] :
                              [[JROinoinoL3Object oinoinoL3Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                       forKey:@"oinoinoL3Object"];
    else if ([self.oinoinoL3Object needsUpdate])
        [dictionary setObject:[self.oinoinoL3Object toUpdateDictionary]
                       forKey:@"oinoinoL3Object"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)updateOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context
{
    [super updateOnCaptureForDelegate:delegate context:context];
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    [dictionary setObject:(self.oinoinoL3Object ?
                          [self.oinoinoL3Object toReplaceDictionary] :
                          [[JROinoinoL3Object oinoinoL3Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                   forKey:@"oinoinoL3Object"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    if ([self.oinoinoL3Object needsUpdate])
        return YES;

    return NO;
}

- (BOOL)isEqualToOinoinoL2Object:(JROinoinoL2Object *)otherOinoinoL2Object
{
    if (!self.string1 && !otherOinoinoL2Object.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherOinoinoL2Object.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherOinoinoL2Object.string1]) return NO;

    if (!self.string2 && !otherOinoinoL2Object.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherOinoinoL2Object.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherOinoinoL2Object.string2]) return NO;

    if (!self.oinoinoL3Object && !otherOinoinoL2Object.oinoinoL3Object) /* Keep going... */;
    else if (!self.oinoinoL3Object && [otherOinoinoL2Object.oinoinoL3Object isEqualToOinoinoL3Object:[JROinoinoL3Object oinoinoL3Object]]) /* Keep going... */;
    else if (!otherOinoinoL2Object.oinoinoL3Object && [self.oinoinoL3Object isEqualToOinoinoL3Object:[JROinoinoL3Object oinoinoL3Object]]) /* Keep going... */;
    else if (![self.oinoinoL3Object isEqualToOinoinoL3Object:otherOinoinoL2Object.oinoinoL3Object]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"string1"];
    [dictionary setObject:@"NSString" forKey:@"string2"];
    [dictionary setObject:@"JROinoinoL3Object" forKey:@"oinoinoL3Object"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)dealloc
{
}
@end
