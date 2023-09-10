
var slides = document.querySelector('.slides');
	
	
	var	slide = document.querySelectorAll('.slides li');
	
	var currentIdx = 0;
	var slideCount = slide.length;
	
	var slideWidth = 200;
	var slideMargin = 40;
	var prevBtn = document.querySelector('.prev');
	var nextBtn = document.querySelector('.next');
	
	makeClone();
	
	function makeClone(){
		for(var i =0; i<slideCount; i++){
			//a.cloneNode(), a.cloneNode(true)
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			//a.appendChild(b)
			slides.appendChild(cloneSlide);
		}
		for(var i=slideCount-1; i>=0; i-- ){
			var cloneSlide = slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			//a.prepend(b)
			slides.prepend(cloneSlide);
		}
		
		updateWidth();
		setInitialPos();
		
		setTimeout(function(){
			slides.classList.add('animated');
		},100);
		
		
	}
	
	function updateWidth(){
		
		var currentSlide = document.querySelectorAll('.slides li');
		var newSlideCount = currentSlide.length;
		
		var newWidth =(slideWidth + slideMargin)*newSlideCount-slideMargin+'px';
		slides.style.width = newWidth;
	}
	
	function setInitialPos(){
		var initialTranslateValue = -(slideWidth + slideMargin)*slideCount;
		//console.log(initialTranslateValue);
		slides.style.transform = 'translateX('+initialTranslateValue+'px)';
	}
	
	nextBtn.addEventListener('click',function(){
		moveSlide(currentIdx+1);
	});
	
	prevBtn.addEventListener('click',function(){
		moveSlide(currentIdx-1);
	});
	
	
	
	var timer = undefined;
	
	function autoSlide(){
		if(timer ==undefined){
			timer = setInterval(function(){
				moveSlide(currentIdx +1);
			},2000);
		}
	}
	
	autoSlide();
	
	function stopSlide(){
		clearInterval(timer);
		timer = undefined;
	}
	
	slides.addEventListener('mouseenter',function(){
		stopSlide();
	});
	
	slides.addEventListener('mouseleave',function(){
		autoSlide();
	});
	
	
	
	function moveSlide(num){
		slides.style.left = -num *(slideWidth + slideMargin)+'px';
		currentIdx = num;
		//console.log(currentIdx,slideCount)
		if(currentIdx ==slideCount || currentIdx== -slideCount){
			
			setTimeout(function(){
				slides.classList.remove('animated');
				slides.style.left='0px';
				currentIdx =0;
			},500);
			setTimeout(function(){
				slides.classList.add('animated');
			},600);
			
		}
		
	}
	
