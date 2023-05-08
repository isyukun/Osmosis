extends CharacterBody2D

@export var speed = 400
var screen_size
$CharacterBody2D.posi

func get_input():
	var input_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_direction * (speed/3)
	
	if velocity.x < 0:
		$AnimatedSprite.play("Left")
	else:
		$AnimatedSprite.play("Idle")
	
	if velocity.x > 0:
		$AnimatedSprite.play("Right")
	else:
		$AnimatedSprite.play("Idle")

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	move_and_slide()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	pass
