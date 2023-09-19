extends ParallaxBackground

var scrolling_speed = 100
# Moving background in start
func _process(delta):
	scroll_offset.x -= scrolling_speed * delta
