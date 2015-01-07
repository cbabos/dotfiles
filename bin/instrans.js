/**
 * LibreOffice-al mentsük ki a visszakapott doksit HTML formátumba.
 * A küldött dokumentumnak a convert.js-sel kellett készülnie.
 */

var fs = require('fs');
var origJSON = {};

var prevLabel = '';

var isLabel = function(text) {
    return text.indexOf('app.') === 0 || text.indexOf('content.') === 0;
}
var prepVar = function prepVar(srcVar, parts, value) {
    var currPart = parts.shift();
    if (parts.length === 0) {
        srcVar[currPart] = srcVar[currPart] || "";

        if (value === null) {
            srcVar[currPart] = '';
        } else {
            srcVar[currPart] = srcVar[currPart] + value.trim();
        }
    } else {
        srcVar[currPart] = srcVar[currPart] || {};
        prepVar(srcVar[currPart], parts, value);
    }
};
var setPrevLabelData = function(label, text) {
    var parts = label.split('.');
    prepVar(origJSON, parts, text);
}

var parseHTML = function( jsonFile, htmlFile ) {
    fs.readFile( htmlFile, 'utf-8', function( err, data ) {
        // Replace empty P tags to br
        data = data.replace(/<p[^>]*>\s*<\/p>/g, '<br>')
                 .replace(/\s*<br\s*\/?>\s*<\/p>/g, '</p>')
                    // The following is causing freezing in current webkit,
                    // so you need to remove the <?xml...<body...> header by hand.
                    /*.
                    replace(/<\?xml(?:.|\s)*<body[^>]*>/g, '')*/
                  .replace(/(>)([^>]+)(<)/g, function(match, p1, p2, p3) {
                    if (isLabel(p2)) {
                        prevLabel = p2;
                        setPrevLabelData(p2, null);
                    } else {
                        setPrevLabelData(prevLabel, p2);
                    }
                  });
        fs.writeFileSync(jsonFile, JSON.stringify(origJSON, null, "  "));
    });
};

var parseOldJSON = function( jsonFile, htmlFile ) {
    fs.readFile( jsonFile, 'utf-8', function( err, data ) {
        origJSON = JSON.parse(data);
        parseHTML( jsonFile, htmlFile );
    });
};

parseOldJSON(process.argv[3], process.argv[2]);
