extends AudioStreamPlayer

var menu_music = preload("res://Assets/Music/Music/Goblins_Den__Regular_.mp3")
var level_music = preload("res://Assets/Music/Music/Goblins_Dance__Battle_.mp3")

func _play_music(music: AudioStream, volume = -15):
	if stream == music:
		return
	stop()
	stream = music
	volume_db = volume
	play()
	
	
func play_menu_music():
	_play_music(menu_music)
	
func play_level_music():
	_play_music(level_music)

func play_FX(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()
