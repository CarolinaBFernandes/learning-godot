
extends CharacterBody2D

@export var speed: float = 200.0


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(_delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")

	velocity.x = direction * speed
	move_and_slide()

	if direction == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")
		sprite.flip_h = direction < 0
