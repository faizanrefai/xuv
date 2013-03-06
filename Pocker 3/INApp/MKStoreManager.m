//
//  MKStoreManager.m
//
//  Created by Mugunth Kumar on 15-Nov-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//  mugunthkumar.com
//

#import "MKStoreManager.h"


@implementation MKStoreManager

@synthesize purchasableObjects;
@synthesize storeObserver;

//static NSString *ownServer = @"https://sandbox.itunes.apple.com/verifyReceipt";
static NSString *ownServer = nil;


@synthesize featureAId;

// all your features should be managed one and only by StoreManager
//static NSString *featureAId = @"com.openxcell.test.golftest";
//static NSString *featureAId = @"com.openxcell.test.inapp";
//static NSString *featureBId = @"com.SAR.comegetme.point";com.openxcell.test.inapp
//static NSString *featureCId = @"com.SAR.comegetme.point";

BOOL featureAPurchased;
BOOL featureBPurchased;
BOOL featureCPurchased;

static __weak id<MKStoreKitDelegate> _delegate;
static MKStoreManager* _sharedStoreManager; // self

- (void)dealloc {
	
	[_sharedStoreManager release];
	[storeObserver release];
	[super dealloc];
}

+ (id)delegate {
	
    return _delegate;
}

+ (void)setDelegate:(id)newDelegate {
    _delegate = newDelegate;	
}

+ (BOOL) featureAPurchased {
	
	return featureAPurchased;
}

+ (BOOL) featureBPurchased {
	
	return featureBPurchased;
}

+ (BOOL) featureCPurchased {
	
	return featureCPurchased;
}

+ (MKStoreManager*)sharedManager
{
	@synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            [[self alloc] init]; // assignment not done here
			_sharedStoreManager.purchasableObjects = [[NSMutableArray alloc] init];			
			[_sharedStoreManager requestProductData];
			
			NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];	
			
            featureAPurchased = [userDefaults boolForKey:_sharedStoreManager.featureAId]; 
			
            //featureBPurchased = [userDefaults boolForKey:featureBId]; 	
			//featureCPurchased = [userDefaults boolForKey:featureCId];
			
			_sharedStoreManager.storeObserver = [[MKStoreObserver alloc] init];
			[[SKPaymentQueue defaultQueue] addTransactionObserver:_sharedStoreManager.storeObserver];
        }
    }
    return _sharedStoreManager;
}


#pragma mark Singleton Methods

+ (id)allocWithZone:(NSZone *)zone

{	
    @synchronized(self) {
		
        if (_sharedStoreManager == nil) {
			
            _sharedStoreManager = [super allocWithZone:zone];			
            return _sharedStoreManager;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}


- (id)autorelease
{
    return self;	
}


- (void) requestProductData
{
	SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers:
                                 [NSSet setWithObjects:featureAId, nil]];
	request.delegate = self;
	[request start];
}


- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
	[purchasableObjects addObjectsFromArray:response.products];
	
    // populate UI
	
    NSLog(@"[purchasableObjects description]  %@",[purchasableObjects description]);
   
    NSLog(@"[purchasableObjects %@",purchasableObjects );
    
    if ([purchasableObjects count] == 0) {
		NSLog(@"Products invalid");
		
	}
	else {
		NSLog(@"Products Valid");
		NSLog(@"%i",[purchasableObjects count]);
	}
	for(int i=0;i<[purchasableObjects count];i++)
	{
		
		SKProduct *product = [purchasableObjects objectAtIndex:i];
		NSLog(@"Feature: %@, Cost: %f, ID: %@     [product description]: %@   [product priceLocale]:%@   ",[product localizedTitle],
			  [[product price] doubleValue], [product productIdentifier],[product localizedDescription],[(NSLocale*)[product priceLocale] localeIdentifier]);
	}
	
	[request autorelease];
}

- (void) buyFeatureB
{
	//[self buyFeature:featureBId];
}

- (void) buyFeatureC
{
	//[self buyFeature:featureCId];
}

- (void) buyFeature:(NSString*) featureId
{
	if([self canCurrentDeviceUseFeature: featureId])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MKStoreKit" message:@"You can use this feature for this session." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];
		
		[self provideContent:featureId shouldSerialize:NO];
		return;
	}
	
	if ([SKPaymentQueue canMakePayments])
	{
		SKPayment *payment = [SKPayment paymentWithProductIdentifier:featureId];
		[[SKPaymentQueue defaultQueue] addPayment:payment];
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MKStoreKit" message:@"You are not authorized to purchase from AppStore"
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];
	}
}

- (BOOL) canCurrentDeviceUseFeature: (NSString*) featureID
{
	NSString *uniqueID = [[UIDevice currentDevice] uniqueIdentifier];
	
    NSLog(@"%@",uniqueID);
    
    // check udid and featureid with developer's server
	
	if(ownServer == nil) return NO; // sanity check
	
	NSURL *url = [NSURL URLWithString:ownServer];
	
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url 
                                                              cachePolicy:NSURLRequestReloadIgnoringCacheData 
                                                          timeoutInterval:60];
	
	[theRequest setHTTPMethod:@"POST"];		
	[theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	
	NSString *postData = [NSString stringWithFormat:@"productid=%@&udid=%@", featureID, uniqueID];
	
	NSString *length = [NSString stringWithFormat:@"%d", [postData length]];	
	[theRequest setValue:length forHTTPHeaderField:@"Content-Length"];	
	
	[theRequest setHTTPBody:[postData dataUsingEncoding:NSASCIIStringEncoding]];
	
	NSHTTPURLResponse* urlResponse = nil;
	NSError *error = [[[NSError alloc] init] autorelease];  
	
	NSData *responseData = [NSURLConnection sendSynchronousRequest:theRequest
												 returningResponse:&urlResponse 
															 error:&error];  
	
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
	
    
    NSLog(@"%@",responseString);
    
	BOOL retVal = NO;
	if([responseString isEqualToString:@"YES"])		
	{
		retVal = YES;
	}
	
	[responseString release];
	return YES;
}

- (void) buyFeatureA
{
	[self buyFeature:featureAId];
}


- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
	NSString *messageToBeShown = [NSString stringWithFormat:@"Reason: %@, You can try: %@", [transaction.error localizedFailureReason], [transaction.error localizedRecoverySuggestion]];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to complete your purchase" message:messageToBeShown
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
	[alert release];
}

-(void) provideContent: (NSString*) productIdentifier shouldSerialize: (BOOL) serialize
{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	if([productIdentifier isEqualToString:featureAId])
	{
		featureAPurchased = YES;
		if(serialize)
		{
			if([_delegate respondsToSelector:@selector(productPurchased:)])
				[_delegate productPurchased:productIdentifier];
			
			[userDefaults setBool:featureAPurchased forKey:featureAId];		
		}
	}
	
	//if([productIdentifier isEqualToString:featureBId])
//	{
//		featureBPurchased = YES;
//		if(serialize)
//		{
//			if([_delegate respondsToSelector:@selector(productPurchased:)])
//				[_delegate productPurchased:productIdentifier];
//			
//			[userDefaults setBool:featureBPurchased forKey:featureBId];		
//		}
//	}
//	
//	if([productIdentifier isEqualToString:featureCId])
//	{
//		featureCPurchased = YES;
//		if(serialize)
//		{
//			if([_delegate respondsToSelector:@selector(productPurchased:)])
//				[_delegate productPurchased:productIdentifier];
//			
//			[userDefaults setBool:featureCPurchased forKey:featureCId];		
//		}
//	}
}

-(void)CompletTranscation:(NSString*)trans
{
	NSLog(@"hi");
	if([_delegate respondsToSelector:@selector(productPurchased:)])
		[_delegate productPurchased:trans];
}

@end
