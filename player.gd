extends CharacterBody2D

@onready var main = $"../.." # Pastikan path ke objek 'main' sesuai dengan struktur hierarki

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@export var ACCELERATION = 500
@export var MAX_SPEED = 200
@export var FRICTION  = 500

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	anim.play("idle") # Memainkan animasi idle saat karakter siap

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()

	if direction.x < 0:
		get_node("AnimatedSprite2D").flip_h = true
	else:
		get_node("AnimatedSprite2D").flip_h = false

	if is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		anim.play("run")
		#main.addscore() # Pindahkan penambahan skor saat karakter bergerak
	else:
		anim.play("idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()
	
func _on_area_2d_area_entered(area):
	main.game_over()
	#get_tree().change_scene("res://game_over.tscn")
	pass # Ganti dengan logika yang sesuai saat area dimasuki
