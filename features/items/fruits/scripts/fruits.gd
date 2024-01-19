extends Area2D

#Logica de colisão temporaria.

var is_colliding = false

func _on_body_entered(body):
	# Limita o número de vezes que o jogador poderá colidir com o objeto.
	if is_colliding: return
	
	is_colliding = true
	print("O jogador colidiu com a fruta.")
	
	# Inicialização da animação.
	# Após o termino da animação, o objeto é destruído.
	$AnimatedSprite2D.play("collected")


func _on_animation_finished():
	queue_free()

