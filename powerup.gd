extends Area2D

var screensize = Vector2.ZERO


func _ready():
	$Timer.start(randf_range(3, 8))
	$AnimatedSprite2D.frame = 0

func pickup():
	#$CollisionShape2D.set_deferred("disabled", true)
	queue_free()

func _on_timer_timeout():
	$AnimatedSprite2D.frame = 0
	$AnimatedSprite2D.play()


func _on_lifttime_timeout():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("obstacles"):
		position = Vector2(randi_range(0, screensize.x), randf_range(0, screensize.y))
