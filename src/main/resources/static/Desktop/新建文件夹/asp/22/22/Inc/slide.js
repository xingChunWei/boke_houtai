function setslideA(i){
	
	sltslideA(i);	
	
	
};
function sltslideA(i){
	
	
	switch(i){
		
		
		case 1:document.getElementById("slideACon1").style.display="block";		
		document.getElementById("slideACon2").style.display="none";		
		document.getElementById("slideACon3").style.display="none";		
		document.getElementById("slideACon4").style.display="none";		
		break;		
		case 2:document.getElementById("slideACon1").style.display="none";		
		document.getElementById("slideACon2").style.display="block";		
		document.getElementById("slideACon3").style.display="none";		
		document.getElementById("slideACon4").style.display="none";		
		break;		
		case 3:document.getElementById("slideACon1").style.display="none";		
		document.getElementById("slideACon2").style.display="none";		
		document.getElementById("slideACon3").style.display="block";		
		document.getElementById("slideACon4").style.display="none";		
		break;		
		case 4:document.getElementById("slideACon1").style.display="none";		
		document.getElementById("slideACon2").style.display="none";		
		document.getElementById("slideACon3").style.display="none";		
		document.getElementById("slideACon4").style.display="block";		
		break;		
		
		
	};	
	
	
};

function setslide(i){
	
	sltslide(i);	
	
}
function sltslide(i){
	
	switch(i){
		
		case 1:
		document.getElementById("slidecon1").style.display="block";		
		document.getElementById("slidecon2").style.display="none";		
		document.getElementById("slidecon3").style.display="none";		
		break;		
		case 2:
		document.getElementById("slidecon1").style.display="none";		
		document.getElementById("slidecon2").style.display="block";		
		document.getElementById("slidecon3").style.display="none";		
		break;		
		case 3:
		document.getElementById("slidecon1").style.display="none";		
		document.getElementById("slidecon2").style.display="none";		
		document.getElementById("slidecon3").style.display="block";		
		break;		
		
	}
	
}
function openurl(url) {
	window.open(url, "", "location=yes,toolbar=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes, resizable=yes,copyhistory=yes");
}
function Show_SubLmy(id_num,num){
	//…‡«©π¶ƒ‹
	for(var i=0;i<=9;i++){
		
		if(GetObj("S_MenuMy_"+id_num+i)){
			GetObj("S_MenuMy_"+id_num+i).className='';
			
		}
		if(GetObj("S_ContMy_"+id_num+i)){
			GetObj("S_ContMy_"+id_num+i).style.display='none';
			
		}
		
	}
	if(GetObj("S_MenuMy_"+id_num+num)){
		GetObj("S_MenuMy_"+id_num+num).className='selectd';
		
	}
	if(GetObj("S_ContMy_"+id_num+num)){
		GetObj("S_ContMy_"+id_num+num).style.display='block';
		
	}
	
}
function GetObj(objName){
	
	if(document.getElementById){
		
		return eval('document.getElementById("'+objName+'")');		
		
	}else {
		
		return eval('document.all.'+objName);		
		
	}
	
}

function tabit(tabName,btnId,tabNumber){
	
	for(i=0;i<tabNumber;i++){
		
		document.getElementById(tabName+"_div"+i).style.display="none";		
		document.getElementById(tabName+"_btn"+i).className=tabName+"_tabBtn02";		
		
	}
	document.getElementById(tabName+"_div"+btnId).style.display="block";	
	document.getElementById(tabName+"_btn"+btnId).className=tabName+"_tabBtn01";	
	
	
}

function GetObj(objName){
	
	if(document.getElementById){
		
		return eval('document.getElementById("'+objName+'")');		
		
	}else {
		
		return eval('document.all.'+objName);		
		
	}
	
}

function ShowSub(ID_num,num){
	
	for(var i=0;i<=9;i++){
		
		if(GetObj("T_Menu_"+ID_num+i))GetObj("T_Menu_"+ID_num+i).className='';		
		if(GetObj("S_Cont_"+ID_num+i))GetObj("S_Cont_"+ID_num+i).style.display="none";		
		
	}
	if(GetObj("T_Menu_"+ID_num+num))GetObj("T_Menu_"+ID_num+num).className='selectd';	
	if(GetObj("S_Cont_"+ID_num+num))GetObj("S_Cont_"+ID_num+num).style.display="block";	
	
}