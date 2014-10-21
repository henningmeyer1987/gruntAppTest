/* Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt */
$(document).mousemove(getPositionPointerXY);

function getPositionPointerXY (event) {
	/* Ermitteln der Position des Mouse Cursors */
	var xPosition = event.pageX;
	var yPosition = event.pageY;

	/* Output der Funktionen wird in einer Variable gespeichert */
	var positionOutput = 'Position: ' + xPosition + ', ' + yPosition;

	/* Auswählen der Textarea in dem die Position angezeigt wird */
	var textareaPointer = $('#pointer-textarea');

	/* Ausgabe der Position in der eben ausgewählten Textarea */
	textareaPointer[0].value = positionOutput;

	/* Positioniert das Div direkt am Mauszeiger */
	$('.background-div').css({'top': yPosition + 'px',
							'left' : xPosition + 'px'});
}
