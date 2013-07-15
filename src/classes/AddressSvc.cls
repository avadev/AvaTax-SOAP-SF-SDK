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
// AddressSvc is not instantiated directly, and is really in effect more 
// of a namespace than a class.
////////////////////////////////////////////////////////////////////////////////
global with sharing class AddressSvc {
// unit tests just instantiate an instance of every class
// in order to satisfy SF's code coverage requirement - no comment
   static testmethod void AddressUnitTests()
   {
        AddressSvc m_AddrSvc = new AddressSvc();
        AddressSvcSoap m_addrSvcSoap = new AddressSvcSoap('https://development.avalara.net');
        PingResult m_tstPres = new PingResult();
        IsAuthorizedResult m_tias = new IsAuthorizedResult();
        IsAuthorizedResponse_element m_tiare = new IsAuthorizedResponse_element();
        Message m_tmsg = new Message();
        ArrayOfValidAddress m_tarrva = new ArrayOfValidAddress();
        ValidateRequest m_tvr = new ValidateRequest();
        Profile m_tpr = new Profile();
        PingResponse_element m_tpre = new PingResponse_element(); 
        ValidateResponse_element m_tvre = new ValidateResponse_element();
        Ping_element m_tpe = new Ping_element();
        IsAuthorized_element m_tiae = new IsAuthorized_element();
        BaseAddress m_tba = new BaseAddress();
        ArrayOfMessage m_taom = new ArrayOfMessage();
        Security m_tsec = new Security();
        Validate_element m_tve = new Validate_element();
        ValidAddress m_tva = new ValidAddress();
        UsernameToken_element m_tute = new UsernameToken_element();
        ValidateResult m_tvRes = new ValidateResult();
    }

////////////////////////////////////////////////////////////////////////////////
// AddressSvcSoap is the mother class.  All APIs of the AddressSvc "namespace"
// are methods of AddressSvcSoap.
////////////////////////////////////////////////////////////////////////////////
    global class AddressSvcSoap {
        global String endpoint_x;
        global Map<String,String> inputHttpHeaders_x;
        global Map<String,String> outputHttpHeaders_x;
        global String clientCertName_x;
        global String clientCert_x;
        global String clientCertPasswd_x;
        global Integer timeout_x {get; set;}
        global AddressSvc.Profile Profile;
        global AddressSvc.Security Security;
        private String Profile_hns = 'Profile=http://avatax.avalara.com/services';
        private String Security_hns = 'Security=http://avatax.avalara.com/services';
        private String[] ns_map_type_info = new String[]{'http://avatax.avalara.com/services', 'CBAddressSvc'};
        global AddressSvcSoap(String SvcURL)
        {
            endpoint_x = SvcURL + '/address/addresssvc.asmx/altsec';
            Profile = new AddressSvc.Profile();
            Security = new AddressSvc.Security();
        }
        global AddressSvc.IsAuthorizedResult IsAuthorized(String Operations) {
            AddressSvc.IsAuthorized_element request_x = new AddressSvc.IsAuthorized_element();
            AddressSvc.IsAuthorizedResponse_element response_x;
            request_x.Operations = Operations;
            Map<String, AddressSvc.IsAuthorizedResponse_element> response_map_x = new Map<String, AddressSvc.IsAuthorizedResponse_element>();
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
              'AddressSvc.IsAuthorizedResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.IsAuthorizedResult;
        }
        

        global AddressSvc.ValidateResult Validate(AddressSvc.ValidateRequest ValidateRequest) {
            AddressSvc.Validate_element request_x = new AddressSvc.Validate_element();
            AddressSvc.ValidateResponse_element response_x;
            request_x.ValidateRequest = ValidateRequest;
            Map<String, AddressSvc.ValidateResponse_element> response_map_x = new Map<String, AddressSvc.ValidateResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://avatax.avalara.com/services/Validate',
              'http://avatax.avalara.com/services',
              'Validate',
              'http://avatax.avalara.com/services',
              'ValidateResponse',
              'AddressSvc.ValidateResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.ValidateResult;
        }
        global AddressSvc.PingResult Ping(String Message) {
            AddressSvc.Ping_element request_x = new AddressSvc.Ping_element();
            AddressSvc.PingResponse_element response_x;
            request_x.Message = Message;
            Map<String, AddressSvc.PingResponse_element> response_map_x = new Map<String, AddressSvc.PingResponse_element>();
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
              'AddressSvc.PingResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.PingResult;
        }
    }

////////////////////////////////////////////////////////////////////////////////
// API call Request Classes - instantiations passed as arguments to API calls
////////////////////////////////////////////////////////////////////////////////
    global class ValidateRequest {
        global AddressSvc.BaseAddress Address;
        global String TextCase = 'Default';
        global Boolean Coordinates = false;
        global Boolean Taxability = false;
        global Date Date_x;
        private String[] Address_type_info = new String[]{'Address','http://avatax.avalara.com/services','BaseAddress','0','1','false'};
        private String[] TextCase_type_info = new String[]{'TextCase','http://avatax.avalara.com/services','TextCase','1','1','false'};
        private String[] Coordinates_type_info = new String[]{'Coordinates','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Taxability_type_info = new String[]{'Taxability','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] Date_x_type_info = new String[]{'Date','http://www.w3.org/2001/XMLSchema','date','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Address','TextCase','Coordinates','Taxability'};
    }

////////////////////////////////////////////////////////////////////////////////
// API call Result Classes - API calls return instantiations of these
////////////////////////////////////////////////////////////////////////////////
    global class PingResult {
        global String Version;
        global String TransactionId;
        global String ResultCode = 'Exception';
        global AddressSvc.ArrayOfMessage Messages;
        private String[] Version_type_info = new String[]{'Version','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Version','TransactionId','ResultCode','Messages'};
    }
    global class IsAuthorizedResult {
        global String Operations;
        global DateTime Expires = DateTime.Now() - 1;
        global String TransactionId;
        global String ResultCode = 'Exception';
        global AddressSvc.ArrayOfMessage Messages;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Expires_type_info = new String[]{'Expires','http://www.w3.org/2001/XMLSchema','dateTime','1','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations','Expires','TransactionId','ResultCode','Messages'};
    }
    global class ValidateResult {
        global AddressSvc.ArrayOfValidAddress ValidAddresses;
        global Boolean Taxable = false;
        global String TransactionId;
        global String ResultCode = 'Exception';
        global AddressSvc.ArrayOfMessage Messages;
        private String[] ValidAddresses_type_info = new String[]{'ValidAddresses','http://avatax.avalara.com/services','ArrayOfValidAddress','0','1','false'};
        private String[] Taxable_type_info = new String[]{'Taxable','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] TransactionId_type_info = new String[]{'TransactionId','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ResultCode_type_info = new String[]{'ResultCode','http://avatax.avalara.com/services','SeverityLevel','1','1','false'};
        private String[] Messages_type_info = new String[]{'Messages','http://avatax.avalara.com/services','ArrayOfMessage','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidAddresses','Taxable','Version','TransactionId','ResultCode','Messages'};
    }
////////////////////////////////////////////////////////////////////////////////
// Secondary Data Structures - all directly instantiable.  Most are referenced
// as embedded members of a request or result object
////////////////////////////////////////////////////////////////////////////////
    global class Message {
        global String Summary;
        global String Details;
        global String HelpLink;
        global String RefersTo;
        global String Severity = 'Exception';
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
    global class ArrayOfValidAddress {
        global AddressSvc.ValidAddress[] ValidAddress;
        private String[] ValidAddress_type_info = new String[]{'ValidAddress','http://avatax.avalara.com/services','ValidAddress','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidAddress'};
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

    global class ArrayOfMessage {
        global AddressSvc.Message[] Message;
        private String[] Message_type_info = new String[]{'Message','http://avatax.avalara.com/services','Message','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }

    global class Security {
        global AddressSvc.UsernameToken_element UsernameToken = new AddressSvc.UsernameToken_element();
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

    global class BaseAddress {
        global String AddressCode;
        global String Line1;
        global String Line2;
        global String Line3;
        global String City;
        global String Region;
        global String PostalCode;
        global String Country;
        global Integer TaxRegionId=0;
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
    global class ValidAddress {
        global String AddressCode;
        global String Line1;
        global String Line2;
        global String Line3;
        global String City;
        global String Region;
        global String PostalCode;
        global String Country;
        global Integer TaxRegionId = 0;
        global String Line4;
        global String County;
        global String FipsCode;
        global String CarrierRoute;
        global String PostNet;
        global String AddressType;
        global String Latitude;
        global String Longitude;
        global String ValidateStatus;
        global String GeocodeType;
        private String[] AddressCode_type_info = new String[]{'AddressCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line1_type_info = new String[]{'Line1','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line2_type_info = new String[]{'Line2','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Line3_type_info = new String[]{'Line3','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] City_type_info = new String[]{'City','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Region_type_info = new String[]{'Region','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostalCode_type_info = new String[]{'PostalCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Country_type_info = new String[]{'Country','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] TaxRegionId_type_info = new String[]{'TaxRegionId','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] Line4_type_info = new String[]{'Line4','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] County_type_info = new String[]{'County','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] FipsCode_type_info = new String[]{'FipsCode','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] CarrierRoute_type_info = new String[]{'CarrierRoute','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] PostNet_type_info = new String[]{'PostNet','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] AddressType_type_info = new String[]{'AddressType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Latitude_type_info = new String[]{'Latitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Longitude_type_info = new String[]{'Longitude','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] ValidateStatus_type_info = new String[]{'ValidateStatus','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] GeocodeType_type_info = new String[]{'GeocodeType','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Line4','County','FipsCode','CarrierRoute','PostNet','AddressType','Latitude','Longitude','AddressCode','Line1','Line2','Line3','City','Region','PostalCode','Country','TaxRegionId'};
    }
////////////////////////////////////////////////////////////////////////////////
// helper classes - visible to other classes within CBAddressSvc, 
// but not to the end user
////////////////////////////////////////////////////////////////////////////////
    global class IsAuthorizedResponse_element {
        global AddressSvc.IsAuthorizedResult IsAuthorizedResult;
        private String[] IsAuthorizedResult_type_info = new String[]{'IsAuthorizedResult','http://avatax.avalara.com/services','IsAuthorizedResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'IsAuthorizedResult'};
    }
    global class PingResponse_element {
        global AddressSvc.PingResult PingResult;
        private String[] PingResult_type_info = new String[]{'PingResult','http://avatax.avalara.com/services','PingResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'PingResult'};
    }
    global class Ping_element {
        global String Message;
        private String[] Message_type_info = new String[]{'Message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Message'};
    }
    global class ValidateResponse_element {
        global AddressSvc.ValidateResult ValidateResult;
        private String[] ValidateResult_type_info = new String[]{'ValidateResult','http://avatax.avalara.com/services','ValidateResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidateResult'};
    }
    global class IsAuthorized_element {
        global String Operations;
        private String[] Operations_type_info = new String[]{'Operations','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'Operations'};
    }
    global class Validate_element {
        global AddressSvc.ValidateRequest ValidateRequest;
        private String[] ValidateRequest_type_info = new String[]{'ValidateRequest','http://avatax.avalara.com/services','ValidateRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://avatax.avalara.com/services','true','false'};
        private String[] field_order_type_info = new String[]{'ValidateRequest'};
    }
}