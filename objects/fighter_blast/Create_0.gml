if distance_to_object(obj_player) <= 2500 {
    audio_play_sound(laser1, 1, false)
}
if audio_is_playing(laser1) {
    var Sub = distance_to_object(obj_player)/2500
    audio_sound_gain(laser1, 1 - Sub, 0)
}
speed = 30;