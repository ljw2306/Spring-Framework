function checkImg(filename) {

	/*
	 * var pattern = /jpg|jpeg|png|gif/i; ignore의 약자 return
	 * filename.match(pattern)
	 */

	var type = filename.substring(filename.lastIndexOf(".") + 1);
	type = type.toLowerCase();
	if (type == "png" || type == "jpeg" || type == "jpg" || type == "gif") {
		return true;
	} else {
		return false;
	}
}

function getOriginalName(filename) {
	var idx = "";

	if (checkImg(filename)) {
		idx = filename.indexOf("_", 14) + 1;
	} else {
		idx = filename.indexOf("_") + 1;
	}
	filename = filename.substring(idx);
	return filename;
}

function getImageName(filename) {
	var prefix = filename.substring(0, 12);
	var suffix = filename.substring(14);
	console.log(prefix);
	console.log(suffix);
	return prefix + suffix;
}

function iconAppend(data, ok) {
	var str = "";

	if (checkImg(data)) {
		str += '<li class="col-xs-3"><img data-url="'+data+'" class="board_img_icon" src="/display?filename='+data+'"><div><span>' + getOriginalName(data) + '</span>';

	} else {
		str += '<li class="col-xs-3"><img data-url="'+data+'" class="board_img_icon" src="/resources/img/gt.png"><div><span>'+ getOriginalName(data)+'</span>';
	}

	if (ok) {
		str += '<a class="btn btn-danger btn-xs delbtn" href="'+data+'"><span class="glyphicon glyphicon-remove"></span></a></div></li>';
	}

	$(".uploadedList").append(str);

}










