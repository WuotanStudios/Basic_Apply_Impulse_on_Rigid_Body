extends RigidBody3D


# Small rigid body script, to test the apply_impulse method, and to see how the physics work in godot 4
# this is open source and 100% free to use for everyone


#Here you find all the variables to control the cube.
#You can change the variables here in the script, or in the editor
@export_range(0, 100, 1) var jump_force 	: int = 10
@export_range(0, 100, 1) var move_forward 	: int = -5
@export_range(0, 100, 1) var move_backward 	: int = 5
@export_range(0, 100, 1) var move_left 		: int = -5
@export_range(0, 100, 1) var move_right 	: int = 5


#This is the input function, which will always be activated on any kind of "input"
func _input(event):
	if event.is_action_pressed("ui_accept"): 	_jump()					#calls the function _jump
	if event.is_action_pressed("ui_up"):		_move_forward()			#calls the function _move_forward
	if event.is_action_pressed("ui_down"):		_move_backwards()		#calls the function _move_backwards
	if event.is_action_pressed("ui_left"):		_move_left()			#calls the function _move_left
	if event.is_action_pressed("ui_right"):		_move_right()			#calls the function _move_right

func _jump():			apply_impulse(Vector3(0,jump_force,0), Vector3(0,0,0))		#if key spacebar is pressed, the cube will jump
func _move_forward():	apply_impulse(Vector3(0,0,move_forward), Vector3(0,0,0))	#if arrow key up is pressed, the cube will move forwards
func _move_backwards():	apply_impulse(Vector3(0,0,move_backward), Vector3(0,0,0))	#if arrow key down is pressed, the cube will move backwards
func _move_left():		apply_impulse(Vector3(move_left,0,0), Vector3(0,0,0))		#if arrow key left is pressed, the cube will move sideway-left
func _move_right():		apply_impulse(Vector3(move_right,0,0), Vector3(0,0,0))		#if arrow key left is pressed, the cube will move sideway-right
