
extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 980.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Aplicar gravidade
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movimento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Pular com Espaço
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Mover e detectar colisões
	move_and_slide()

	# Escolher animação
	if not is_on_floor():
		if sprite.animation != "jump":
			sprite.play("jump")
	elif direction != 0:
		if sprite.animation != "walk":
			sprite.play("walk")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")

	# Virar na direção do movimento
	if direction != 0:
		sprite.flip_h = direction < 0
