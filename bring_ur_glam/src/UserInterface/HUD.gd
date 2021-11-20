extends CanvasLayer


func _ready() -> void:
    PlayerData.connect("hp_updated", self, "update_hp")
    PlayerData.connect("score_updated", self, "update_score")
    $HealthBarRbn.set_values(0, PlayerData.hp, PlayerData.total_hp)
    update_hp_text()


func update_score() -> void:
    $ScoreLabel.text = str(PlayerData.score)


func update_hp() -> void:
    $HealthBarRbn.set_hp(PlayerData.hp)
    update_hp_text()


func update_hp_text() -> void:
    $HPValue.text = "{hp}/{total_hp}".format({"hp": PlayerData.hp, "total_hp": PlayerData.total_hp})
