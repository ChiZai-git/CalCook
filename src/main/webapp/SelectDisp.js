/************************************/
/* CookSearch.jsp					*/
/* 選択された料理名を表示する		*/
/** ********************************* */
function SelectDisp1(cnt) {
	var cooks = document.getElementsByClassName('cooks');

	for (var i = 0; i < cooks.length; i++) {
		cooks[i].style.display = (i === parseInt(cnt)) ? 'block' : 'none';
	}
}
/************************************/
/* ProjectList.jsp					*/
/* 選択されたプロジェクト名を表示する		*/
/** ********************************* */
function SelectDisp2(cnt) {
	var projects = document.getElementsByClassName('projects');

	for (var i = 0; i < projects.length; i++) {
		projects[i].style.display = (i === parseInt(cnt)) ? 'block' : 'none';
	}
}
