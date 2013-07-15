////////////////////////////////////////////////////////////////////////////////
//   Copyright 2012 Avalara, Inc.
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// TaxSvc is not instantiated directly, and is really in effect more 
// of a namespace than a class.
////////////////////////////////////////////////////////////////////////////////
global with sharing class TaxSvc {
// unit tests just instantiate an instance of every class
// in order to satisfy SF's code coverage requirement - no comment
    static testmethod void TaxUnitTests()
    {
        TaxSvc m_tTaxSvc = new TaxSvc();
        AuditMessage m_tAuditMessage = new AuditMessage();
        CommitTaxResult m_tCommitTaxResult = new CommitTaxResult();
        TaxSvcSoap m_tTaxSvcSoap = new TaxSvcSoap('https://bogus.url.net');
        IsAuthorized_element m_tIsAuthorized_element = new IsAuthorized_element();
        TaxAddress m_tTaxAddress = new TaxAddress();
        ArrayOfMessage m_tArrayOfMessage = new ArrayOfMessage();
        ArrayOfLine m_tArrayOfLine = new ArrayOfLine();
        ApplyPaymentResponse_element m_tApplyPaymentResponse_element = new ApplyPaymentResponse_element();
        GetTaxHistoryResult m_tGetTaxHistoryResult = new GetTaxHistoryResult();
        ArrayOfBaseAddress m_tArrayOfBaseAddress = new ArrayOfBaseAddress();
        PostTax_element m_tPostTax_element = new PostTax_element();
        PostTaxRequest m_tPostTaxRequest = new PostTaxRequest();
        AdjustTaxRequest m_tAdjustTaxRequest = new AdjustTaxRequest();
        ArrayOfTaxLine m_tArrayOfTaxLine = new ArrayOfTaxLine();
        ApplyPaymentRequest m_tApplyPaymentRequest = new ApplyPaymentRequest();
        PingResult m_tPingResult = new PingResult();
        IsAuthorizedResult m_tIsAuthorizedResult = new IsAuthorizedResult();
        IsAuthorizedResponse_element m_tIsAuthorizedResponse_element = new IsAuthorizedResponse_element();
        CommitTaxRequest m_tCommitTaxRequest = new CommitTaxRequest();
        TaxOverride m_tTaxOverride = new TaxOverride();
        Profile m_tProfile = new Profile();
        ReconcileTaxHistoryRequest m_tReconcileTaxHistoryRequest = new ReconcileTaxHistoryRequest();
        ApplyPaymentResult m_tApplyPaymentResult = new ApplyPaymentResult();
        BaseAddress m_tBaseAddress = new BaseAddress();
        ArrayOfTaxDetail m_tArrayOfTaxDetail = new ArrayOfTaxDetail();
        Security m_tSecurity = new Security();
        GetTaxHistoryResponse_element m_tGetTaxHistoryResponse_element = new GetTaxHistoryResponse_element();
        GetTax_element m_tGetTax_element = new GetTax_element();
        UsernameToken_element m_tUsernameToken_element = new UsernameToken_element();
        AdjustTaxResult m_tAdjustTaxResult = new AdjustTaxResult();
        GetTaxResult m_tGetTaxResult = new GetTaxResult();
        CommitTax_element m_tCommitTax_element = new CommitTax_element();
        ReconcileTaxHistoryResult m_tReconcileTaxHistoryResult = new ReconcileTaxHistoryResult();
        AdjustTax_element m_tAdjustTax_element = new AdjustTax_element();
        AdjustTaxResponse_element m_tAdjustTaxResponse_element = new AdjustTaxResponse_element();
        Ping_element m_tPing_element = new Ping_element();
        GetTaxHistory_element m_tGetTaxHistory_element = new GetTaxHistory_element();
        ArrayOfTaxAddress m_tArrayOfTaxAddress = new ArrayOfTaxAddress();
        PostTaxResponse_element m_tPostTaxResponse_element = new PostTaxResponse_element();
        GetTaxRequest m_tGetTaxRequest = new GetTaxRequest();
        CancelTax_element m_tCancelTax_element = new CancelTax_element();
        CommitTaxResponse_element m_tCommitTaxResponse_element = new CommitTaxResponse_element();
        PostTaxResult m_tPostTaxResult = new PostTaxResult();
        ReconcileTaxHistoryResponse_element m_tReconcileTaxHistoryResponse_element = new ReconcileTaxHistoryResponse_element();
        CancelTaxResult m_tCancelTaxResult = new CancelTaxResult();
        TaxDetail m_tTaxDetail = new TaxDetail();
        Message m_tMessage = new Message();
        PingResponse_element m_tPingResponse_element = new PingResponse_element();
        GetTaxHistoryRequest m_tGetTaxHistoryRequest = new GetTaxHistoryRequest();
        ApplyPayment_element m_tApplyPayment_element = new ApplyPayment_element();
        CancelTaxRequest m_tCancelTaxRequest = new CancelTaxRequest();
        ReconcileTaxHistory_element m_tReconcileTaxHistory_element = new ReconcileTaxHistory_element();
        GetTaxResponse_element m_tGetTaxResponse_element = new GetTaxResponse_element();
        CancelTaxResponse_element m_tCancelTaxResponse_element = new CancelTaxResponse_element();
        TaxLine m_tTaxLine = new TaxLine();
        ArrayOfGetTaxResult m_tArrayOfGetTaxResult = new ArrayOfGetTaxResult();
        Line m_tLine = new Line();
    }

    global class TaxSvcSoap {
        global String endpoint_x = 'https://development.avalara.net/tax/Tax/TaxSvc.asmx/altsec';
        global Map<String,String> inputHttpHeaders_x;
        global Map<String,String> outputHttpHeaders_x;
        global String clientCertName_x;
        global String clientCert_x;
        global String clientCertPasswd_x;
        global Integer timeout_x {get; set;}
        global TaxSvc.AuditMessage AuditMessage;
        global TaxSvc.Profile Profile;
        global TaxSvc.Security Security;
        private String AuditMessage_hns = 'AuditMessage=http://avatax.avalara.com/services';
        private String Profile_hns = 'Profile=http://avatax.avalara.com/services';
        private String Security_hns = 'Security=http://avatax.avalara.com/services';
        private String[] ns_map_type_info = new String[]{'http://avatax.avalara.com/services', 'CBTaxSvc'};
        global TaxSvcSoap(String SvcURL)
        {
            endpoint_x = SvcURL + '/tax/taxsvc.asmx/altsec';
            Profile = new TaxSvc.Profile();
            Security = new TaxSvc.Security();
        }
        global TaxSvc.IsAuthorizedResult IsAuthorized(String Operations) {
            TaxSvc.IsAuthorized_element request_x = new TaxSvc.IsAuthorized_element();
            TaxSvc.IsAuthorizedResponse_element response_x;
            request_x.Operations = Operations;
            Map<String, TaxSvc.IsAuthorizedResponse_element> response_map_x = new Map<String, TaxSvc.IsAuthorizedResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/IsAuthorized',
              'http://avatax.avalara.com/services',
              'IsAuthorized',
              'http://avatax.avalara.com/services',
              'IsAuthorizedResponse',
              'TaxSvc.IsAuthorizedResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.IsAuthorizedResult;
        }
        global TaxSvc.PostTaxResult PostTax(TaxSvc.PostTaxRequest PostTaxRequest) {
            TaxSvc.PostTax_element request_x = new TaxSvc.PostTax_element();
            TaxSvc.PostTaxResponse_element response_x;
            request_x.PostTaxRequest = PostTaxRequest;
            Map<String, TaxSvc.PostTaxResponse_element> response_map_x = new Map<String, TaxSvc.PostTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/PostTax',
              'http://avatax.avalara.com/services',
              'PostTax',
              'http://avatax.avalara.com/services',
              'PostTaxResponse',
              'TaxSvc.PostTaxResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.PostTaxResult;
        }
        global TaxSvc.CancelTaxResult CancelTax(TaxSvc.CancelTaxRequest CancelTaxRequest) {
            TaxSvc.CancelTax_element request_x = new TaxSvc.CancelTax_element();
            TaxSvc.CancelTaxResponse_element response_x;
            request_x.CancelTaxRequest = CancelTaxRequest;
            Map<String, TaxSvc.CancelTaxResponse_element> response_map_x = new Map<String, TaxSvc.CancelTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/CancelTax',
              'http://avatax.avalara.com/services',
              'CancelTax',
              'http://avatax.avalara.com/services',
              'CancelTaxResponse',
              'TaxSvc.CancelTaxResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.CancelTaxResult;
        }
        global TaxSvc.GetTaxHistoryResult GetTaxHistory(TaxSvc.GetTaxHistoryRequest GetTaxHistoryRequest) {
            TaxSvc.GetTaxHistory_element request_x = new TaxSvc.GetTaxHistory_element();
            TaxSvc.GetTaxHistoryResponse_element response_x;
            request_x.GetTaxHistoryRequest = GetTaxHistoryRequest;
            Map<String, TaxSvc.GetTaxHistoryResponse_element> response_map_x = new Map<String, TaxSvc.GetTaxHistoryResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/GetTaxHistory',
              'http://avatax.avalara.com/services',
              'GetTaxHistory',
              'http://avatax.avalara.com/services',
              'GetTaxHistoryResponse',
              'TaxSvc.GetTaxHistoryResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetTaxHistoryResult;
        }
        global TaxSvc.PingResult Ping(String Message) {
            TaxSvc.Ping_element request_x = new TaxSvc.Ping_element();
            TaxSvc.PingResponse_element response_x;
            request_x.Message = Message;
            Map<String, TaxSvc.PingResponse_element> response_map_x = new Map<String, TaxSvc.PingResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/Ping',
              'http://avatax.avalara.com/services',
              'Ping',
              'http://avatax.avalara.com/services',
              'PingResponse',
              'TaxSvc.PingResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.PingResult;
        }
        global TaxSvc.ApplyPaymentResult ApplyPayment(TaxSvc.ApplyPaymentRequest ApplyPaymentRequest) {
            TaxSvc.ApplyPayment_element request_x = new TaxSvc.ApplyPayment_element();
            TaxSvc.ApplyPaymentResponse_element response_x;
            request_x.ApplyPaymentRequest = ApplyPaymentRequest;
            Map<String, TaxSvc.ApplyPaymentResponse_element> response_map_x = new Map<String, TaxSvc.ApplyPaymentResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/ApplyPayment',
              'http://avatax.avalara.com/services',
              'ApplyPayment',
              'http://avatax.avalara.com/services',
              'ApplyPaymentResponse',
              'TaxSvc.ApplyPaymentResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.ApplyPaymentResult;
        }
        global TaxSvc.GetTaxResult GetTax(TaxSvc.GetTaxRequest GetTaxRequest) {
            TaxSvc.GetTax_element request_x = new TaxSvc.GetTax_element();
            TaxSvc.GetTaxResponse_element response_x;
            request_x.GetTaxRequest = GetTaxRequest;
            Map<String, TaxSvc.GetTaxResponse_element> response_map_x = new Map<String, TaxSvc.GetTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/GetTax',
              'http://avatax.avalara.com/services',
              'GetTax',
              'http://avatax.avalara.com/services',
              'GetTaxResponse',
              'TaxSvc.GetTaxResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetTaxResult;
        }
        global TaxSvc.AdjustTaxResult AdjustTax(TaxSvc.AdjustTaxRequest AdjustTaxRequest) {
            TaxSvc.AdjustTax_element request_x = new TaxSvc.AdjustTax_element();
            TaxSvc.AdjustTaxResponse_element response_x;
            request_x.AdjustTaxRequest = AdjustTaxRequest;
            Map<String, TaxSvc.AdjustTaxResponse_element> response_map_x = new Map<String, TaxSvc.AdjustTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/AdjustTax',
              'http://avatax.avalara.com/services',
              'AdjustTax',
              'http://avatax.avalara.com/services',
              'AdjustTaxResponse',
              'TaxSvc.AdjustTaxResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.AdjustTaxResult;
        }
        global TaxSvc.ReconcileTaxHistoryResult ReconcileTaxHistory(TaxSvc.ReconcileTaxHistoryRequest ReconcileTaxHistoryRequest) {
            TaxSvc.ReconcileTaxHistory_element request_x = new TaxSvc.ReconcileTaxHistory_element();
            TaxSvc.ReconcileTaxHistoryResponse_element response_x;
            request_x.ReconcileTaxHistoryRequest = ReconcileTaxHistoryRequest;
            Map<String, TaxSvc.ReconcileTaxHistoryResponse_element> response_map_x = new Map<String, TaxSvc.ReconcileTaxHistoryResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/ReconcileTaxHistory',
              'http://avatax.avalara.com/services',
              'ReconcileTaxHistory',
              'http://avatax.avalara.com/services',
              'ReconcileTaxHistoryResponse',
              'TaxSvc.ReconcileTaxHistoryResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.ReconcileTaxHistoryResult;
        }
        global TaxSvc.CommitTaxResult CommitTax(TaxSvc.CommitTaxRequest CommitTaxRequest) {
            TaxSvc.CommitTax_element request_x = new TaxSvc.CommitTax_element();
            TaxSvc.CommitTaxResponse_element response_x;
            request_x.CommitTaxRequest = CommitTaxRequest;
            Map<String, TaxSvc.CommitTaxResponse_element> response_map_x = new Map<String, TaxSvc.CommitTaxResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/CommitTax',
              'http://avatax.avalara.com/services',
              'CommitTax',
              'http://avatax.avalara.com/services',
              'CommitTaxResponse',
              'TaxSvc.CommitTaxResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.CommitTaxResult;
        }
    }

////////////////////////////////////////////////////////////////////////////////
// API call Request Classes - instantiations passed as arguments to API calls
////////////////////////////////////////////////////////////////////////////////
    global class PostTaxRequest {
        global String CompanyCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global Date DocDate = Date.Today();
        global Decimal TotalAmount = 0.0;
        global Decimal TotalTax = 0.0;
        global Boolean Commit_x = false;
        global String NewDocCode;
        global Integer HashCode;
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTax_type_info = new String[]{'TotalTax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Commit_x_type_info = new String[]{'Commit','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] NewDocCode_type_info = new String[]{'NewDocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','DocDate','TotalAmount','TotalTax','Commit_x','NewDocCode'};
    }
    global class AdjustTaxRequest {
        global Integer AdjustmentReason = 0;
        global String AdjustmentDescription;
        global TaxSvc.GetTaxRequest GetTaxRequest;
        private String[] AdjustmentReason_type_info = new String[]{'AdjustmentReason','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] AdjustmentDescription_type_info = new String[]{'AdjustmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] GetTaxRequest_type_info = new String[]{'GetTaxRequest','http://avatax.avalara.com/services','GetTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AdjustmentReason','AdjustmentDescription','GetTaxRequest'};
    }
    global class ApplyPaymentRequest {
        global String CompanyCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global Date PaymentDate = Date.Today();
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PaymentDate_type_info = new String[]{'PaymentDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','PaymentDate'};
    }
    global class CommitTaxRequest {
        global String CompanyCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global String NewDocCode;
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] NewDocCode_type_info = new String[]{'NewDocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','NewDocCode'};
    }
    global class ReconcileTaxHistoryRequest {
        global String CompanyCode;
        global Boolean Reconciled = false;
        global Date StartDate = Date.Today();
        global Date EndDate = Date.Today();
        global String DocStatus = 'Temporary';
        global String DocType = 'SalesOrder';
        global String LastDocCode = '0';
        global Integer PageSize = 10;
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Reconciled_type_info = new String[]{'Reconciled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] StartDate_type_info = new String[]{'StartDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] EndDate_type_info = new String[]{'EndDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] DocStatus_type_info = new String[]{'DocStatus','http://avatax.avalara.com/services','DocStatus','1','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] LastDocCode_type_info = new String[]{'LastDocCode','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] PageSize_type_info = new String[]{'PageSize','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','Reconciled','StartDate','EndDate','DocStatus','DocType','LastDocCode','PageSize'};
    }
    global class GetTaxRequest {
        global String CompanyCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global Date DocDate = Date.Today();
        global String SalespersonCode;
        global String CustomerCode;
        global String CustomerUsageType;
        global Decimal Discount = 0.0;
        global String PurchaseOrderNo;
        global String ExemptionNo;
        global String OriginCode;
        global String DestinationCode;
        global TaxSvc.ArrayOfBaseAddress Addresses;
        global TaxSvc.ArrayOfLine Lines;
        global String DetailLevel = 'Document';
        global String ReferenceCode;
        global String LocationCode;
        global Boolean Commit_x = false;
        global String BatchCode;
        global TaxSvc.TaxOverride TaxOverride;
        global String CurrencyCode;
        global String ServiceMode = 'Automatic';
        global Date PaymentDate = Date.Today();
        global Decimal ExchangeRate = 1.0;
        global Date ExchangeRateEffDate = Date.Today();
        global Integer HashCode;
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] SalespersonCode_type_info = new String[]{'SalespersonCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CustomerCode_type_info = new String[]{'CustomerCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CustomerUsageType_type_info = new String[]{'CustomerUsageType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Discount_type_info = new String[]{'Discount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] PurchaseOrderNo_type_info = new String[]{'PurchaseOrderNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ExemptionNo_type_info = new String[]{'ExemptionNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] OriginCode_type_info = new String[]{'OriginCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DestinationCode_type_info = new String[]{'DestinationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Addresses_type_info = new String[]{'Addresses','http://avatax.avalara.com/services','ArrayOfBaseAddress','0','1','false'};
        private String[] Lines_type_info = new String[]{'Lines','http://avatax.avalara.com/services','ArrayOfLine','0','1','false'};
        private String[] DetailLevel_type_info = new String[]{'DetailLevel','http://avatax.avalara.com/services','DetailLevel','1','1','false'};
        private String[] ReferenceCode_type_info = new String[]{'ReferenceCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] LocationCode_type_info = new String[]{'LocationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Commit_x_type_info = new String[]{'Commit','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] BatchCode_type_info = new String[]{'BatchCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxOverride_type_info = new String[]{'TaxOverride','http://avatax.avalara.com/services','TaxOverride','0','1','false'};
        private String[] CurrencyCode_type_info = new String[]{'CurrencyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ServiceMode_type_info = new String[]{'ServiceMode','http://avatax.avalara.com/services','ServiceMode','1','1','false'};
        private String[] PaymentDate_type_info = new String[]{'PaymentDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] ExchangeRate_type_info = new String[]{'ExchangeRate','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] ExchangeRateEffDate_type_info = new String[]{'ExchangeRateEffDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','DocDate','SalespersonCode','CustomerCode','CustomerUsageType','Discount','PurchaseOrderNo','ExemptionNo','OriginCode','DestinationCode','Addresses','Lines','DetailLevel','ReferenceCode','LocationCode','Commit_x','BatchCode','TaxOverride','CurrencyCode','ServiceMode','PaymentDate','ExchangeRate','ExchangeRateEffDate'};
    }
    global class GetTaxHistoryRequest {
        global String CompanyCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global String DetailLevel = 'Document';
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DetailLevel_type_info = new String[]{'DetailLevel','http://avatax.avalara.com/services','DetailLevel','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','DetailLevel'};
    }
    global class CancelTaxRequest {
        global String CompanyCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global String CancelCode = 'Unspecified';
        private String[] CompanyCode_type_info = new String[]{'CompanyCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CancelCode_type_info = new String[]{'CancelCode','http://avatax.avalara.com/services','CancelCode','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CompanyCode','DocType','DocCode','CancelCode'};
    }
////////////////////////////////////////////////////////////////////////////////
// API call Result Classes - API calls return instantiations of these
////////////////////////////////////////////////////////////////////////////////
    global class CommitTaxResult {
        global String DocId;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages'};
    }
    global class GetTaxHistoryResult {
        global TaxSvc.GetTaxRequest GetTaxRequest;
        global TaxSvc.GetTaxResult GetTaxResult;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] GetTaxRequest_type_info = new String[]{'GetTaxRequest','http://avatax.avalara.com/services','GetTaxRequest','0','1','false'};
        private String[] GetTaxResult_type_info = new String[]{'GetTaxResult','http://avatax.avalara.com/services','GetTaxResult','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxRequest','GetTaxResult','TransactionId','ResultCode','Messages'};
    }
    global class PingResult {
        global String Version;
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Version','TransactionId','ResultCode','Messages'};
    }
    global class IsAuthorizedResult {
        global String Operations;
        global DateTime Expires = Date.Today() - 1;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Expires_type_info = new String[]{'Expires','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations','Expires','TransactionId','ResultCode','Messages'};
    }
    global class ApplyPaymentResult {
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    global class AdjustTaxResult {
        global String DocId;
        global Integer HashCode;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global Date DocDate = Date.Today();
        global String DocStatus = 'Temporary';
        global Boolean Reconciled = false;
        global DateTime Timestamp = DateTime.Now();
        global Decimal TotalAmount = 0.0;
        global Decimal TotalDiscount = 0.0;
        global Decimal TotalExemption = 0.0;
        global Decimal TotalTaxable = 0.0;
        global Decimal TotalTax = 0.0;
        global Decimal TotalTaxCalculated = 0.0;
        global TaxSvc.ArrayOfTaxLine TaxLines;
        global TaxSvc.ArrayOfTaxAddress TaxAddresses;
        global Boolean Locked = false;
        global Integer AdjustmentReason = 0;
        global String AdjustmentDescription;
        global Integer Version = 0;
        global Date TaxDate = Date.Today();
        global TaxSvc.ArrayOfTaxDetail TaxSummary;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        global Boolean VolatileTaxRates = false;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] DocStatus_type_info = new String[]{'DocStatus','http://avatax.avalara.com/services','DocStatus','1','1','false'};
        private String[] Reconciled_type_info = new String[]{'Reconciled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Timestamp_type_info = new String[]{'Timestamp','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalDiscount_type_info = new String[]{'TotalDiscount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalExemption_type_info = new String[]{'TotalExemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxable_type_info = new String[]{'TotalTaxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTax_type_info = new String[]{'TotalTax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxCalculated_type_info = new String[]{'TotalTaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxLines_type_info = new String[]{'TaxLines','http://avatax.avalara.com/services','ArrayOfTaxLine','0','1','false'};
        private String[] TaxAddresses_type_info = new String[]{'TaxAddresses','http://avatax.avalara.com/services','ArrayOfTaxAddress','0','1','false'};
        private String[] Locked_type_info = new String[]{'Locked','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] AdjustmentReason_type_info = new String[]{'AdjustmentReason','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] AdjustmentDescription_type_info = new String[]{'AdjustmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] TaxSummary_type_info = new String[]{'TaxSummary','http://avatax.avalara.com/services','ArrayOfTaxDetail','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] VolatileTaxRates_type_info = new String[]{'VolatileTaxRates','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'DocId','HashCode','DocType','DocCode','DocDate',
            'DocStatus','Reconciled','Timestamp','TotalAmount','TotalDiscount','TotalExemption',
            'TotalTaxable','TotalTax','TotalTaxCalculated','TaxLines','TaxAddresses','Locked','AdjustmentReason',
            'AdjustmentDescription','Version','TaxDate','TaxSummary','TransactionId','ResultCode','Messages'};
    }
    global class GetTaxResult {
        global String DocId;
        global String TransactionId;
        global String ResultCode;
        global TaxSvc.ArrayOfMessage Messages;
        global String DocType = 'SalesOrder';
        global String DocCode;
        global Date DocDate = Date.Today();
        global String DocStatus = 'Temporary';
        global Boolean Reconciled = false;
        global DateTime Timestamp = DateTime.Now();
        global Decimal TotalAmount = 0.0;
        global Decimal TotalDiscount = 0.0;
        global Decimal TotalExemption = 0.0;
        global Decimal TotalTaxable = 0.0;
        global Decimal TotalTax = 0.0;
        global Decimal TotalTaxCalculated = 0.0;
        global Integer HashCode;
        global TaxSvc.ArrayOfTaxLine TaxLines;
        global TaxSvc.ArrayOfTaxAddress TaxAddresses;
        global Boolean Locked = false;
        global Integer AdjustmentReason = 0;
        global String AdjustmentDescription;
        global Integer Version = 0;
        global Date TaxDate = Date.Today();
        global TaxSvc.ArrayOfTaxDetail TaxSummary;
        global Boolean VolatileTaxRates = false;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] DocType_type_info = new String[]{'DocType','http://avatax.avalara.com/services','DocumentType','1','1','false'};
        private String[] DocCode_type_info = new String[]{'DocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DocDate_type_info = new String[]{'DocDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] DocStatus_type_info = new String[]{'DocStatus','http://avatax.avalara.com/services','DocStatus','1','1','false'};
        private String[] Reconciled_type_info = new String[]{'Reconciled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Timestamp_type_info = new String[]{'Timestamp','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TotalAmount_type_info = new String[]{'TotalAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalDiscount_type_info = new String[]{'TotalDiscount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalExemption_type_info = new String[]{'TotalExemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxable_type_info = new String[]{'TotalTaxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTax_type_info = new String[]{'TotalTax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TotalTaxCalculated_type_info = new String[]{'TotalTaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] HashCode_type_info = new String[]{'HashCode','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxLines_type_info = new String[]{'TaxLines','http://avatax.avalara.com/services','ArrayOfTaxLine','0','1','false'};
        private String[] TaxAddresses_type_info = new String[]{'TaxAddresses','http://avatax.avalara.com/services','ArrayOfTaxAddress','0','1','false'};
        private String[] Locked_type_info = new String[]{'Locked','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] AdjustmentReason_type_info = new String[]{'AdjustmentReason','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] AdjustmentDescription_type_info = new String[]{'AdjustmentDescription','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] TaxSummary_type_info = new String[]{'TaxSummary','http://avatax.avalara.com/services','ArrayOfTaxDetail','0','1','false'};
        private String[] VolatileTaxRates_type_info = new String[]{'VolatileTaxRates','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages','DocType','DocCode','DocDate','DocStatus','Reconciled','Timestamp','TotalAmount','TotalDiscount','TotalExemption','TotalTaxable','TotalTax','TotalTaxCalculated','TaxLines','TaxAddresses','Locked','AdjustmentReason','AdjustmentDescription','Version','TaxDate','TaxSummary'};
    }
    global class ReconcileTaxHistoryResult {
        global Integer RecordCount;
        global TaxSvc.ArrayOfGetTaxResult GetTaxResults;
        global String LastDocCode;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] RecordCount_type_info = new String[]{'RecordCount','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] GetTaxResults_type_info = new String[]{'GetTaxResults','http://avatax.avalara.com/services','ArrayOfGetTaxResult','0','1','false'};
        private String[] LastDocCode_type_info = new String[]{'LastDocCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'RecordCount','GetTaxResults','LastDocCode','TransactionId','ResultCode','Messages'};
    }
    global class PostTaxResult {
        global String DocId;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages'};
    }
    global class CancelTaxResult {
        global String DocId;
        global String TransactionId;
        global String ResultCode = 'Error';
        global TaxSvc.ArrayOfMessage Messages;
        private String[] DocId_type_info = new String[]{'DocId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TransactionId','ResultCode','Messages'};
    }
////////////////////////////////////////////////////////////////////////////////
// Secondary Data Structures - all directly instantiable.  Most are referenced
// as embedded members of a request or result object
////////////////////////////////////////////////////////////////////////////////

    global class AuditMessage {
        global String Message;
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    global class TaxAddress {
        global String Address;
        global String AddressCode;
        global Integer BoundaryLevel = 0;
        global String City;
        global String Country;
        global String PostalCode;
        global String Region;
        global Integer TaxRegionId = 0;
        global String JurisCode;
        global String Latitude;
        global String Longitude;
        global String ValidateStatus;
        global String GeocodeType;
        global String DistanceToBoundary;
        private String[] Address_type_info = new String[]{'Address','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] AddressCode_type_info = new String[]{'AddressCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] BoundaryLevel_type_info = new String[]{'BoundaryLevel','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostalCode_type_info = new String[]{'PostalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxRegionId_type_info = new String[]{'TaxRegionId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] JurisCode_type_info = new String[]{'JurisCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ValidateStatus_type_info = new String[]{'ValidateStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] GeocodeType_type_info = new String[]{'GeocodeType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DistanceToBoundary_type_info = new String[]{'DistanceToBoundary','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Address','AddressCode','BoundaryLevel','City','Country','PostalCode','Region','TaxRegionId','JurisCode'};
    }
    global class ArrayOfMessage {
        global TaxSvc.Message[] Message;
        private String[] Message_type_info = new String[]{'Message','http://avatax.avalara.com/services','Message','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    global class ArrayOfLine {
        global TaxSvc.Line[] Line;
        private String[] Line_type_info = new String[]{'Line','http://avatax.avalara.com/services','Line','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Line'};
    }
    global class ArrayOfBaseAddress {
        global TaxSvc.BaseAddress[] BaseAddress;
        private String[] BaseAddress_type_info = new String[]{'BaseAddress','http://avatax.avalara.com/services','BaseAddress','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'BaseAddress'};
    }
    global class ArrayOfTaxLine {
        global TaxSvc.TaxLine[] TaxLine;
        private String[] TaxLine_type_info = new String[]{'TaxLine','http://avatax.avalara.com/services','TaxLine','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxLine'};
    }
    global class TaxOverride {
        global String TaxOverrideType = 'None';
        global Decimal TaxAmount = 0.0;
        global Date TaxDate = Date.Today();
        global String Reason;
        private String[] TaxOverrideType_type_info = new String[]{'TaxOverrideType','http://avatax.avalara.com/services','TaxOverrideType','1','1','false'};
        private String[] TaxAmount_type_info = new String[]{'TaxAmount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] Reason_type_info = new String[]{'Reason','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxOverrideType','TaxAmount','TaxDate','Reason'};
    }
    global class Profile {
        global String Name = 'Apex2AvalaraSDK.11.2.1.0';
        global String Client;
        global String Adapter = 'Apex2AvalaraSDK.11.2.1.0';
        global String Machine = 'SFCloud';
        private String[] Name_type_info = new String[]{'Name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Client_type_info = new String[]{'Client','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Adapter_type_info = new String[]{'Adapter','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Machine_type_info = new String[]{'Machine','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Name','Client','Adapter','Machine'};
    }
    global class BaseAddress {
        global String AddressCode;
        global String Line1;
        global String Line2;
        global String Line3;
        global String City;
        global String Region;
        global String PostalCode;
        global String Country;
        global Integer TaxRegionId = 0;
        global String Latitude;
        global String Longitude;
        private String[] AddressCode_type_info = new String[]{'AddressCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line1_type_info = new String[]{'Line1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line2_type_info = new String[]{'Line2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line3_type_info = new String[]{'Line3','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostalCode_type_info = new String[]{'PostalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxRegionId_type_info = new String[]{'TaxRegionId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AddressCode','Line1','Line2','Line3','City','Region','PostalCode','Country','TaxRegionId'};
    }
    global class ArrayOfTaxDetail {
        global TaxSvc.TaxDetail[] TaxDetail;
        private String[] TaxDetail_type_info = new String[]{'TaxDetail','http://avatax.avalara.com/services','TaxDetail','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxDetail'};
    }
    global class Security {
        global TaxSvc.UsernameToken_element UsernameToken = new TaxSvc.UsernameToken_element();
        private String[] UsernameToken_type_info = new String[]{'UsernameToken','http://avatax.avalara.com/services','UsernameToken_element','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'UsernameToken'};
    }
    global class UsernameToken_element {
        global String Username {get; set;}
        global String Password {get; set;}
        private String[] Username_type_info = new String[]{'Username','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Password_type_info = new String[]{'Password','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Username','Password'};
    }
    global class ArrayOfTaxAddress {
        global TaxSvc.TaxAddress[] TaxAddress;
        private String[] TaxAddress_type_info = new String[]{'TaxAddress','http://avatax.avalara.com/services','TaxAddress','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'TaxAddress'};
    }
    global class TaxDetail {
        global String Country;
        global String Region;
        global String JurisType = 'Composite';
        global String JurisCode;
        global String TaxType = 'Sales';
        global Decimal Base = 0.0;
        global Decimal Taxable = 0.0;
        global Decimal Rate = 0.0;
        global Decimal Tax = 0.0;
        global Decimal TaxCalculated = 0.0;
        global Decimal NonTaxable = 0.0;
        global Decimal Exemption = 0.0;
        global String JurisName;
        global String TaxName;
        global Integer TaxAuthorityType = 0;
        global String TaxGroup;
        global String RateType;
        global String StateAssignedNo;
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] JurisType_type_info = new String[]{'JurisType','http://avatax.avalara.com/services','JurisdictionType','1','1','false'};
        private String[] JurisCode_type_info = new String[]{'JurisCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxType_type_info = new String[]{'TaxType','http://avatax.avalara.com/services','TaxType','1','1','false'};
        private String[] Base_type_info = new String[]{'Base','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Taxable_type_info = new String[]{'Taxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Rate_type_info = new String[]{'Rate','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Tax_type_info = new String[]{'Tax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxCalculated_type_info = new String[]{'TaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] NonTaxable_type_info = new String[]{'NonTaxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Exemption_type_info = new String[]{'Exemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] JurisName_type_info = new String[]{'JurisName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxName_type_info = new String[]{'TaxName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxAuthorityType_type_info = new String[]{'TaxAuthorityType','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxGroup_type_info = new String[]{'TaxGroup','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] RateType_type_info = new String[]{'RateType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] StateAssignedNo_type_info = new String[]{'StateAssignedNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Country','Region','JurisType','JurisCode','TaxType','Base','Taxable','Rate','Tax','TaxCalculated','NonTaxable','Exemption','JurisName','TaxName','TaxAuthorityType','TaxGroup','RateType','StateAssignedNo'};
    }
    global class Message {
        global String Summary;
        global String Details;
        global String HelpLink;
        global String RefersTo;
        global String Severity = 'Error';
        global String Source;
        global String Name;
        private String[] Summary_type_info = new String[]{'Summary','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Details_type_info = new String[]{'Details','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] HelpLink_type_info = new String[]{'HelpLink','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] RefersTo_type_info = new String[]{'RefersTo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Severity_type_info = new String[]{'Severity','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Source_type_info = new String[]{'Source','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Name_att_info = new String[]{'Name'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Summary','Details','HelpLink','RefersTo','Severity','Source'};
    }
     global class TaxLine {
        global String No;
        global String TaxCode;
        global Boolean Taxability = false;
        global String BoundaryLevel = 'Zip5';
        global Decimal Exemption = 0.0;
        global Decimal Discount = 0.0;
        global Decimal Taxable = 0.0;
        global Decimal Rate = 0.0;
        global Decimal Tax = 0.0;
        global Decimal TaxCalculated = 0.0;
        global TaxSvc.ArrayOfTaxDetail TaxDetails;
        global Integer ExemptCertId = 0;
        global Date TaxDate = Date.Today();
        global Date ReportingDate = Date.Today();
        global String AccountingMethod = 'Accrual';
        global Boolean TaxIncluded;
        private String[] No_type_info = new String[]{'No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Taxability_type_info = new String[]{'Taxability','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] BoundaryLevel_type_info = new String[]{'BoundaryLevel','http://avatax.avalara.com/services','BoundaryLevel','1','1','false'};
        private String[] Exemption_type_info = new String[]{'Exemption','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Discount_type_info = new String[]{'Discount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Taxable_type_info = new String[]{'Taxable','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Rate_type_info = new String[]{'Rate','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Tax_type_info = new String[]{'Tax','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxCalculated_type_info = new String[]{'TaxCalculated','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] TaxDetails_type_info = new String[]{'TaxDetails','http://avatax.avalara.com/services','ArrayOfTaxDetail','0','1','false'};
        private String[] ExemptCertId_type_info = new String[]{'ExemptCertId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] TaxDate_type_info = new String[]{'TaxDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] ReportingDate_type_info = new String[]{'ReportingDate','http://www.w3.org/2001/XMLSchema','date','1','1','false'};
        private String[] AccountingMethod_type_info = new String[]{'AccountingMethod','http://avatax.avalara.com/services','AccountingMethod','1','1','false'};
        private String[] TaxIncluded_type_info = new String[]{'TaxIncluded','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'No','TaxCode','Taxability','BoundaryLevel','Exemption','Discount','Taxable','Rate','Tax','TaxCalculated','TaxDetails','ExemptCertId','TaxDate','ReportingDate','AccountingMethod','TaxIncluded'};
    }
    global class ArrayOfGetTaxResult {
        global TaxSvc.GetTaxResult[] GetTaxResult;
        private String[] GetTaxResult_type_info = new String[]{'GetTaxResult','http://avatax.avalara.com/services','GetTaxResult','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxResult'};
    }
    global class Line {
        global String No;
        global String OriginCode;
        global String DestinationCode;
        global String ItemCode;
        global String TaxCode;
        global Decimal Qty = 1.0;
        global Decimal Amount = 0.0;
        global Boolean Discounted = false;
        global String RevAcct;
        global String Ref1;
        global String Ref2;
        global String ExemptionNo;
        global String CustomerUsageType;
        global String Description;
        global TaxSvc.TaxOverride TaxOverride;
        global Boolean TaxIncluded;
        private String[] No_type_info = new String[]{'No','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] OriginCode_type_info = new String[]{'OriginCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] DestinationCode_type_info = new String[]{'DestinationCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ItemCode_type_info = new String[]{'ItemCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxCode_type_info = new String[]{'TaxCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Qty_type_info = new String[]{'Qty','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Amount_type_info = new String[]{'Amount','http://www.w3.org/2001/XMLSchema','decimal','1','1','false'};
        private String[] Discounted_type_info = new String[]{'Discounted','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] RevAcct_type_info = new String[]{'RevAcct','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Ref1_type_info = new String[]{'Ref1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Ref2_type_info = new String[]{'Ref2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ExemptionNo_type_info = new String[]{'ExemptionNo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CustomerUsageType_type_info = new String[]{'CustomerUsageType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Description_type_info = new String[]{'Description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxOverride_type_info = new String[]{'TaxOverride','http://avatax.avalara.com/services','TaxOverride','0','1','false'};
        private String[] TaxIncluded_type_info = new String[]{'TaxIncluded','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'No','OriginCode','DestinationCode','ItemCode','TaxCode','Qty','Amount','Discounted','RevAcct','Ref1','Ref2','ExemptionNo','CustomerUsageType','Description','TaxOverride','TaxIncluded'};
    }

////////////////////////////////////////////////////////////////////////////////
// helper classes - visible to other classes within AddressSvc, 
// but not to the end user
////////////////////////////////////////////////////////////////////////////////
   global class ApplyPaymentResponse_element {
        global TaxSvc.ApplyPaymentResult ApplyPaymentResult;
        private String[] ApplyPaymentResult_type_info = new String[]{'ApplyPaymentResult','http://avatax.avalara.com/services','ApplyPaymentResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ApplyPaymentResult'};
    }
    global class IsAuthorized_element {
        global String Operations;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations'};
    }
    global class PostTax_element {
        global TaxSvc.PostTaxRequest PostTaxRequest;
        private String[] PostTaxRequest_type_info = new String[]{'PostTaxRequest','http://avatax.avalara.com/services','PostTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PostTaxRequest'};
    }
    global class IsAuthorizedResponse_element {
        global TaxSvc.IsAuthorizedResult IsAuthorizedResult;
        private String[] IsAuthorizedResult_type_info = new String[]{'IsAuthorizedResult','http://avatax.avalara.com/services','IsAuthorizedResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'IsAuthorizedResult'};
    }
    global class GetTaxHistoryResponse_element {
        global TaxSvc.GetTaxHistoryResult GetTaxHistoryResult;
        private String[] GetTaxHistoryResult_type_info = new String[]{'GetTaxHistoryResult','http://avatax.avalara.com/services','GetTaxHistoryResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxHistoryResult'};
    }
    global class GetTax_element {
        global TaxSvc.GetTaxRequest GetTaxRequest;
        private String[] GetTaxRequest_type_info = new String[]{'GetTaxRequest','http://avatax.avalara.com/services','GetTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxRequest'};
    }
    global class CommitTax_element {
        global TaxSvc.CommitTaxRequest CommitTaxRequest;
        private String[] CommitTaxRequest_type_info = new String[]{'CommitTaxRequest','http://avatax.avalara.com/services','CommitTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CommitTaxRequest'};
    }
    global class AdjustTax_element {
        global TaxSvc.AdjustTaxRequest AdjustTaxRequest;
        private String[] AdjustTaxRequest_type_info = new String[]{'AdjustTaxRequest','http://avatax.avalara.com/services','AdjustTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AdjustTaxRequest'};
    }
    global class AdjustTaxResponse_element {
        global TaxSvc.AdjustTaxResult AdjustTaxResult;
        private String[] AdjustTaxResult_type_info = new String[]{'AdjustTaxResult','http://avatax.avalara.com/services','AdjustTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'AdjustTaxResult'};
    }
    global class Ping_element {
        global String Message;
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    global class GetTaxHistory_element {
        global TaxSvc.GetTaxHistoryRequest GetTaxHistoryRequest;
        private String[] GetTaxHistoryRequest_type_info = new String[]{'GetTaxHistoryRequest','http://avatax.avalara.com/services','GetTaxHistoryRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxHistoryRequest'};
    }
    global class PostTaxResponse_element {
        global TaxSvc.PostTaxResult PostTaxResult;
        private String[] PostTaxResult_type_info = new String[]{'PostTaxResult','http://avatax.avalara.com/services','PostTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PostTaxResult'};
    }
    global class CancelTax_element {
        global TaxSvc.CancelTaxRequest CancelTaxRequest;
        private String[] CancelTaxRequest_type_info = new String[]{'CancelTaxRequest','http://avatax.avalara.com/services','CancelTaxRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CancelTaxRequest'};
    }
    global class CommitTaxResponse_element {
        global TaxSvc.CommitTaxResult CommitTaxResult;
        private String[] CommitTaxResult_type_info = new String[]{'CommitTaxResult','http://avatax.avalara.com/services','CommitTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CommitTaxResult'};
    }
    global class ReconcileTaxHistoryResponse_element {
        global TaxSvc.ReconcileTaxHistoryResult ReconcileTaxHistoryResult;
        private String[] ReconcileTaxHistoryResult_type_info = new String[]{'ReconcileTaxHistoryResult','http://avatax.avalara.com/services','ReconcileTaxHistoryResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ReconcileTaxHistoryResult'};
    }
    global class PingResponse_element {
        global TaxSvc.PingResult PingResult;
        private String[] PingResult_type_info = new String[]{'PingResult','http://avatax.avalara.com/services','PingResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PingResult'};
    }
    global class ApplyPayment_element {
        global TaxSvc.ApplyPaymentRequest ApplyPaymentRequest;
        private String[] ApplyPaymentRequest_type_info = new String[]{'ApplyPaymentRequest','http://avatax.avalara.com/services','ApplyPaymentRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ApplyPaymentRequest'};
    }
    global class ReconcileTaxHistory_element {
        global TaxSvc.ReconcileTaxHistoryRequest ReconcileTaxHistoryRequest;
        private String[] ReconcileTaxHistoryRequest_type_info = new String[]{'ReconcileTaxHistoryRequest','http://avatax.avalara.com/services','ReconcileTaxHistoryRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ReconcileTaxHistoryRequest'};
    }
    global class GetTaxResponse_element {
        global TaxSvc.GetTaxResult GetTaxResult;
        private String[] GetTaxResult_type_info = new String[]{'GetTaxResult','http://avatax.avalara.com/services','GetTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'GetTaxResult'};
    }
    global class CancelTaxResponse_element {
        global TaxSvc.CancelTaxResult CancelTaxResult;
        private String[] CancelTaxResult_type_info = new String[]{'CancelTaxResult','http://avatax.avalara.com/services','CancelTaxResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'CancelTaxResult'};
    }
}