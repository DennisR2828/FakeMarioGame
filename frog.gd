extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var SPEED = 50
func _physics_process(delta):
	#Gravity for frog
	velocity.y += gravity * delta
	if chase ==  true:
		get_node("AnimatedSprite2D").play("jump")
		player = get_node("../../player/player")
		var direction = (player.position - self.position).normalized()
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
		


func _on_player_detection_body_exited(body):
	if body.name == "player":
		chase = false
