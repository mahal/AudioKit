//
//  CSDInstrument.m
//
//  Created by Aurelius Prochazka on 4/11/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "CSDInstrument.h"
#import "CSDOrchestra.h"
//
@implementation CSDInstrument
@synthesize orchestra;
@synthesize finalOutput;
@synthesize csdRepresentation;
@synthesize continuousParamList;

-(void) joinOrchestra:(CSDOrchestra *) newOrchestra {
    orchestra = newOrchestra;
    [newOrchestra addInstrument:self];
}

-(id) initWithOrchestra:(CSDOrchestra *) newOrchestra {
    self = [super init];
    if (self) {
        [self joinOrchestra:newOrchestra];
        
        continuousParamList = [[NSMutableArray alloc] init ];
        csdRepresentation = [NSMutableString stringWithString:@""]; 
    }
    return self; 
}

-(void) addOpcode:(CSDOpcode *)newOpcode {
    [csdRepresentation appendString:[newOpcode convertToCsd]];
}

-(void)addFunctionTable:(CSDFunctionTable *)newFunctionTable
{
    [csdRepresentation appendString:[newFunctionTable text]];
}

-(void)addContinuous:(CSDContinuous *)continuous 
{
    [csdRepresentation appendString:[continuous convertToCsd]];
    //where I want to update csound's valuesCache array
    //[[CSDManager sharedCSDManager] addContinuous:continuous];
    [continuousParamList addObject:continuous];
}

@end
