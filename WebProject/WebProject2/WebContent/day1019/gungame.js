$(function(){
	// 1. 총을 클릭하면 0~11 사이의 값을 랜덤하게 발생하여
	// 선반위의 해당 인형을 안보이게 처리한다
	var clear = 0;
	$(".gun").click(function(){
		var idx = parseInt(Math.random()*12);
		
		// idx가 발생하면 해당 인형이 이미 사라진경우에는
		// "3번 인형은 이미 처리되었습니다"
		// 그렇지 않으면 "3번 인형을 맞췄네요!!!!"
		// 그러다가 모두 맞추면 "Game Over!! You Win!!"
		if($(".sunban li img").eq(idx).is(":hidden")){
			$("#msg").text((idx+1)+"번 인형은 이미 처리되었습니다.");
		}
		else {
			$(".sunban li img").eq(idx).fadeOut('fast');
			$("#msg").text((idx+1)+"번 인형을 맞췄네요!!!");
			clear++;
		}
		
		/*$(".sunban li img").each(function(){
			if($(this).is(":hidden"))
				clear++;
		});*/
		
		if(clear == 12)
			$("#msg").text("Game Over!! You Win!!!");
			
	});
	
	// 지폐를 클릭하면 해당 지폐는 안보이게 처리하고 인형은 모두 다시 보이게 하기, 메시지창도 지우기
	$("ul.money li img").click(function(){
		$(this).hide();
		$(".sunban li img").show();
		$("#msg").text("");
	});
});