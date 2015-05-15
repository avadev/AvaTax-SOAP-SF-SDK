// TaxSvc Test Harness
public class TaxSvcTestDemo 
{
    public String SvcURL {get;set;}
    public String UserName {get;set;}
    public String PassWord {get;set;}
    public String CompCode {get; set;}
    public String Version {get;set;}
    public String OrgValidateResult {get;set;}
    public String DstValidateResult {get;set;}
    public String InvoiceDate {get; set;}
    public String TaxDate {get; set;}
    public String PmtDate {get; set;}
    public String InvoiceNum{get; set;}
    public String DocType {get; set;}
    public String TotalTax {get; set;}
    public String TaxBreakDown {get; set;}
    public String tmpValRes {get; set;}

    public String LineNo1 {get; set;}
    public String ItemCode1 {get; set;}
    public String ItemDesc1 {get; set;}
    public String UnitCost1 {get; set;}
    public String Qty1 {get; set;}
    public String Amount1 {get; set;}
    public String Tax1 {get; set;}

    public Address orgAddr {get;set;}
    public Address dstAddr {get;set;}

    public TaxSvcTestDemo()
    {
        Version = 'Enter  Service Url, Username/Account #, and Password/License Key then Press "Test Connect"';
        OrgValidateResult = 'Enter Street Address, and at Least 2/3 of City, State and Zip, then press "Validate Address"';
        DstValidateResult = OrgValidateResult;
        DocType = 'SalesOrder';
        orgAddr = new Address();
        dstAddr = new Address();
        LineNo1 = '1';
        ItemCode1 = 'Item123';
        ItemDesc1 = 'SKU Item123 Description';
        UnitCost1 = '25.00';
        Qty1 = '4.0';
        Amount1 = '100.00';
    }
    
    public class Address
    {
        public String Line1 {get;set;}
        public String Line2 {get;set;}
        public String Line3 {get;set;}
        public String City {get;set;}
        public String Region {get;set;}
        public String PostalCode {get;set;}
        public String Country {get;set;}

        public AddressSvc.BaseAddress AddrAddress() 
        {
              AddressSvc.BaseAddress rval = new AddressSvc.BaseAddress();
              rval.Line1 = Line1;
              rval.Line2 = Line2;
              rval.Line3 = Line3;
              rval.City = City;
              rval.Region = Region;
              rval.PostalCode = PostalCode;
              rval.Country = Country;
              return rval;
        }

        public TaxSvc.BaseAddress TaxAddress() 
        {
              TaxSvc.BaseAddress rval = new TaxSvc.BaseAddress();
              rval.Line1 = Line1;
              rval.Line2 = Line2;
              rval.Line3 = Line3;
              rval.City = City;
              rval.Region = Region;
              rval.PostalCode = PostalCode;
              rval.Country = Country;
              return rval;
        }
    }

    public PageReference CalcTax()
    {
        TaxSvc.TaxSvcSoap taxSvc = new TaxSvc.TaxSvcSoap(SvcURL);
        taxSvc.Security.UsernameToken.Username = UserName;
        taxSvc.Security.UsernameToken.Password = PassWord;
        taxSvc.Profile.Client = 'SFDemo,1,0';

        TaxSvc.GetTaxRequest gtreq = new TaxSvc.GetTaxRequest();
        gtreq.DocCode = 'SO123';
        gtreq.DocType = 'SalesOrder';
        gtreq.CustomerCode = 'CustNumber1';
        gtreq.CompanyCode = CompCode;
        gtreq.DetailLevel = 'Tax';

        gtreq.Addresses = new TaxSvc.ArrayOfBaseAddress();
        gtreq.Addresses.BaseAddress = new TaxSvc.BaseAddress[2];

        gtreq.Addresses.BaseAddress[0] = orgAddr.TaxAddress();
        gtreq.Addresses.BaseAddress[1] = dstAddr.TaxAddress();

        gtreq.Addresses.BaseAddress[0].AddressCode = 'Origin';
        gtreq.Addresses.BaseAddress[1].AddressCode = 'Destination';

        gtreq.OriginCode = 'Origin';
        gtreq.DestinationCode = 'Destination';

        gtreq.Lines = new TaxSvc.ArrayOfLine();
        gtreq.Lines.Line = new TaxSvc.Line[2];
        gtreq.Lines.Line[0] = new TaxSvc.Line();
        
        gtreq.Lines.Line[0].No = LineNo1;
        gtreq.Lines.Line[0].ItemCode = ItemCode1;
        gtreq.Lines.Line[0].Description = ItemDesc1;
        
        try
        {
             gtreq.Lines.Line[0].Qty = decimal.valueOf(Qty1);
             gtreq.DocDate = Date.Today();
             gtreq.Lines.Line[0].Amount = decimal.valueOf(UnitCost1) * decimal.valueOf(Qty1);
        } 
        catch(Exception amtEx)
        {
            TaxBreakDown = 'Error: ' + amtEx.getMessage();
            return null;
        }
         
        TaxSvc.GetTaxResult gtres = null;
        try
        {
            gtres = taxSvc.GetTax(gtreq);
        }
        catch(Exception ex)
        {
            TaxBreakDown = 'GetTax Threw an Exception: ' + ex.getmessage();
            return null;
        }                                     
        
        if(gtres.ResultCode == 'Success')
        {
             TaxSvc.TaxLine txln = gtres.TaxLines.TaxLine[0];
             Decimal Rate = 0.00;
             Tax1 = '$' + gtres.TotalTax.format() + makepad(gtres.TotalTax.scale());
             TaxBreakDown = 'Component Taxes: ';
             for(TaxSvc.TaxDetail td : txln.TaxDetails.TaxDetail)
             {
                  Rate = td.Rate * 100.00;
                  TaxBreakDown += td.JurisType + '=' + td.JurisName + ': $' + td.Tax.format() + makepad(td.Tax.scale()) + ' ( ' + Rate.format() + makepad(Rate.scale()) + '% ); ';
             } 
        }
        else
        {
            TaxBreakDown = 'GetTax Returned Other Than Success: ' + gtres.ResultCode + ' : ' + gtres.Messages.Message[0].Name + ' : ' + gtres.Messages.Message[0].Summary;
        }
        return null;
    }

    private String makepad(Integer places)
    {
         if(places == 0)
         {
              return '.00';
         }
         if(places == 1)
         {
              return '0';
         }
         return '';
    }
 
    public PageReference TaxPing() 
    {
        TaxSvc.TaxSvcSoap taxSvc = new TaxSvc.TaxSvcSoap(SvcURL);
        taxSvc.Security.UsernameToken.Username = UserName;
        taxSvc.Security.UsernameToken.Password = PassWord;
        taxSvc.Profile.Client = 'SFDemo,1,0';
        TaxSvc.PingResult pres = null;
        
        try 
        {
            pres = taxSvc.Ping(' ');
        }
        catch(Exception ex)
        {
            Version = 'Test Connect Excepted: ' + ex.getmessage();
            return null;
        }
        if(pres.ResultCode == 'Success')
        {
             Version = 'TaxSvc Test Connect Successful - Avalara Service Version: ' + pres.Version;
        }
        else
        {
            Version = 'TaxSvc Test Connect Returned Other Than Success: ' + pres.ResultCode + 
              ' : ' + pres.Messages.Message[0].Name + ' : ' + pres.Messages.Message[0].Summary;
        }
        return null;
    }
    
    public PageReference oValidate()
    {
        Address tmpAddr = validate(orgAddr);
        OrgValidateResult=tmpValRes;
        if(tmpAddr != null)
        {
             orgAddr = tmpAddr;
        }
        return null;
    }
    
    public PageReference dValidate()
    {
        Address tmpAddr = validate(dstAddr);
        DstValidateResult=tmpValRes;
        if(tmpAddr != null)
        {
             dstAddr = tmpAddr;
        }
        return null;
    }
    
    private Address validate(Address inAddr) 
    {
        Address rtVal = null;
        AddressSvc.AddressSvcSoap addressSvc = new AddressSvc.AddressSvcSoap(SvcURL);
        addressSvc.Security.UsernameToken.Username = UserName;
        addressSvc.Security.UsernameToken.Password = PassWord;
        addressSvc.Profile.Client = 'SFDemo,1,0';
        
        AddressSvc.ValidateRequest vreq = new AddressSvc.ValidateRequest();
        vreq.Address = inAddr.AddrAddress();
        vreq.Address.TaxRegionId=0;
        vreq.Coordinates = false;
        vreq.Taxability=false;
        vreq.TextCase='Mixed';
     
        AddressSvc.ValidateResult vres = null;

        try
        {
            vres=addressSvc.Validate(vreq);
        }
        catch(Exception ex)
        {
            tmpValRes = 'Address Validation Excepted: ' + ex.getmessage();
            return rtVal;
        }

        if(vres.ResultCode == 'Success')
        {
             rtVal = new Address();
             tmpValRes = 'Address Validation Returned Success - Standardized Address Appears Above';
             rtVal.Line1 = vres.ValidAddresses.ValidAddress[0].Line1;
             rtVal.Line2 = vres.ValidAddresses.ValidAddress[0].Line2;
             rtVal.Line3 = vres.ValidAddresses.ValidAddress[0].Line3;
             rtVal.City = vres.ValidAddresses.ValidAddress[0].City;
             rtVal.Region = vres.ValidAddresses.ValidAddress[0].Region;
             rtVal.PostalCode = vres.ValidAddresses.ValidAddress[0].PostalCode;
             rtVal.Country = vres.ValidAddresses.ValidAddress[0].Country;
        }
        else
        {
            tmpValRes = 'Address Validation Returned Other Than Success: ' + vres.ResultCode + 
                ' : ' + vres.Messages.Message[0].Name + ' : ' + vres.Messages.Message[0].Summary;
        }
           
        return rtVal;
    }
}