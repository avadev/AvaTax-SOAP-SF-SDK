// Regression Test Harness
public class RegressionTestController
{
    public String SvcURL {get;set;}
    public String UserName {get;set;}
    public String PassWord {get;set;}
    public String CompCode {get;set;}
    public String AddrCount {get; set;}
    public String AddrFailList {get; set;}
    public String AOutput {get; set;}
    public String TOutput {get; set;}
 
    public RegressionTestController() 
    {
    }

    public PageReference RunTests()
    {
    	AOutput='';
    	TOutput='';
        AddressSvc.AddressSvcSoap addressSvc = new AddressSvc.AddressSvcSoap(SvcURL);
        addressSvc.Security.UsernameToken.Username = UserName;
        addressSvc.Security.UsernameToken.Password = PassWord;
        addressSvc.Profile = new AddressSvc.Profile();
        addressSvc.Profile.Client = 'RegressionTestHarness,1,0';

        TaxSvc.TaxSvcSoap taxSvc = new TaxSvc.TaxSvcSoap(SvcURL);
        taxSvc.Security = new TaxSvc.Security();
        taxSvc.Security.UsernameToken.Username = UserName;
        taxSvc.Security.UsernameToken.Password = PassWord;
        taxSvc.Profile = new TaxSvc.Profile();
        taxSvc.Profile.Client = 'SFDemo,1,0';

		//AdjustTaxResult
        TaxSvc.GetTaxRequest gtr = new TaxSvc.GetTaxRequest();
        TaxSvc.AdjustTaxRequest adjres = new TaxSvc.AdjustTaxRequest();
        adjres.AdjustmentReason = 4;        
        adjres.GetTaxRequest = gtr;
         TaxSvc.AdjustTaxResult gtre = null;
                      
              try
               {                
                   gtre = taxSvc.AdjustTax(adjres);
               }
              catch(Exception ex)
              {
              
              }
       
            gtre = new TaxSvc.AdjustTaxResult();
           
                gtre.ResultCode = 'Success';
            
              //  gtre.ResultCode = 'Error';
                gtre.Messages = new TaxSvc.ArrayOfMessage();
                gtre.Messages.Message = new TaxSvc.Message[1];
                gtre.Messages.Message[0] = new TaxSvc.Message();
                gtre.Messages.Message[0].Name = 'Test Error Message';
                gtre.Messages.Message[0].Summary = 'Test Error Message Summary';
                gtre.Messages.Message[0].Details = 'Test Error Message Details';
                
            
              if(gtre.ResultCode != 'Success')
        {
            List<string> errMsg = new List<string>();
            errMsg.add(gtre.Messages.Message[0].Name);
            errMsg.add(gtre.Messages.Message[0].Summary);
            errMsg.add(gtre.Messages.Message[0].Details);
           
        }
        return null;  
  
		
// AddressSvcSoap: Ping, IsAuthorized, Validate
        AOutput += AddressSvcPing(addressSvc);
        AOutput += '; ' + AddressSvcIsAuthorized(addressSvc);
        AOutput += '; ' + AddressSvcValidate(addressSvc);
// TaxSvc.Ping
		TOutput += TaxPing(taxSvc);
		TOutput += '; ' + TaxIsAuthorized(taxSvc);
		TOutput += '; ' + TaxGetTax(taxSvc, CompCode);
		return null;
    }

    public string TaxGetTax(TaxSvc.TaxSvcSoap taxsvc, string company)
    {
    	string rVal = 'GetTax:';
    	
    	TaxSvc.GetTaxRequest gtr = new TaxSvc.GetTaxRequest();
    	gtr.Addresses = new TaxSvc.ArrayOfBaseAddress();
    	gtr.Addresses.BaseAddress = new List<TaxSvc.BaseAddress>();
    	TaxSvc.BaseAddress oraddr = new taxSvc.BaseAddress();
    	oraddr.Line1 = '1060 W Addison St';
    	oraddr.City = 'Chicago';
    	oraddr.Region = 'IL';
    	oraddr.PostalCode = '60613-4566';
    	oraddr.AddressCode = 'Origin';
    	gtr.Addresses.BaseAddress.add(oraddr);
    	
    	TaxSvc.BaseAddress dstaddr = new taxSvc.BaseAddress();
    	dstaddr.Line1 = '300 E Chapman Ave';
    	dstaddr.City = 'Orange';
    	dstaddr.Region = 'CA';
    	dstaddr.PostalCode = '92866-1508';
    	dstaddr.AddressCode = 'Destination';
    	gtr.Addresses.BaseAddress.add(dstaddr);
    	gtr.OriginCode = oraddr.AddressCode;
    	gtr.DestinationCode = dstaddr.AddressCode;
    	gtr.CompanyCode = company;
    	gtr.CustomerCode = 'TestCustomer';
    	gtr.DetailLevel = 'Document';
    	gtr.DocCode = 'TestDoc';
    	gtr.DocType = 'SalesOrder';
    	gtr.DocDate = DateTime.now().date();
    	gtr.Lines = new TaxSvc.ArrayOfLine();
    	gtr.Lines.Line = new List<TaxSvc.Line>();
    	
    	TaxSvc.Line litem = new TaxSvc.Line();
    	litem.Amount = 100.0;
    	litem.Description = 'Test Product Description';
    	litem.ItemCode = 'Test Product SKU';
    	litem.No = '1';
    	litem.Qty = 1.0;
    	gtr.Lines.Line.add(litem);
    	
    	TaxSvc.GetTaxResult gtres = null;
    	try
    	{
    		gtres = taxsvc.GetTax(gtr);
    		rVal += gtres.ResultCode;
    	}
    	catch(Exception ex)
    	{
    		rVal += 'Excepted';
    	}
    	
    	return rVal;
    }

    public string TaxIsAuthorized(TaxSvc.TaxSvcSoap taxsvc)
    {
    	string rVal = 'IsAuthorized:';
        TaxSvc.IsAuthorizedResult iares = null;
        try 
        {
            iares = taxsvc.IsAuthorized('IsAuthorized');
            rVal += iares.ResultCode;
        }
        catch(Exception ex)
        {
        	rVal += 'Excepted';
        }
        return rVal;
     }

    public string AddressSvcValidate(AddressSvc.AddressSvcSoap addressSvc)
    {
    	string rVal = 'Validate:';
    	AddressSvc.ValidateRequest vreq = new AddressSvc.ValidateRequest();
    	vreq.Address = new AddressSvc.BaseAddress();
    	vreq.Address.Line1 = '1060 w addison';
    	vreq.Address.City = 'chicago';
    	vreq.Address.Region = 'il';
    	AddressSvc.ValidateResult vres = null;
    	try
    	{
    		vres = addressSvc.Validate(vreq);
    		rVal += vres.ResultCode;
    	}
    	catch(Exception ex)
    	{
    		rVal += 'Excepted';
    	}
    	return rVal;
    }

    public string AddressSvcIsAuthorized(AddressSvc.AddressSvcSoap addressSvc)
    {
    	string rVal = 'IsAuthorized:';
        AddressSvc.IsAuthorizedResult iares = null;
        try 
        {
            iares = addressSvc.IsAuthorized('IsAuthorized');
            rVal += iares.ResultCode;
        }
        catch(Exception ex)
        {
        	rVal += 'Excepted';
        }
        return rVal;
     }

    public string AddressSvcPing(AddressSvc.AddressSvcSoap addressSvc)
    {
    	string rVal = 'Ping:';
        AddressSvc.PingResult pres = null;
        try 
        {
            pres = addressSvc.Ping(' ');
            rVal += pres.ResultCode;
        }
        catch(Exception ex)
        {
        	rVal += 'Excepted';
        }
        return rVal + ' ';
    }
    
    public string TaxPing(TaxSvc.TaxSvcSoap taxSvc) 
    {
        TaxSvc.PingResult pres = null;
        string rVal = 'Ping:';
        
        try 
        {
            pres = taxSvc.Ping(' ');
            rVal += pres.ResultCode;
        }
        catch(Exception ex)
        {
        	rVal += 'Excepted';
        }
        return rVal;
    }

}