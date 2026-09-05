extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		var tween = create_tween()
		tween.tween_callback(self.queue_free)
		Global.score +=1
		
	#if Global.score ==3:  ## Game over logic
		# game_over()
