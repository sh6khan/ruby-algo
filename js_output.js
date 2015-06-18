//What is the Output of this JS code


var text = 'outside function';

function Log() {
	console.log(text);
	var text = 'inside function';
}

Log();