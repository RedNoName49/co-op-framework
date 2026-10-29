extends Node3D

@onready var enemy = $Enemy
@onready var enemy2 = $Enemy2
@onready var enemy3 = $Enemy3
@onready var enemy4 = $Enemy4
@onready var enemy5 = $Enemy5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/WinScreen/Panel/Button.button_up.connect(restart)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enemy.dead == true and enemy2.dead == true and enemy3.dead == true and enemy4.dead == true and enemy5.dead == true :
		win()
	
func win():
	$CanvasLayer/WinScreen.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func restart():
	get_tree().reload_current_scene()
