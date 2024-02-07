namespace com.satinfotech.Electronic;
using { managed,cuid } from '@sap/cds/common';
@assert.unique:{
    bp_no:[bp_no]
}

entity Business_partner: cuid,managed  {
    @title:'Business Partner Number'
    bp_no: String(10);
    @title: 'Name'
    name:String(30) @mandatory;
    @title:'Address 1'
    address1:String(50)@mandatory;
    @title:'Address 2'
    address2:String(50);
    @title: 'City'
    city:String(20)@mandatory;
    @title:'State'
    state: Association to States;
    @title:'Pincode'
    pincode:String(10) @mandatory;
    @title:'is_gstn_reg'
    is_gstn_reg:Boolean;
    @title:'is_vender'
    is_vendor : Boolean;
    @title:'is_customer'
    is_customer :Boolean;


}


entity States{
    @title :'State'
    key State:String(40);
}

entity Store: cuid,managed  {
    @title:'Store id'
    st_id: String(10);
    @title: 'Name'
    name:String(30) @mandatory;
    @title:'Address 1'
    address1:String(50)@mandatory;
    @title:'Address 2'
    address2:String(50);
    @title: 'City'
    city:String(20)@mandatory;
    @title:'State'
    state: Association to States;
    @title:'Pincode'
    pincode:String(10) @mandatory;

}

entity Product: cuid,managed  {
    @title:'Product id'
    product_id: String(10);
    @title: 'Name'
    p_name:String(30) ;
    @title: 'image'
    img_url:String(100);
    @title:'cost price'
    costprice: Association to States;
    @title:'selling price'
    sellingprice:String(10) ;

}

