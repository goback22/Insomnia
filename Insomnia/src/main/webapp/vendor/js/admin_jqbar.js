﻿(function ($) {
    $.fn.extend({
        jqbar: function (options) {
            var settings = $.extend({
                animationSpeed: 2000,
                barLength: 200,
                barWidth: 10,
                barColor: 'red',
                label: '&nbsp;',
                value: 100
            }, options);

            return this.each(function () {

                var valueLabelHeight = 0;
                var progressContainer = $(this);

                progressContainer.addClass('jqbar vertical').append('<span class="bar-percent"></span><span class="bar-level-wrapper"><span class="bar-level"></span></span><span class="bar-label"></span>');

                var progressLabel = progressContainer.find('.bar-label').html(settings.label);
                var progressBar = progressContainer.find('.bar-level').attr('data-value', settings.value);
                var progressBarWrapper = progressContainer.find('.bar-level-wrapper');
//css에 margin-top추가
                progressContainer.css('height', settings.barLength);
                progressBar.css({ height: settings.barLength, top: settings.barLength, width: settings.barWidth, backgroundColor: settings.barColor });
                progressBarWrapper.css({ height: settings.barLength, width: settings.barWidth });

                var valueLabel = progressContainer.find('.bar-percent');
                valueLabel.html('0');
                valueLabelHeight = parseInt(valueLabel.outerHeight());
                valueLabel.css({ top: (settings.barLength - valueLabelHeight) + 'px' });
                
                animateProgressBar(progressBar);

                function animateProgressBar(progressBar) {

                    var level = parseInt(progressBar.attr('data-value'));
                    if (level > 100) {
                        level = 100;
                        alert('max value cannot exceed 100 percent');
                    }
                    var w = settings.barLength * level / 100;

                    var h = settings.barLength - settings.barLength * level / 100;
                    progressBar.animate({ top: h }, {
                        duration: 2000,
                        step: function (currentValue) {
                            var percent = parseInt((settings.barLength - parseInt(currentValue)) / settings.barLength * 100);
                            if (isNaN(percent))
                                percent = 0;
                            progressContainer.find('.bar-percent').html(Math.abs(percent) + '%');
                        }
                    });

                    progressContainer.find('.bar-percent').animate({ top: (h - valueLabelHeight) }, 2000);
                    
                }

            });
        }
    });

})(jQuery);