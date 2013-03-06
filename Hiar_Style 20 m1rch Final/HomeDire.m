//
//  HomeDire.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeDire.h"

#import "Client_Relation.h"
#import "SettingHome.h"
#import "Edit_Directory.h"
#import "Hiar_Style_NewAppDelegate.h"
#import "ReportHomeScreen.h"
#import "Client_History.h"
#import "Service_Listing.h"

@implementation HomeDire
@synthesize navi;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)seacrhDate:(NSString *)StrsearchValue    
{
//    [arrlistname release];
//    [arrayOfCharacters release];
//    
    
    SearchTag=1;
    
    arrayOfCharacters = [[NSMutableArray alloc]init];
    
    objectsForCharacters = [[NSMutableDictionary alloc]init];
	
    arrlistname=[[NSMutableArray alloc]init];
    NSMutableString *query;
    
    query = [NSMutableString stringWithFormat:@"where First_Name LIKE '%@",StrsearchValue];
    
    [query appendString:@"%'"];
	
    
	[objdatabase ShowDataForClientname:query];
    
    
    [arrlistname addObject:objdatabase.catchArray];
    if([[arrlistname objectAtIndex:0] count] >0)
        
    {
        
        [arrayOfCharacters addObject:[NSString stringWithFormat:@"%c",StrsearchValue]];
        
        [objectsForCharacters setObject:arrlistname  forKey:[NSString stringWithFormat:@"%c",StrsearchValue]];
        
    }
    [arrlistname release];
    [tblDire reloadData];


}

-(void)showdata
{
    SearchTag=0;
    
    arrayOfCharacters = [[NSMutableArray alloc]init];
    
    objectsForCharacters = [[NSMutableDictionary alloc]init];
	
    for(char c='A';c<='Z';c++)
        
    {
        arrlistname=[[NSMutableArray alloc]init];
    NSMutableString *query;
    
    query = [NSMutableString stringWithFormat:@"where First_Name LIKE '%c",c];
    
    [query appendString:@"%'"];
	
    
	[objdatabase ShowDataForClientname:query];
        
        
        [arrlistname addObject:objdatabase.catchArray];
       
        if([[arrlistname objectAtIndex:0] count] >0)
            
        {

            [arrayOfCharacters addObject:[NSString stringWithFormat:@"%c",c]];
         
            
           
            [objectsForCharacters setObject:arrlistname  forKey:[NSString stringWithFormat:@"%c",c]];
            
            
            
            
        }
        [arrlistname release];
        
    }
    
    
    if([objectsForCharacters count]>0)
         
    {
    
        [tblDire reloadData];
        BtnPre.enabled=TRUE;
        
    }
    else{
    
        BtnPre.enabled=FALSE;
        
    
    }
    
    
	//[arrlistname addObjectsFromArray:objdatabase.catchArray];
    
	
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText  {

    [self seacrhDate:search.text];

}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar

{
    
    // only show the status bar’s cancel button while in edit mode
    
    
    
    
    
    search.showsCancelButton = YES;
    
    search.autocorrectionType = UITextAutocorrectionTypeNo;
    
    // flush the previous search content
    
   // [arrlistname removeAllObjects];
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar

{
    
    search.showsCancelButton = NO;
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [arrayOfCharacters count];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [search resignFirstResponder];
    search.text=@"";
    
    [self showdata];
    
    
    

}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:section]] objectAtIndex:0] count];
    
    
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [search resignFirstResponder];
    return YES;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   {

    return 40;
    
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
  // UIImageView *cellImg = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,300, 40)] autorelease];
    //[cellImg setImage:[UIImage imageNamed:@"DireCellImage.png"]];
    
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
      //  [cell.contentView addSubview:cellImg];  
        
    }
	
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
   // cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    //cell.textLabel.text=@"kartik";
    
   // NSLog(@"Array %@",[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] objectAtIndex:0] valueForKey:@"name"]);
    
    cell.textLabel.font=  [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
           
    
	cell.textLabel.text=[NSString stringWithFormat:@"%@",[[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] objectAtIndex:0] valueForKey:@"name"] objectAtIndex:indexPath.row]];
    
                         
    //[(NSDictionary *)[arrlistname objectAtIndex:indexPath.row]valueForKey:@"name"];
	// Configure the cell.
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	objappdel.idvalue=[NSString stringWithFormat:@"%@",[[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] objectAtIndex:0] valueForKey:@"id"] objectAtIndex:indexPath.row]];
	objappdel.strclientname=[NSString stringWithFormat:@"%@ %@",[[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] objectAtIndex:0] valueForKey:@"name"] objectAtIndex:indexPath.row],[[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] objectAtIndex:0] valueForKey:@"lname"] objectAtIndex:indexPath.row]];
      
    
    // objappdel.window.rootViewController = objappdel.tabmainsub;
    
//    objcontact=[[ContactDetail alloc]initWithNibName:@"ContactDetail" bundle:nil];
//    
    [self.navigationController pushViewController:objappdel.tabmainsub animated:YES];
    
    
    
    
  }
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
    if([objectsForCharacters count]==0)
    {
    }
    else{
    for(char c = 'A';c<='Z';c++)
        
        [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
    }
    
  //  NSLog(@"Header %@",toBeReturned);
    
    return toBeReturned;
    
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    NSInteger count = 0;
    
    for(NSString *character in arrayOfCharacters)
        
    {
        
        if([character isEqualToString:title])
            
            return count;
        
        count ++;
        
    }
    
    return 0;// in case of some eror donot crash d application
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(SearchTag==1)
    {
        return @"Search Result";
        
        
    }
    else{
    if([arrayOfCharacters count]==0)
        
        return @"";
        
        return [arrayOfCharacters objectAtIndex:section];
    }
}
        

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
//	self.title=@"Client Directory";
	
    //objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    //[objappdel createEditableCopyOfDatabaseIfNeeded];
	//[objappdel.window addSubview:objappdel.tabmain.view];
    
	//[self showdata];

	self.navigationController.navigationBar.hidden=TRUE;
    
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	
  //  tblDire.backgroundColor=[UIColor clearColor];
	tblDire.scrollEnabled=TRUE;
	[tblDire reloadData];
	
	
	BtnPre = [UIButton buttonWithType:UIButtonTypeCustom];
	[BtnPre addTarget:self action:@selector(ButtonPressed1:) forControlEvents:UIControlEventTouchUpInside];
	//BtnPre.titleLabel.text=@"Edit";
	
	//[BtnPre setTitle:@"Edit" forState:UIControlStateNormal];
	//BtnPre.backgroundColor=[UIColor lightGrayColor];
	
	[BtnPre setImage:[UIImage imageNamed:@"editbarbutton.png"] forState:UIControlStateNormal];
	
	BtnPre.frame = CGRectMake(220, 7, 50, 30);
	[self.navi addSubview:BtnPre];
		
//	BtnNxt = [UIButton buttonWithType:UIButtonTypeCustom];
//	[BtnNxt addTarget:self action:@selector(searchResult1_clicked:) forControlEvents:UIControlEventTouchUpInside];
//	
//    
//	[BtnNxt setImage:[UIImage imageNamed:@"settingbtn.png"] forState:UIControlStateNormal];
//	
//	BtnNxt.frame = CGRectMake(60, 7, 60, 33);
//	[self.navi addSubview:BtnNxt];
//      
    
  //  navi.items.accessibilityLabel=@"Direcotry";
    

		
}
-(IBAction)back{

    [self.navigationController popViewControllerAnimated:YES];
    

}

-(IBAction)searchResult1_clicked:(id)sender
{
	
    if(objSetting)
    {
    
        [objSetting release];
        
    }
    
	objSetting=[[SettingHome alloc] initWithNibName:@"SettingHome" bundle:nil];
    
	[self.navigationController pushViewController:objSetting animated:YES];
    	
//    [self.navigationController popViewControllerAnimated:YES];

}

-(void) viewWillAppear:(BOOL)animated{
	BtnPre.hidden=FALSE;
	BtnNxt.hidden=FALSE;
    self.navigationController.navigationBarHidden=TRUE;
    
    
    
    objdatabase =[[DataBase alloc]init];
    
    
	objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    //[objappdel createEditableCopyOfDatabaseIfNeeded];
	//[objappdel.window addSubview:objappdel.tabmain.view];
    
	[self showdata];
    
    	
}


- (void)viewDidDisappear:(BOOL)animated; 
{
	
	BtnPre.hidden=TRUE;
	BtnNxt.hidden=TRUE;
	
	
	
	
	
	
}	

-(IBAction)ButtonPressed1:(id)sender
{
    
    
    if(objEdit_Directory)
    {
        
        [objEdit_Directory release];
        
    }
    objEdit_Directory=[[Edit_Directory alloc]initWithNibName:@"Edit_Directory" bundle:nil];
    [self.navigationController pushViewController:objEdit_Directory animated:YES];
    
    
}
-(IBAction)ButtonPressed:(id)sender
{
	
		
//		NewContact *obj=[[NewContact alloc]init];
//		[self.view addSubview:obj.view];
//		
    if(objNewContact)
    
    
    {
    
        [objNewContact release];
        
    }
		
	objNewContact=[[NewContact alloc] initWithNibName:@"NewContact" bundle:nil];
    
	[self.navigationController presentModalViewController:objNewContact animated:YES];
    
	
    
	
	
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
	BtnNxt.hidden=TRUE;
	BtnPre.hidden=TRUE;
	

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
    
	[arrlistname release];
	[objdatabase release];
    
    

}


@end
