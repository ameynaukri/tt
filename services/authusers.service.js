var Contact = require('../models/user.model'),
    moment = require('moment'),
    promise = require('bluebird'),
    helperServices = require('../services/helper.service'),
    errorTypes = require('../errortypes');
//var crypto = require("crypto");


exports.addReg2 = function(params) {
    console.log("addReg");
    
    var username = (params.username) ? params.username : false;
    var password  = (params.password ) ? params.password  : false;
    var Contactdata = new Contact({
        "username": username,
        "password":  password ,
    });

    return Contactdata.save(null).tap(function(model) {
        Contactdata = model;
        return Contactdata;
    }).then(function(Contactdata) {
        return Contactdata;
    }).catch(function(err) {
        return err;
    });

}

exports.editReg2 = function(params) {
    var username = (params.username) ? params.username : false;
    var password  = (params.password ) ? params.password  : false;
    var id = (params.id) ? params.id : false;
    params = {
        "username": username,
        "password": password,
    }
    var updateParams = {
        patch: true
    }
    var data = params;
        return Contact.forge().query(function(qb) {
            qb.where('id', id);
        }).fetchAll().then(function(products) {
            products.forEach(function(products) {
            return products.save(data, updateParams);
        });
    }).catch(function(err) {
        console.log(err);
        return err;
    });

}






exports.deleteReord = function(id){
    console.log("service delete parking = " + id);
    return Contact.forge().query(function(qp){
        qp.where('id', id);
    }).fetch().then(function(model){
        model.destroy().then(function(data){
            console.log("deleted");
        });
    });
}