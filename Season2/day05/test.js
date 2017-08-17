'use strict';
const Fs = require('fire-fs');

function add(val_a) {
    var a = val_a;
    var b = 2;
    var c = a + b;
}

var obj = {
    concatStr: function () {
	for (var i = 0; i < 10; ++i){
	    var a = "Hello";
	    
	}
	var b = "world";
	var c = a + " " + b;
    },

    func1 : function () {
	this.concatStr();
    },
    func2 : function () {
	add(1, 1);
    }
};

describe('Native Module', function() {
} );
