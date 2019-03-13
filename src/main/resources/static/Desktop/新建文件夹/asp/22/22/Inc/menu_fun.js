// 
//E创网络www.echsys.comJavascript脚本代码
//功能：多层表格交替显示
//设计：E创网络
//设计日期：2007-8-10
//
<!--
function openurl(url) {
	window.open(url, "", "location=yes,toolbar=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes, resizable=yes,copyhistory=yes");
}

function secCard(secTable, n, SelectCss, NormalCss)
  {
  if(n==1)
  {                secTable.cells[1].className=SelectCss;
                   secTable.cells[2].className=NormalCss;
                   secTable.cells[3].className=NormalCss;
				   secTable.cells[4].className=NormalCss;
				   secTable.cells[5].className=NormalCss;
  }
  if(n==2)
  {
                   secTable.cells[1].className=NormalCss;
                   secTable.cells[2].className=SelectCss;
                   secTable.cells[3].className=NormalCss;
				   secTable.cells[4].className=NormalCss;
				   secTable.cells[5].className=NormalCss;

  }
  if(n==3)
  {
                   secTable.cells[1].className=NormalCss;
                   secTable.cells[2].className=NormalCss;
                   secTable.cells[3].className=SelectCss;
				   secTable.cells[4].className=NormalCss;
				   secTable.cells[5].className=NormalCss;


  }
  if(n==4)
  {
                   secTable.cells[1].className=NormalCss;
                   secTable.cells[2].className=NormalCss;
                   secTable.cells[3].className=NormalCss;
                   secTable.cells[4].className=SelectCss;
				   secTable.cells[5].className=NormalCss;


  }
  if(n==5)
  {
                   secTable.cells[1].className=NormalCss;
                   secTable.cells[2].className=NormalCss;
                   secTable.cells[3].className=NormalCss;
				   secTable.cells[4].className=NormalCss;
                   secTable.cells[5].className=SelectCss;


  }
  }
  function secBoard(mainTable,moretab,n)
  {
    for(i=0;i<mainTable.tBodies.length;i++)
      {mainTable.tBodies[i].style.display="none";
	   moretab.tBodies[i].style.display="none";}
            mainTable.tBodies[n].style.display="";
			moretab.tBodies[n].style.display="";
  }
  //-->