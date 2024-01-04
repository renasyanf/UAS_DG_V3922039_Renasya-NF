extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	# Gravity for enemy
	velocity.y += gravity * delta
	if chase:
		get_node("AnimatedSprite2D").play("walk")
		if player:
			var direction = (player.global_position - global_position).normalized()
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
			else:
				get_node("AnimatedSprite2D").flip_h = false
			velocity.x = direction.x * SPEED
	else:
		get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "player":
		chase = true
		player = body

func _on_player_detection_body_exited(body):
	if body.name == "player":
		chase = false
		player = null
