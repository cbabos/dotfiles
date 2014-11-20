#!/usr/bin/env node

var fs = require('fs');

var getAsJson = function(filePath) {
    var data = fs.readFileSync(filePath, { encoding: 'utf8' });
    return JSON.parse(data);
};

var walk = function walk(obj, fn, prefixes) {
    if (typeof prefixes === "undefined") {
        prefixes = [];
    }

    Object.keys(obj).forEach(function(key) {
        var value = obj[key];

        if (typeof value === 'string' || typeof value === 'number') {
            var currentPath = prefixes.concat(key);
            return fn(value, currentPath);
        }

        if (Array.isArray(value)) {
            return value.forEach(function(oneValue) {
                return walk(oneValue, fn);
            });
        }

        if (typeof value === 'object') {
            var currentPath = prefixes.concat(key);
            return walk(value, fn, currentPath);
        }
    });
};

var files = process.argv.slice(2);
console.log('<!DOCTYPE html> <html lang="en"> <head> <meta charset="UTF-8"> <title></title> <style>.label{font-style: italic; background: #afafaf; display: block;}</style> </head> <body>');
files.forEach(function(oneFile) {
    var json = getAsJson(oneFile);
    walk(json, function(str, path) {
        console.log('<div class="label">', path.join('.'), '</div>', str, '<br><br>');
    });
});
console.log('</body> </html>');
