(function() {
  var getPositionPointerXY;

  $(document).mousemove(function(event) {
    return getPositionPointerXY(event);
  });

  getPositionPointerXY = function(event) {
    var positionOutput, textareaPointer, xPosition, yPosition;
    xPosition = event.pageX;
    yPosition = event.pageY;
    positionOutput = 'Position: ' + xPosition + ', ' + yPosition;
    textareaPointer = $('#pointer-textarea');
    textareaPointer[0].value = positionOutput;
    return $(".background-div").css({
      top: yPosition + "px",
      left: xPosition + "px"
    });
  };

}).call(this);
