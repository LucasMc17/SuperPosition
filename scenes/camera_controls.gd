extends Camera2D

var mouse_down: bool = false
var last_mouse_pos: Vector2
var pan_speed = 1.0 # Adjust for desired panning speed

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				mouse_down = true
				last_mouse_pos = get_global_mouse_position()
			else:
				mouse_down = false
	elif event is InputEventMouseMotion and mouse_down:
		camera_movement(event)
	
	if event is InputEventMouseButton:
		var zoom_amount = .1
		var zoom_now = zoom.x
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			var new_zoom = min(zoom_now + zoom_amount, 3)
			zoom = Vector2(new_zoom, new_zoom)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			var new_zoom = max(zoom_now - zoom_amount, .3)
			zoom = Vector2(new_zoom, new_zoom)

func camera_movement(event):
	var current_mouse_pos = get_global_mouse_position()
	var offset_change = (last_mouse_pos - current_mouse_pos) * pan_speed
	global_position += offset_change
