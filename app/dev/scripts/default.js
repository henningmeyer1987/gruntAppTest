/* Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt */
document.onmousemove = getPositionPointerXY;

function getPositionPointerXY (event) {
	/* Ermitteln der Position des Mouse Cursors */
	var xPosition = document.all ? event.offsetX : event.pageX;
	var yPosition = document.all ? event.offsetY : event.pageY;

	/* Output der Funktionen wird in einer Variable gespeichert */
	var positionOutput = 'Position: ' + xPosition + ', ' + yPosition;

	/* Auswählen der Textarea in dem die Position angezeigt wird */
	var textareaPointer = document.getElementById('pointer-textarea');

	/* Ausgabe der Position in der eben ausgewählten Textarea */
	textareaPointer.value = positionOutput;
}
