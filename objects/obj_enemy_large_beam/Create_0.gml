if distance_to_object(obj_player_space) <= 2500 {
    audio_play_sound(snd_large_beam, 1, true)
}
if audio_is_playing(snd_large_beam) {
    var Sub = distance_to_object(obj_player_space)/2500
    audio_sound_gain(snd_large_beam, 1 - Sub, 0)
}