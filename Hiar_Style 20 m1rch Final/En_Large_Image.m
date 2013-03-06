//
//  En_Large_Image.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "En_Large_Image.h"

#import "Client_History_More.h"

@implementation En_Large_Image

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(IBAction)mail:(id)sender
{	UIActionSheet *actionsheet = [[UIActionSheet alloc] 
								  initWithTitle:@""
								  delegate:self 
								  cancelButtonTitle:@"Cancel"
								  destructiveButtonTitle:nil 
								  otherButtonTitles:@"Email Photo",@"Assign to Contact", nil
								  ];
	[actionsheet showInView:[self view]];
	[actionsheet release];
	
	
	
	
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	////nslog(@"button %i clicked", buttonIndex );
	
	switch (buttonIndex) {
		case 0:
        {
            
            
            NSData * dataImg = UIImagePNGRepresentation(imgdisplay.image);
            
            StrImageCode3 =[[dataImg base64Encoding] retain];
            
            NSString *strimage13 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)StrImageCode3, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            

            
            NSString *post =[NSString stringWithFormat:@"name=%@&code=%@&mail_body=%@&subject=%@&to=%@",@
                             "Demo.png",strimage13,@"HairWorx",@"HairWorx",strEmail];
            
            
            [strimage13 release];
            
            
            NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
            
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
            [request setURL:[NSURL URLWithString:@"http://openxcellaus.info/HairStyle/mailwithatt.php"]];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSError *error;
            NSURLResponse *response;
            NSData *uData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            NSString *data=[[NSString alloc]initWithData:uData encoding:NSUTF8StringEncoding];
            //    
            NSMutableDictionary *temp = [data JSONValue];
            //    
            NSLog(@"%@",temp);
            [data release];
            
            
        }
            //nslog(@"Email Photo");
		
			
			break;
		case 1:
        {
			//nslog(@"Assign to Contact");
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *path2 = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
            
            if (sqlite3_open([path2 UTF8String], &database) == SQLITE_OK) 
            {
                int ia;
                ia=[objappdel.idvalue intValue];
                //nslog(@"%d",ia);
                
                static sqlite3_stmt *statement;
                statement = nil;
                
                NSString *sql=[NSString stringWithFormat:@"update AddClient set Image=? where Cid=%d",ia ];
                
                if(sqlite3_prepare_v2(database, [sql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
                {
                    
                    sqlite3_bind_text(statement, 1, [imageName UTF8String], -1, SQLITE_TRANSIENT);
                }
                else
                {
                    
                    NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
                }
                
                if(sqlite3_step(statement) == SQLITE_DONE) 
                {
                    sqlite3_finalize(statement);
                    
                    
                }
                else
                {
                    NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
                }
                sqlite3_close(database);
                
            }
            else 
            {
                sqlite3_close(database);
                NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
            }
        }
			break;
		case 2:
            
            
            
            
			//nslog(@"cacel");
			break;
		
				
		default:
			break;
	}
}


-(IBAction)next:(id)sender{
	//nslog(@"%d",[arrimages count]);
	i=i+1;
	

	if(i>=[arrimages count]){
		i=i-1;
		btnnext.enabled=FALSE;
        btnprev.enabled=TRUE;
        
	}
	else {
        
		[lblnum setText:[NSString stringWithFormat:@"%d",i+1]];
		
			NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"name"]];
        imageName=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"name"];
        
        Imageid=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"id"];
        
	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
	image = [[UIImage alloc] initWithData:imageData];
        [imgdisplay setImage:[self resizeImage:image width:imgdisplay.frame.size.width height:imgdisplay.frame.size.height]];
        
       // [imgdisplay setImage:image];
        
        
        [imageData release];
        [image release];
        
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            imgdisplay.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        else{
            
            imgdisplay.transform=CGAffineTransformMakeRotation(M_PI * 2 );
            
            
        }
        
        
        image=nil;
 
               
    }
}

-(IBAction)delete_image:(id)sender{
    if(i>=[arrimages count]){
    }else{
    NSString *filename2;
    filename2=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"name"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:filename2];
    
    [fileManager removeItemAtPath: fullPath error:NULL];
    
    //nslog(@"image removed");
    [objdatabase DeleteData:@"Image" :@"IID" :Imageid];
        
        [self viewWillAppear:YES];
        
        
        
        
    }
    
}
-(IBAction)prev:(id)sender{
			if(i<=0){
				i=i+1;
                btnprev.enabled=FALSE;
                btnnext.enabled=TRUE;
                
			}
			else {
				i=i-1;
				 
				[lblnum setText:[NSString stringWithFormat:@"%d",i+1]];
                imageName=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"name"];
                
		
			NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"name"]];
	
                Imageid=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"id"];
                
                
                
                
	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
	image = [[UIImage alloc] initWithData:imageData];
                [imgdisplay setImage:[self resizeImage:image width:imgdisplay.frame.size.width height:imgdisplay.frame.size.height]];
               // [imgdisplay setImage:image];
                
                [imageData release];
                [image release];
                
                if(image.imageOrientation==UIImageOrientationRight)
                {
                    
                    imgdisplay.transform=CGAffineTransformMakeRotation(M_PI / 2);
                    
                    
                    
                }
                
                else{
                    
                    imgdisplay.transform=CGAffineTransformMakeRotation(M_PI * 2 );
                    
                    
                }
                
                image=nil;

            
            }
}
-(IBAction)back{

	
    [objappdel.enlargeimage dismissModalViewControllerAnimated:YES];
    
    
    //objappdel.window.rootViewController = objappdel.tabmainsub;
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.title=@"EnLarge Image";
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	UIBarButtonItem *barBtnSearch = [[UIBarButtonItem alloc] initWithTitle:@"Option" style:UIBarButtonItemStyleBordered target:self action:@selector(mail:)];
	self.navigationController.navigationBar.hidden=TRUE;
	objdatabase=[[DataBase alloc]init];
    arrimages=[[NSMutableArray alloc]init];
    i=0;
    
	
	self.navigationItem.rightBarButtonItem = barBtnSearch;
	self.navigationItem.rightBarButtonItem.enabled = YES;
	objappdel =(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	//[objappdel createEditableCopyOfDatabaseIfNeeded];
	[self showimage];
	
	if([arrimages count]==0){
        
        btnprev.enabled=FALSE;
        btnnext.enabled=FALSE;
        
         [imgdisplay setImage:nil];
        
        
	}
	else {
		
        
        NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
  path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrimages objectAtIndex:0]valueForKey:@"name"]];
  
        Imageid=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"id"];
        imageName=[(NSDictionary *)[arrimages objectAtIndex:i]valueForKey:@"name"];
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
        image = [[UIImage alloc] initWithData:imageData];
       
        [imgdisplay setImage:[self resizeImage:image width:imgdisplay.frame.size.width height:imgdisplay.frame.size.height]];
        

        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            imgdisplay.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        else{
        
            imgdisplay.transform=CGAffineTransformMakeRotation(M_PI * 2 );
            
        
        }
        
//        [imgdisplay setImage:image];
        
        
        lblnum.text=@"1";
        [lblcount setText:[NSString stringWithFormat:@"%d",[arrimages count]]];
        [imageData release];
        [image release];
        

        image=nil;
        
    
    }
    
	

}


-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height {
	
	CGImageRef imageRef;
    imageRef= [image3 CGImage];
	CGImageAlphaInfo alphaInfo;
    
    alphaInfo= CGImageGetAlphaInfo(imageRef);
	
	//if (alphaInfo == kCGImageAlphaNone)
    alphaInfo = kCGImageAlphaNoneSkipLast;
	
	CGContextRef bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), 4 * width, CGImageGetColorSpace(imageRef), alphaInfo);
	CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	}

-(void)showimage{
    
    
    
    NSString *s2 = [NSString stringWithFormat:@"where CID=%@ and Date='%@'",objappdel.idvalue,objappdel.strdate];
    
    [objdatabase ShowDataForImage:s2]; 
    [arrimages addObjectsFromArray:objdatabase.catchArray];
    
    NSString *s = [NSString stringWithFormat:@"WHERE Cid=%@",objappdel.idvalue];
	[objdatabase ShowDataForClientname:s];
 strEmail=[[objdatabase.catchArray objectAtIndex:0]valueForKey:@"email"];
    
    
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
    [objdatabase release];
    
   [arrimages release];
	
	

}


@end
