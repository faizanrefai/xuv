//
//  StoreManager.h
//  MKSync
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 MK Inc. All rights reserved.
//  mugunthkumar.com

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MKStoreObserver.h"

@protocol MKStoreKitDelegate <NSObject>
@optional
- (void)productPurchased:(NSString *)productId;
@end

@interface MKStoreManager : NSObject<SKProductsRequestDelegate> {
	
	NSMutableArray *purchasableObjects;
	MKStoreObserver *storeObserver;	
	
}

@property (nonatomic, retain) NSMutableArray *purchasableObjects;
@property (nonatomic, retain) MKStoreObserver *storeObserver;



- (void) requestProductData;

- (BOOL) canCurrentDeviceUseFeature: (NSString*) featureID;
- (void) buyFeatureA; // expose product buying functions, do not expose
- (void) buyFeatureB; // your product ids. This will minimize changes when you change product ids later
- (void) buyFeatureC;

// do not call this directly. This is like a private method
- (void) buyFeature:(NSString*) featureId;

- (void) failedTransaction: (SKPaymentTransaction *)transaction;
-(void) provideContent: (NSString*) productIdentifier shouldSerialize: (BOOL) serialize;

+ (MKStoreManager*)sharedManager;

+ (BOOL) featureAPurchased;
+ (BOOL) featureBPurchased;
+ (BOOL) featureCPurchased;

//DELEGATES
+(id)delegate;	
+(void)setDelegate:(id)newDelegate;

@property (nonatomic,retain)NSString *featureAId;


-(void)CompletTranscation:(NSString*)trans;

@end
