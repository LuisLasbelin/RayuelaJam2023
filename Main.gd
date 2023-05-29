extends Node2D

@onready var person1 = $TrenMarco/TrenPersona1
@onready var person2 = $TrenMarco/TrenPersona2
@onready var p_animator = $TrenMarco/PersonasAnimator
@onready var menu = $CanvasLayer
@onready var bubble1 = $TrenMarco/Burbuja1
@onready var bubble2 = $TrenMarco/Burbuja2
@onready var bubble3 = $TrenMarco/Burbuja3
@onready var bubble4 = $TrenMarco/Burbuja4

var nameEdit : TextEdit
var pronsSelector : OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	nameEdit = get_tree().get_first_node_in_group("NameEdit")
	pronsSelector = get_tree().get_first_node_in_group("PronsSelector")


func return_menu():
	menu.visible = true
	person1.visible = false
	person2.visible = false
	change_speaker(0)

func change_speaker(speakerNum):
	Globals.speaker = speakerNum
	bubble1.visible = false
	bubble2.visible = false
	bubble3.visible = false
	bubble4.visible = false
	match (speakerNum):
		1:
			bubble1.visible = true
		2:
			bubble2.visible = true
		3:
			bubble3.visible = true
		4:
			bubble4.visible = true


func start_dialogue():
	var resource = preload("res://dialogue/init.dialogue")
	DialogueManager.show_example_dialogue_balloon(resource)


func show_person1():
	p_animator.play("show_persona1")
	person1.visible = true


func show_person2():
	p_animator.play("show_persona2")
	person2.visible = true


func set_player_name(name):
	Globals.playerName = name


func set_player_pronoun(pron):
	Globals.playerPronoun = pron


func _on_text_edit_text_changed():
	if(nameEdit.text.length() > 15):
		nameEdit.text = nameEdit.text.left(15)


func _on_start_btn_pressed():
	set_player_name(nameEdit.text)
	set_player_pronoun(pronsSelector.get_item_text(pronsSelector.selected))
	menu.visible = false
	start_dialogue()
