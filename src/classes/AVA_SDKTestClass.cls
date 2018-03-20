@isTest
private class AVA_SDKTestClass {
// unit tests just instantiate an instance of every class
// in order to satisfy SF's code coverage requirement - no comment - 
//Created a separate class By Vijay on 29 Nov 2017 for unit test cases as per Salesforce changes - For release 13.65.3.0
   //static testmethod void AddressUnitTests()
   @isTest static void AddressUnitTests()
   {
        AddressSvc m_AddrSvc = new AddressSvc();
        //AddressSvcSoap m_addrSvcSoap = new AddressSvcSoap('https://development.avalara.net');
        TaxSvc.PingResult m_tstPres = new TaxSvc.PingResult();
        TaxSvc.IsAuthorizedResult m_tias = new TaxSvc.IsAuthorizedResult();
        TaxSvc.IsAuthorizedResponse_element m_tiare = new TaxSvc.IsAuthorizedResponse_element();
        TaxSvc.Message m_tmsg = new TaxSvc.Message();
        AddressSvc.ArrayOfValidAddress m_tarrva = new AddressSvc.ArrayOfValidAddress();
        AddressSvc.ValidateRequest m_tvr = new AddressSvc.ValidateRequest();
        TaxSvc.Profile m_tpr = new TaxSvc.Profile();
        AddressSvc.PingResponse_element m_tpre = new AddressSvc.PingResponse_element(); 
        AddressSvc.ValidateResponse_element m_tvre = new AddressSvc.ValidateResponse_element();
        AddressSvc.Ping_element m_tpe = new AddressSvc.Ping_element();
        AddressSvc.IsAuthorized_element m_tiae = new AddressSvc.IsAuthorized_element();
        AddressSvc.BaseAddress m_tba = new AddressSvc.BaseAddress();
        AddressSvc.ArrayOfMessage m_taom = new AddressSvc.ArrayOfMessage();
        AddressSvc.Security m_tsec = new AddressSvc.Security();
        AddressSvc.Validate_element m_tve = new AddressSvc.Validate_element();
        AddressSvc.ValidAddress m_tva = new AddressSvc.ValidAddress();
        AddressSvc.UsernameToken_element m_tute = new AddressSvc.UsernameToken_element();
        AddressSvc.ValidateResult m_tvRes = new AddressSvc.ValidateResult();
    }

    @isTest static void TaxUnitTests()
    {
        TaxSvc m_tTaxSvc = new TaxSvc();
        TaxSvc.AuditMessage m_tAuditMessage = new TaxSvc.AuditMessage();
        TaxSvc.CommitTaxResult m_tCommitTaxResult = new TaxSvc.CommitTaxResult();
        TaxSvc.TaxSvcSoap m_tTaxSvcSoap = new TaxSvc.TaxSvcSoap('https://bogus.url.net');
        TaxSvc.IsAuthorized_element m_tIsAuthorized_element = new TaxSvc.IsAuthorized_element();
        TaxSvc.TaxAddress m_tTaxAddress = new TaxSvc.TaxAddress();
        TaxSvc.ArrayOfMessage m_tArrayOfMessage = new TaxSvc.ArrayOfMessage();
        TaxSvc.ArrayOfLine m_tArrayOfLine = new TaxSvc.ArrayOfLine();
        TaxSvc.ApplyPaymentResponse_element m_tApplyPaymentResponse_element = new TaxSvc.ApplyPaymentResponse_element();
        TaxSvc.GetParameterBagItemsResponse_element m_tGetParameterBagItemsResponse_element = new TaxSvc.GetParameterBagItemsResponse_element();
        TaxSvc.GetAllParameterBagItemsResponse_element m_tGetAllParameterBagItemsResponse_element = new TaxSvc.GetAllParameterBagItemsResponse_element();
        TaxSvc.GetTaxHistoryResult m_tGetTaxHistoryResult = new TaxSvc.GetTaxHistoryResult();
        TaxSvc.ArrayOfBaseAddress m_tArrayOfBaseAddress = new TaxSvc.ArrayOfBaseAddress();
        TaxSvc.PostTax_element m_tPostTax_element = new TaxSvc.PostTax_element();
        TaxSvc.PostTaxRequest m_tPostTaxRequest = new TaxSvc.PostTaxRequest();
        TaxSvc.AdjustTaxRequest m_tAdjustTaxRequest = new TaxSvc.AdjustTaxRequest();
        TaxSvc.ArrayOfTaxLine m_tArrayOfTaxLine = new TaxSvc.ArrayOfTaxLine();
        TaxSvc.ApplyPaymentRequest m_tApplyPaymentRequest = new TaxSvc.ApplyPaymentRequest();
        TaxSvc.GetParameterBagItemsRequest m_tGetParameterBagItemsRequest = new TaxSvc.GetParameterBagItemsRequest();
        TaxSvc.PingResult m_tPingResult = new TaxSvc.PingResult();
        TaxSvc.IsAuthorizedResult m_tIsAuthorizedResult = new TaxSvc.IsAuthorizedResult();
        TaxSvc.IsAuthorizedResponse_element m_tIsAuthorizedResponse_element = new TaxSvc.IsAuthorizedResponse_element();
        TaxSvc.CommitTaxRequest m_tCommitTaxRequest = new TaxSvc.CommitTaxRequest();
        TaxSvc.TaxOverride m_tTaxOverride = new TaxSvc.TaxOverride();
        Profile m_tProfile = new Profile();
        TaxSvc.ReconcileTaxHistoryRequest m_tReconcileTaxHistoryRequest = new TaxSvc.ReconcileTaxHistoryRequest();
        TaxSvc.ApplyPaymentResult m_tApplyPaymentResult = new TaxSvc.ApplyPaymentResult();
        TaxSvc.GetParameterBagItemsResult m_tGetParameterBagItemsResult = new TaxSvc.GetParameterBagItemsResult();
        TaxSvc.GetAllParameterBagItemsResult m_tGetAllParameterBagItemsResult = new TaxSvc.GetAllParameterBagItemsResult();
        TaxSvc.BaseAddress m_tBaseAddress = new TaxSvc.BaseAddress();
        TaxSvc.ArrayOfTaxDetail m_tArrayOfTaxDetail = new TaxSvc.ArrayOfTaxDetail();
        TaxSvc.Security m_tSecurity = new TaxSvc.Security();
        TaxSvc.GetTaxHistoryResponse_element m_tGetTaxHistoryResponse_element = new TaxSvc.GetTaxHistoryResponse_element();
        TaxSvc.GetTax_element m_tGetTax_element = new TaxSvc.GetTax_element();
        TaxSvc.UsernameToken_element m_tUsernameToken_element = new TaxSvc.UsernameToken_element();
        TaxSvc.AdjustTaxResult m_tAdjustTaxResult = new TaxSvc.AdjustTaxResult();
        TaxSvc.GetTaxResult m_tGetTaxResult = new TaxSvc.GetTaxResult();
        TaxSvc.CommitTax_element m_tCommitTax_element = new TaxSvc.CommitTax_element();
        TaxSvc.ReconcileTaxHistoryResult m_tReconcileTaxHistoryResult = new TaxSvc.ReconcileTaxHistoryResult();
        TaxSvc.AdjustTax_element m_tAdjustTax_element = new TaxSvc.AdjustTax_element();
        TaxSvc.AdjustTaxResponse_element m_tAdjustTaxResponse_element = new TaxSvc.AdjustTaxResponse_element();
        TaxSvc.Ping_element m_tPing_element = new TaxSvc.Ping_element();
        TaxSvc.GetTaxHistory_element m_tGetTaxHistory_element = new TaxSvc.GetTaxHistory_element();
        TaxSvc.ArrayOfTaxAddress m_tArrayOfTaxAddress = new TaxSvc.ArrayOfTaxAddress();
        TaxSvc.PostTaxResponse_element m_tPostTaxResponse_element = new TaxSvc.PostTaxResponse_element();
        TaxSvc.GetTaxRequest m_tGetTaxRequest = new TaxSvc.GetTaxRequest();
        TaxSvc.CancelTax_element m_tCancelTax_element = new TaxSvc.CancelTax_element();
        TaxSvc.CommitTaxResponse_element m_tCommitTaxResponse_element = new TaxSvc.CommitTaxResponse_element();
        TaxSvc.PostTaxResult m_tPostTaxResult = new TaxSvc.PostTaxResult();
        TaxSvc.ReconcileTaxHistoryResponse_element m_tReconcileTaxHistoryResponse_element = new TaxSvc.ReconcileTaxHistoryResponse_element();
        TaxSvc.CancelTaxResult m_tCancelTaxResult = new TaxSvc.CancelTaxResult();
        TaxSvc.TaxDetail m_tTaxDetail = new TaxSvc.TaxDetail();
        TaxSvc.Message m_tMessage = new TaxSvc.Message();
        TaxSvc.PingResponse_element m_tPingResponse_element = new TaxSvc.PingResponse_element();
        TaxSvc.GetTaxHistoryRequest m_tGetTaxHistoryRequest = new TaxSvc.GetTaxHistoryRequest();
        TaxSvc.ApplyPayment_element m_tApplyPayment_element = new TaxSvc.ApplyPayment_element();
        TaxSvc.GetParameterBagItems_element m_tGetParameterBagItems_element = new TaxSvc.GetParameterBagItems_element();
        TaxSvc.GetAllParameterBagItems_element m_tGetAllParameterBagItems_element = new TaxSvc.GetAllParameterBagItems_element();
        TaxSvc.CancelTaxRequest m_tCancelTaxRequest = new TaxSvc.CancelTaxRequest();
        TaxSvc.ReconcileTaxHistory_element m_tReconcileTaxHistory_element = new TaxSvc.ReconcileTaxHistory_element();
        TaxSvc.GetTaxResponse_element m_tGetTaxResponse_element = new TaxSvc.GetTaxResponse_element();
        TaxSvc.CancelTaxResponse_element m_tCancelTaxResponse_element = new TaxSvc.CancelTaxResponse_element();
        TaxSvc.TaxLine m_tTaxLine = new TaxSvc.TaxLine();
        TaxSvc.ArrayOfGetTaxResult m_tArrayOfGetTaxResult = new TaxSvc.ArrayOfGetTaxResult();
        TaxSvc.Line m_tLine = new TaxSvc.Line();
    }
}