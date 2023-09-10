
var slides2 = document.querySelector('.slides2');
	
	
	var	slide2 = document.querySelectorAll('.slides2 li');
	
	var currentIdx2 = 0;
	var slideCount2 = slide2.length;
	
	var slideWidth2 = 200;
	var slideMargin2 = 40;
	var prevBtn2 = document.querySelector('.prev2');
	var nextBtn2 = document.querySelector('.next2');
	
	makeClone2();
	
	function makeClone2(){
		for(var i =0; i<slideCount2; i++){
			
			var cloneSlide2 = slide2[i].cloneNode(true);
			cloneSlide2.classList.add('clone2');
			
			slides2.appendChild(cloneSlide2);
		}
		for(var i=slideCount2-1; i>=0; i-- ){
			var cloneSlide2 = slide2[i].cloneNode(true);
			cloneSlide2.classList.add('clone2');
			
			slides2.prepend(cloneSlide2);
		}
		
		updateWidth2();
		setInitialPos2();
		
		setTimeout(function(){
			slides2.classList.add('animated2');
		},100);
		
		
	}
	
	function updateWidth2(){
		
		var currentSlide2 = document.querySelectorAll('.slides2 li');
		var newSlideCount2 = currentSlide2.length;
		
		var newWidth2 =(slideWidth2 + slideMargin2)*newSlideCount2-slideMargin2+'px';
		slides2.style.width = newWidth2;
	}
	
	function setInitialPos2(){
		var initialTranslateValue2 = -(slideWidth2 + slideMargin2)*slideCount2;
		
		slides2.style.transform = 'translateX('+initialTranslateValue2+'px)';
	}
	
	nextBtn2.addEventListener('click',function(){
		moveSlide2(currentIdx2+1);
	});
	
	prevBtn2.addEventListener('click',function(){
		moveSlide2(currentIdx2-1);
	});
	
	
	
	var timer2 = undefined;
	
	function autoSlide2(){
		if(timer2 ==undefined){
			timer2 = setInterval(function(){
				moveSlide2(currentIdx2-1);
			},2000);
		}
	}
	
	autoSlide2();
	
	function stopSlide2(){
		clearInterval(timer2);
		timer2 = undefined;
	}
	
	slides2.addEventListener('mouseenter',function(){
		stopSlide2();
	});
	
	slides2.addEventListener('mouseleave',function(){
		autoSlide2();
	});
	
	
	
	function moveSlide2(num2){
		slides2.style.left = -num2 *(slideWidth2 + slideMargin2)+'px';
		currentIdx2 = num2;
		
		if(currentIdx2 ==slideCount2 || currentIdx2== -slideCount2){
			
			setTimeout(function(){
				slides2.classList.remove('animated2');
				slides2.style.left='0px';
				currentIdx2 =0;
			},500);
			setTimeout(function(){
				slides2.classList.add('animated2');
			},600);
			
		}
		
	}
	
