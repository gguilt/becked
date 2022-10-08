extends Control

const FILE_READ = 1
const FILE_WRITE = 2

var currentFile = null

# Called when the node enters the scene tree for the first time.
func _ready():
	new_buffer()
	$HBoxContainer/BufferMenu.get_popup().connect("id_pressed", self, "_on_BufferMenu_pressed")

func _on_LoadDialog_file_selected(path):
	var file = File.new()
	file.open(path, FILE_READ)
	$TextEdit.text = file.get_as_text()
	change_title(path)
	file.close()

func _on_SaveDialog_file_selected(path):
	var file = File.new()
	file.open(path, FILE_WRITE)
	file.store_string($TextEdit.text)
	change_title(path)
	file.close()

func _on_BufferMenu_pressed(id):
	match id:
		0: new_buffer()
		1: load_buffer()
		2: save_buffer()

func new_buffer():
	change_title("Untitled")
	currentFile = null
	$TextEdit.text = ""
	
func load_buffer():
	$LoadDialog.popup()
	
func save_buffer():
	$SaveDialog.popup()
	
func change_title(newTitle):
	OS.set_window_title("becked: " + newTitle)
