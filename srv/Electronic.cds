using { com.satinfotech.Electronic as db} from '../db/schema';


service Electronic{
    entity Business_partner as projection on db.Business_partner;
    entity States as projection on db.States;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;

}

annotate Electronic.Business_partner with @odata.draft.enabled;
annotate Electronic.Store with @odata.draft.enabled;

annotate Electronic.States with @(
    UI.LineItem:[
          {
         $Type : 'UI.DataField',
            Value :  State 
        },
    ]
);
annotate Electronic.Business_partner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'states',
            CollectionPath : 'state',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_State,
                    ValueListProperty : 'State'
                },
               
            ]
        }
    );

}
 annotate Electronic.Business_partner with {
    bp_no @assert.format:'^[a-zA-z]{2}[0-9]{4}';
    pincode @assert.format:'^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$';
}


annotate Electronic.Business_partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bp_no
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state_State
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
      

    ],
    UI.SelectionFields: [ bp_no , pincode, name],       
);


annotate Electronic.Business_partner with @(
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
                   {
            $Type : 'UI.DataField',
            Value : bp_no
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state_State
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
   
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BInfoFacet',
            Label : 'Business partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
    ],
    
);

annotate Electronic.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : st_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state_State
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
      

    ],
    UI.SelectionFields: [ st_id , pincode, name],       
);


annotate Electronic.Store with @(
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
                   {
            $Type : 'UI.DataField',
            Value : st_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state_State
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
   
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
    ],
    
);
annotate Electronic.Store with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'states',
            CollectionPath : 'state',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_State,
                    ValueListProperty : 'State'
                },
               
            ]
        }
    );

}

annotate Electronic.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : p_name
        },
        {
            $Type : 'UI.DataField',
            Value : img_url
        },
        {
            $Type : 'UI.DataField',
            Value : costprice
        },
        {
            $Type : 'UI.DataField',
            Value : sellingprice
        },
       
      

    ],      
);


annotate Electronic.Product with @(
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
                {
            $Type : 'UI.DataField',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : p_name
        },
        {
            $Type : 'UI.DataField',
            Value : img_url
        },
        {
            $Type : 'UI.DataField',
            Value : costprice
        },
        {
            $Type : 'UI.DataField',
            Value : sellingprice
        },
   
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'productInfoFacet',
            Label : 'product Information',
            Target : '@UI.FieldGroup#productInformation',
        },
    ],
    
);