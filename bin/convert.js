#!/usr/bin/env node

var fs = require('fs');

var getAsJson = function(filePath) {
    var data = fs.readFileSync(filePath, { encoding: 'utf8' });
    return JSON.parse(data);
};

var walk = function walk(obj, fn) {
    Object.keys(obj).forEach(function(key) {
        var value = obj[key];

        if (typeof value === 'string' || typeof value === 'number') {
            return fn(value);
        }

        if (Array.isArray(value)) {
            return value.forEach(function(oneValue) {
                return walk(oneValue, fn);
            });
        }

        if (typeof value === 'object') {
            return walk(value, fn);
        }
    });
};

var files = process.argv.slice(2);
console.log('<!DOCTYPE html> <html lang="en"> <head> <meta charset="UTF-8"> <title></title> </head> <body>');
files.forEach(function(oneFile) {
    var json = getAsJson(oneFile);
    walk(json, function(str) {
        console.log(str, '<br><br>');
    });
});
console.log('</body> </html>');
