extends StaticBody2D



func _on_interaction_range_entered(body):
	if body.get_name() == "Player":
		body.get_node("interaction_info").show()


func _on_interaction_range_exited(body):
	if body.get_name() == "Player":
		body.get_node("interaction_info").hide()
