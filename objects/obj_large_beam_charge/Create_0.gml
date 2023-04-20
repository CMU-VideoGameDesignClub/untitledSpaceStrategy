if distance_to_object(obj_player_space) <= 2500 {
    audio_play_sound(snd_large_beam_charge, 1, false)
}
if audio_is_playing(snd_large_beam_charge) {
    var Sub = distance_to_object(obj_player_space)/2500
    audio_sound_gain(snd_large_beam_charge, 1 - Sub, 0)
}