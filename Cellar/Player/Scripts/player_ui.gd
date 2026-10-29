extends CanvasLayer

@onready var gun_layer = $GunBase/AnimatedSprite2D
@onready var shoot_sound = $ShootSound

var can_shoot = true
var dead = false
signal shoot_animation_done()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gun_layer.animation_finished.connect(shoot_anim_done)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dead:
		return
	if Input.is_action_just_pressed("left_click"):
		shoot()

func shoot():
	if !can_shoot:
		return
	can_shoot = false
	gun_layer.play("shoot")
	shoot_sound.play()
	
func shoot_anim_done():
	can_shoot = true
	shoot_animation_done.emit()
	
func kill():
	dead = true
	$CanvasLayer/DeathScreen.show()
