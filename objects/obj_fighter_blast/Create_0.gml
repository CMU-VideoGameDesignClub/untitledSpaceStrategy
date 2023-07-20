if distance_to_object(obj_player_space) <= 2500 {
    audio_play_sound(snd_laser1, 1, false)
}
if audio_is_playing(snd_laser1) {
    var Sub = distance_to_object(obj_player_space)/2500
    audio_sound_gain(snd_laser1, 1 - Sub, 0)
}
speed = 30;