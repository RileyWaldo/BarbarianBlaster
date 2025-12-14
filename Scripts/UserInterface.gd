extends CanvasLayer

@onready var retryButton: Button = %RetryButton
@onready var quitButton: Button = %QuitButton

@onready var star1: TextureRect = %StarHBox/Star1
@onready var star2: TextureRect = %StarHBox/Star2
@onready var star3: TextureRect = %StarHBox/Star3

func _ready() -> void:
	visible = false
	star2.modulate = Color.BLACK
	star3.modulate = Color.BLACK
	retryButton.pressed.connect(Retry)
	quitButton.pressed.connect(Quit)
	
func Victory() -> void:
	visible = true
	var base: Base = get_tree().get_first_node_in_group("base")
	if(base.health == base.maxHealth):
		star2.modulate = Color.WHITE
	var bank: Bank = get_tree().get_first_node_in_group("bank")
	if(bank.gold >= 500):
		star3.modulate = Color.WHITE

func Retry() -> void:
	get_tree().reload_current_scene()
	
func Quit() -> void:
	get_tree().quit()
