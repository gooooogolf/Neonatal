/**
 * 
 * @author 006223
 * 
 */

function groupBy(arr, property) {
	var arrResult = {};
	for ( var i=0; i < arr.length; i++ )
		arrResult[arr[i][property]] = arr[i];

	arr = [];
	for ( key in arrResult )
		arr.push(arrResult[key]);
	return arr;
}

function orderBy(property) {
    var sortOrder = 1;
    if(property[0] === "-") {
        sortOrder = -1;
        property = property.substr(1);
    }
    return function (a,b) {
        var result = (a[property] < b[property]) ? -1 : (a[property] > b[property]) ? 1 : 0;
        return result * sortOrder;
    };
}