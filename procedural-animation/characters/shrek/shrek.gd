extends Node3D

@onready var physical_bone_simulator_3d: PhysicalBoneSimulator3D = $"Sketchfab_Scene/Sketchfab_model/0LVESLTDM3I3A9GXMCDOXXX2P_fbx/RootNode/root/Object_4/Skeleton3D/PhysicalBoneSimulator3D"
@onready var physical_bone_leg_l: PhysicalBone3D = $"Sketchfab_Scene/Sketchfab_model/0LVESLTDM3I3A9GXMCDOXXX2P_fbx/RootNode/root/Object_4/Skeleton3D/PhysicalBoneSimulator3D/Physical Bone arm_stretch_r_08"
@onready var physical_bone_leg_r: PhysicalBone3D = $"Sketchfab_Scene/Sketchfab_model/0LVESLTDM3I3A9GXMCDOXXX2P_fbx/RootNode/root/Object_4/Skeleton3D/PhysicalBoneSimulator3D/Physical Bone leg_stretch_l_058"

func _ready() -> void:
	#skeleton_3d.physical_bones_start_simulation()
	physical_bone_simulator_3d.physical_bones_start_simulation()


func _physics_process(delta: float) -> void:
	var current_vector_l = physical_bone_leg_l.global_transform.basis.y
	var target_vector_l = Vector3.UP
	var cross_product_l = current_vector_l.cross(target_vector_l)
	
	var current_vector_r = physical_bone_leg_r.global_transform.basis.y
	var target_vector_r = Vector3.UP
	var cross_product_r = current_vector_r.cross(target_vector_r)
	
	physical_bone_leg_l.angular_velocity += ((cross_product_l * 750.0) - (physical_bone_leg_l.angular_velocity * 10.0)) * delta
	physical_bone_leg_r.angular_velocity += ((cross_product_r * 750.0) - (physical_bone_leg_r.angular_velocity * 10.0)) * delta
