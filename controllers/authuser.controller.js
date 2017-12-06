var config = require('../config'),
    User = require('../models/user.model'),
    fs = require("fs"),
    bPromise = require("bluebird"),
    authusers = require('../services/authusers.service'),
    Passport = require('passport');
orm = require('../orm');

/*var config = require('../config'),
    User = require('../models/user.model'),
    authusers = require('../services/authusers.service'),
    moment = require('moment'),
    moment_tz = require('moment-timezone'),
    fs = require("fs"),
    bPromise = require("bluebird"),
    Passport = require('passport');
orm = require('../orm');
var DateDiff = require('date-diff');
var crypto = require('crypto');
var request = require('request');
var excelbuilder = require('msexcel-builder');*/
exports.authorizseUser = function(req, res, next) {
    if (!req.isAuthenticated()) {
        return res.status(401).send({
            "error": true,
            "status": "error",
            "message": "User is not authorized",
            "result": "User is not authorized"
        });
    }

    next();
}
//login
exports.login = function(req, res, next) {
    console.log("login");

    var password = (req.body.password) ? req.body.password : false;
    var username = (req.body.username) ? req.body.username : false;
    //id = (req.body.id)?req.body.id:false;



    console.log("Password :" + password);
    console.log("User name /Email :" + username);

    if (password)
        req.body.password = password;
    if (!req.body.password || !username) {
        return res.json({
            "StatusCode": 304,
            "result": "Please send required parameter.",
            "ResponseMessage": "Please send required parameter."
        });
    } else {
        return Passport.authenticate('local',
            function(err, user, info) {
                if (err) {
                    return errors.returnError(err, res);
                }
                if (!user) {
                    if (info.error == true && info.statusCode == 201) {
                        return res.json({
                            "StatusCode": 404,
                            "result": null,
                            "ResponseMessage": "User doesn't exist."
                        });
                    } else if (info.error == true && info.statusCode == 202) {
                        return res.json({
                            "StatusCode": 401,
                            "result": [],
                            "ResponseMessage": "Invalid Password."
                        });

                    }
                } else {
                    return req.logIn(user, function(err) {
                        return res.json({
                                "StatusCode": 200,
                                "result": user,
                                "ResponseMessage": "This is a valid user"
                            });
                       
                    });
                }
            }
        )(req, res, next);
    }
};


exports.allcustomer =function(req,res){
    var AllUsers = User.forge().query(function(qb) {
        qb.select("*")
    }).fetchAll().then(function(addy) {
        return addy;
    });/*.then(function(addy) {
        
    });*/

    AllUsers.then(function(AllUsers) {
        if (AllUsers.length == 0) {
            var AllUsers = [];
            res.json({
                "error": true,
                status: "error",
                "ResponseMessage": "No Records Found",
                result: AllUsers
            });
        } else {
            res.json({
                "error": false,
                status: "success",
                "ResponseMessage": "",
                result: AllUsers
            });
        }
    }).catch(function(err) {
        return errors.returnError(err, res);
    });
}

exports.deleteReord = function(req, res) {
    console.log("controller delete parking");
    var id = (req.query.id) ? req.query.id : false;
    //var id = (id) ? req.query.id : false;
    console.log("==========================================="+id);
    return authusers.deleteReord(id).then(function(formate) {
        return formate;
    }).then(function(formate) {
        return formate;
    }).catch(function(err) {
        return errors.returnError(err, res);
    }).then(function(data) {
    res.json({
        "error": false,
        "Status": "Success",
        "ResponseMessage": "Record Deleted Successfully.",
        "result": data
    });
    }).catch(function(err) {
        return errors.returnError(err, res);
    });
}


exports.getAllRecords =function(req,res){
    var AllUsers = User.forge().query(function(qb) {
        qb.select("*")
        qb.where({
            "id": 301
        });
    }).fetchAll().then(function(addy) {
        return addy;
    });/*.then(function(addy) {
        
    });*/

    AllUsers.then(function(AllUsers) {
        if (AllUsers.length == 0) {
            var AllUsers = [];
            res.json({
                "error": true,
                status: "error",
                "ResponseMessage": "No Records Found",
                result: AllUsers
            });
        } else {
            res.json({
                "error": false,
                status: "success",
                "ResponseMessage": "",
                result: AllUsers
            });
        }
    }).catch(function(err) {
        return errors.returnError(err, res);
    });
}


exports.editReg = function(req, res) {
    console.log("-----------------------------------------");
    console.log(req.body);    
    console.log("-----------------------------------------");
    return authusers.editReg2(req.body).then(function(regDetail) {
        if (regDetail) {
            res.json({
                "StatusCode": 200,
                "regDetail": regDetail,
                "ResponseMessage": "Registration done successfully !!!"
            });
        } else {
            res.json({
                "StatusCode": 301,
                "regDetail": regDetail,
                "ResponseMessage": "An error has occurred."
            });
        }
    });
}

exports.addReg = function(req, res) {
    console.log(req.body);    
    return authusers.addReg2(req.body).then(function(regDetail) {
        if (regDetail) {
            res.json({
                "StatusCode": 200,
                "regDetail": regDetail,
                "ResponseMessage": "Registration done successfully !!!"
            });
        } else {
            res.json({
                "StatusCode": 301,
                "regDetail": regDetail,
                "ResponseMessage": "An error has occurred."
            });
        }
    });
}

