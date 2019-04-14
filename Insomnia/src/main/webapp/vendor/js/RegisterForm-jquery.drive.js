(function($){
	$.sbDrive = {};
	var interpolate = function (t, p_1, p0, p1, p2) {
			return Math.floor((t * ((2 - t) * t - 1) * p_1 +
					(t * t * (3 * t - 5) + 2) * p0 +
					t * ((4 - 3 * t) * t + 1) * p1 +
					(t - 1) * t * t * p2
					) / 2);
	};
	var generateExtension = function (p1, p2) {
			return [
					p2[0] + (p2[0] - p1[0]),
					p2[1] + (p2[1] - p1[1])
					];

	};
	$.sbDrive.buildSequence = function(pointList) {
			var res = {};
			var seq = [];
			var numSegments;

			if (pointList.length < 2) {
					throw "sbDrive.buildSequence requires at least two points";
			}

			seq.push(generateExtension(pointList[1], pointList[0]));
			for (var i = 0; i < pointList.length; i++) {
					seq.push(pointList[i]);
			}
			seq.push(generateExtension(seq[seq.length-2], seq[seq.length-1]));

			numSegments = seq.length - 3;

			res.getPos = function (t) {
					var segNum = Math.floor(t * numSegments);
					if (segNum === numSegments) {
							return {
									left: seq[seq.length-2][0],
									top: seq[seq.length-2][1]
									};
					}
					var microT = (t - segNum/numSegments) * numSegments;
					var result = {
							left: interpolate(microT,
											seq[segNum][0],
											seq[segNum+1][0],
											seq[segNum+2][0],
											seq[segNum+3][0]) + "px",
							top: interpolate(microT,
											seq[segNum][1],
											seq[segNum+1][1],
											seq[segNum+2][1],
											seq[segNum+3][1]) + "px"
							};
					return result;
			};
			return res;
	};
	$.fx.step.sbDrive = function (fx) {
			var css = fx.end.getPos(fx.pos);
			for (var i in css) {
					fx.elem.style[i] = css[i];
			}
	};
})(jQuery);