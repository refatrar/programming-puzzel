let box = document.getElementById('box'),
	speed = 10,
	directionTop = 1, // 1 = move bottom; -1 = move top
	directionLeft = 1; // 1 = move right; -1 = move left,

function move() {
	
	// When right side of the box goes too far - change direction:
    if (rightPosition(box) > window.innerWidth)
    	directionLeft = -1;

    // When left side of the box goes too far - change direction:
    if (leftPosition(box) < 0)
        directionLeft = 1;

    // When bottom side of the box goes too far - change direction:
    if (bottomPosition(box) > window.innerHeight)
    	directionTop = -1;

    // When top side of the box goes too far - change direction:
    if (topPosition(box) < 0)
        directionTop = 1;
	
	box.style.top = (topPosition(box) + speed * directionTop) + 'px';
	box.style.left = (leftPosition(box) + speed * directionLeft) + 'px';

	setTimeout("move()", 1000);
}

var topPosition = function($this){
	return $this.offsetTop;
}

var bottomPosition = function($this){
	return topPosition($this) + $this.offsetHeight;
}

var leftPosition = function($this){
	return $this.offsetLeft;
}

var rightPosition = function($this){
	return leftPosition($this) + $this.offsetWidth;
}