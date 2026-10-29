extends CharacterBody3D


@onready var animated_sprite_3d = $AnimatedSprite3D
@onready var blood_splatter = $Blood

@export var move_speed = 2.0
@export var attack_range = 2.0

var dead = false

func _physics_process(delta):
	if dead:
		return

		


func kill():
	dead = true
	blood_splatter.emitting = true
	$DeathSound.play()
	animated_sprite_3d.play("death")
	$CollisionShape3D.disabled = true
	
