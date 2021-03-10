$(function(){
	// 메인만 남기고 서브메뉴는 안보이게 하기
	$("ul.submenu").hide();
	
	// 메인에서 마우스를 올리면 서브메뉴가 나타나고(sildeDown)
	// 마우스가 벗어나면 서브메뉴가 올라가도록 하기(slideUp)
	// 이벤트는 hover사용
	$("li.main").hover(function(){
		$(this).find('ul').slideDown();
		// $(this).children('ul').slideDown(); // 위와 동일
	}, function(){
		$(this).find('ul').slideUp();
	});
	
})
