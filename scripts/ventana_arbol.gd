extends Control

# Referencia a nuestro lienzo gigante
@onready var lienzo = $LienzoArbol

# Variable para saber si el jugador está manteniendo presionado el clic
var arrastrando : bool = false

# Esta función detecta cualquier cosa que hagas con el ratón sobre esta ventana
func _gui_input(event: InputEvent) -> void:
	
	# 1. Detectar si presionamos o soltamos el clic izquierdo
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			arrastrando = true # Empezamos a arrastrar
		else:
			arrastrando = false # Soltamos el clic
			
	# 2. Si estamos arrastrando y el ratón se mueve...
	if event is InputEventMouseMotion and arrastrando:
		# event.relative nos da la distancia exacta que se movió el ratón en este fotograma
		lienzo.position += event.relative
		print("Moviendo: ", event.relative)
