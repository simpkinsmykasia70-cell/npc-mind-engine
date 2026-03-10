extends Node2D

# Improved line-of-sight detection component
# utilizing raycasting optimization for better performance

class_name VisionComponent

var ray_count: int = 12 # Number of rays to cast
var ray_length: float = 300.0 # Length of each ray
var detected_objects: Array = [] # Array to hold detected objects

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Function to update detected objects using raycasting
func update_line_of_sight():
    detected_objects.clear() # Clear previous detection results
    
    for i in range(ray_count):
        var angle: float = (i / float(ray_count)) * 2 * PI # Calculate angle for each ray
        var start_position: Vector2 = global_position # Starting point of the ray
        var end_position: Vector2 = start_position + Vector2(cos(angle), sin(angle)) * ray_length
        
        # Perform the raycast
        var space_state = get_world_2d().direct_space_state
        var result = space_state.intersect_ray(start_position, end_position)
        
        if result:
            detected_objects.append(result) # Append detected object to the list
    
    # Additional logic can be added here to handle detected objects

# Call this function to process raycasting regularly
func _process(delta):
    update_line_of_sight()