/**
 * 
 * @author 006223
 * 
 */
///DATE//// 2014-05-02

function zeroFill(number, width){
  width -= number.toString().length;
  if(width > 0)
  {
    return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
  }
  return number + "";
}

function BUDDHIST_2_DATE(strDate, strSplit, isShortMonth){
	var retDate = null;
	try{
		var monthNames;
		(isShortMonth!=null||isShortMonth!=undefined)?isShortMonth ? monthNames = ["ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค."] : monthNames = ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน', 'กรกฏาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']:monthNames = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];			
		var strDateSplit = strDate.split(strSplit);
		var year = strDateSplit[2];
		var month = strDateSplit[1];
		var date  = strDateSplit[0]; 
		
		for(var i=0;i<monthNames.length;i++){
			if(month == monthNames[i]){
				month = i;
				break;
			}
		}
		try{
			var yearSplit  = year.split(" ");
			var timeSplit = yearSplit[1].split(":");
			retDate =  new Date(parseInt(yearSplit[0],10)-543, parseInt(month,10), parseInt(date, 10), parseInt(timeSplit[0],10), parseInt(timeSplit[1],10), parseInt(timeSplit[2],10));
		}catch(e){
			try{
				var timeSplit = strDateSplit[3].split(":");
				retDate = new Date(parseInt(year,10)-543, parseInt(month,10), parseInt(date, 10), parseInt(timeSplit[0],10), parseInt(timeSplit[1],10), parseInt(timeSplit[2],10));
			}catch(e){
				retDate = new Date(parseInt(year,10)-543, parseInt(month,10), parseInt(date, 10));
			}	
		}		
	}catch(e){
		return retDate;
	}	
	return retDate;	
}

function DATE_2_BUDDHIST(dateNow, isShortMonth, isMinutes){
	try{
		var monthNames;
		(isShortMonth!=null||isShortMonth!=undefined)?isShortMonth ? monthNames = ["ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค."] : monthNames = ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน', 'กรกฏาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']:monthNames = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
		return (dateNow.getDate() + ' ' + monthNames[parseInt(dateNow.getMonth(),10)] + ' ' + (parseInt(dateNow.getFullYear(),10)+543))+
		((isMinutes!=null||isMinutes!=undefined)?(isMinutes)?' '+zeroFill(parseInt(dateNow.getHours(),10),2)+':'+zeroFill(parseInt(dateNow.getMinutes(),10),2)+':'+zeroFill(parseInt(dateNow.getSeconds(),10),2):'':'');;
	}catch(e){
		return null;
	}
}

function DATE_2_STRDATE_DD_MM_YYYY(dateNow, strSplit, isMinutes) {
	try{
		return zeroFill(dateNow.getDate(),2)+strSplit+zeroFill((parseInt(dateNow.getMonth(), 10)+1),2)+strSplit+dateNow.getFullYear()+
		((isMinutes!=null||isMinutes!=undefined)?(isMinutes)?' '+zeroFill(parseInt(dateNow.getHours(),10),2)+':'+zeroFill(parseInt(dateNow.getMinutes(),10),2)+':'+zeroFill(parseInt(dateNow.getSeconds(),10),2):'':'');
	}catch(e){
		return null;
	}
}

function DATE_2_STRDATE_YYYY_MM_DD(dateNow, strSplit, isMinutes){
	try{	
		return dateNow.getFullYear()+strSplit+zeroFill((parseInt(dateNow.getMonth(), 10)+1),2)+strSplit+zeroFill(dateNow.getDate(),2)+
		((isMinutes!=null||isMinutes!=undefined)?(isMinutes)?' '+zeroFill(parseInt(dateNow.getHours(),10),2)+':'+zeroFill(parseInt(dateNow.getMinutes(),10),2)+':'+zeroFill(parseInt(dateNow.getSeconds(),10),2):'':'');
	}catch(e){
		return null;
	}
}

function STRDATE_DD_MM_YYYY_2_DATE(strDate, strSplit){
	var retDate = null;
	try{ 
	// 28/11/2008 00:00:00 
		var strDateSplit = strDate.split(strSplit);
		var year = strDateSplit[2];
		var month = strDateSplit[1];
		var date  = strDateSplit[0]; 
		try{
			var yearSplit  = year.split(" ");
			var timeSplit = yearSplit[1].split(":");
			retDate =  new Date(parseInt(yearSplit[0],10), parseInt(month,10)-1, parseInt(date, 10), parseInt(timeSplit[0],10), parseInt(timeSplit[1],10), parseInt(timeSplit[2],10));
// 			console.log('try '+retDate);dateNow
		}catch(e){
			retDate = new Date(parseInt(year,10), parseInt(month,10)-1, parseInt(date, 10));
// 			console.log('catch '+retDate);
		}		
	}catch(e){
// 		console.log('catch x '+retDate);
		return retDate;
	}	
	return retDate;
}

function STRDATE_YYYY_MM_DD_2_DATE(strDate, strSplit){
	var retDate = null;
	try{ 
	// 2008-12-31 00:00:00 
		var strDateSplit = strDate.split(strSplit);
		var year = strDateSplit[0];
		var month = strDateSplit[1];
		var date  = strDateSplit[2]; 
		try{
			var yearSplit  = year.split(" ");
			var timeSplit = yearSplit[1].split(":");
			retDate =  new Date(parseInt(yearSplit[0],10), parseInt(month,10)-1, parseInt(date, 10), parseInt(timeSplit[0],10), parseInt(timeSplit[1],10), parseInt(timeSplit[2],10));
// 			console.log('try '+retDate);dateNow
		}catch(e){
			retDate = new Date(parseInt(year,10), parseInt(month,10)-1, parseInt(date, 10));
// 			console.log('catch '+retDate);
		}		
	}catch(e){
// 		console.log('catch x '+retDate);
		return retDate;
	}	
	return retDate;
}

///DATE////