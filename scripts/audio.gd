extends Node

@export var bgm: AudioStream
@export var sfx: Dictionary = {
	"benar": preload("res://Assets/sound/correct.wav"),
	"salah": preload("res://Assets/sound/wrong.wav"),
	"vbenar": preload("res://Assets/sound/benar.wav"),
	"vsalah": preload("res://Assets/sound/o ow.wav"),
	"bintang5": preload("res://Assets/sound/warbiasa.wav"),
	"bintang3": preload("res://Assets/sound/hebat.wav"),
	"bintang0": preload("res://Assets/sound/JanganMenyerah.wav"),
	"timer": preload("res://Assets/timer.mp3"),
	"hore": preload("res://Assets/sound/applause-cheer-236786.mp3")
}

var music_player = AudioStreamPlayer.new()
var sfx_player = AudioStreamPlayer.new()

var music_volume: float = 1.0
var sfx_volume: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(music_player)
	add_child(sfx_player)
	music_player.volume_db = linear_to_db(music_volume)
	
	if bgm:
		play_music(bgm)

func play_music(music: AudioStream):
	music_player.stream = music
	music_player.play()
	
func stop_music():
	music_player.stop()

func stop_sfx():
	sfx_player.stop()

func play_sfx(effect: String):
	if sfx.has(effect):
		sfx_player.stream = sfx[effect]
		sfx_player.play()
		
func set_music_volume(volume: float):
	music_volume = clamp(volume, 0,1) # Clamp to keep between 0 and 1
	music_player.volume_db = linear_to_db(music_volume)

func set_sfx_volume(volume: float):
	sfx_volume = clamp(volume, 0, 10)
	sfx_player.volume_db = linear_to_db(sfx_volume)
	
func set_sound_pitch():
	sfx_player.pitch_scale = 1.34

