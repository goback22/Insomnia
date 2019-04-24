//total member chart in index
$(function(){
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['남자',	11],
        ['여자',	2],
      ]);

      var options = {
        pieHole: 0.4,
      };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
    }
});

//new member chart
$(function(){
//	var sevenDayAgo='2019.04.01';var sevenDayMember=3;
//	var sixDayAgo='2019.04.02';var sixDayMember=21;
//	var fourDayAgo='2019.04.03';var fourDayMember=6;
//	var threeDayAgo='2019.04.04';var threeDayMember=13;
	var twoDayAgo='2019.04.05';var twoDayMember=19;
	var yesterDayMember=13;
	var todayMember=34;

    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', '신규회원'	],
//          [sevenDayAgo,  sevenDayMember	],
//          [sixDayAgo,  sixDayMember	],
//          [fourDayAgo,  fourDayMember		],
//          [threeDayAgo,  threeDayMember		],
          [twoDayAgo,  twoDayMember		],
          ['yesterday',  yesterDayMember		],
          ['today',  todayMember	]
        ]);


        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data);
      }
});


//band chart in index	
$(function(){
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	function drawBasic() {
		var firstBand = '1st';
		var secondBand = '2nd';
		var thirdBand = '3rd';
		var data = google.visualization.arrayToDataTable([
		        ['bandReward', 'reward1', 'reward2', 'reward3', 'reward4',
		          { role: 'annotation' } ],
		        [firstBand, 10, 24, 20, 32, ''],
		        [secondBand, 16, 22, 23, 20, ''],
		        [thirdBand, 28, 19, 29, 20, '']
		      ]);

		      var suboptions = {
		        width: 350,
		        legend: { position: 'top', maxLines: 2 },
		        bar: { groupWidth: '60%' },
		        maintainAspectRatio: false,
		        isStacked: true
		      };
		      var chart = new google.visualization.BarChart(document.getElementById('sub_chart'));

		      chart.draw(data, suboptions);
		    }
});
