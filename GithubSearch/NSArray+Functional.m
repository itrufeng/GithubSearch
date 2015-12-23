/*

Copyright (c) 2012 Mikkel Gravgaard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

#import "NSArray+Functional.h"
@implementation NSArray (Functional)
// from http://stackoverflow.com/a/2878858/202538

+ (NSArray*)arrayByRepeatingObject:(id)obj times:(NSUInteger)t {
  id arr[t];
  for(NSUInteger i=0; i<t; ++i)
    arr[i] = obj;
  return [NSArray arrayWithObjects:arr count:t];
}

+ (NSArray *)arrayWithRange:(NSUInteger)rangeLength {
  id arr[rangeLength];
  for(NSUInteger i=0; i<rangeLength; ++i)
    arr[i] = @(i);
  return [NSArray arrayWithObjects:arr count:rangeLength];
}


- (NSArray *)mapUsingBlock:(MapBlock )block{
  NSMutableArray *a = [NSMutableArray arrayWithCapacity:[self count]];
  for(id o in self){
    [a addObject:block(o)];
  }
  return a;
}

- (NSArray *)mapWithIndexUsingBlock:(MapWithIndexBlock)block{
  NSMutableArray *a = [NSMutableArray arrayWithCapacity:[self count]];
  NSUInteger idx=0;
  for(id o in self){
    [a addObject:block(o,idx)];
    idx++;
  }
  return a;
}

- (NSArray *)filterUsingBlock:(FilterBlock)block {
  NSIndexSet *indexSet = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
    return block(obj);
  }];
  return [self objectsAtIndexes:indexSet];
}

- (void)applyBlock:(ApplyBlock)block {
  [self reduceUsingBlock:^id(id a, id o) {
    block(o);
    return nil;
  } initialAggregation:nil];
}

- (id)reduceUsingBlock:(ReduceBlock)block initialAggregation:(id)initialAggregation {
  id aggregation = initialAggregation;
  for (id o in self){
    aggregation = block(aggregation,o);
  }
  return aggregation;
}
@end
