#!/bin/bash
cd $HOME/dji_sdk_ros
source devel/setup.bash

rosservice call /dji_sdk/sdk_control_authority "control_enable: 1"
sleep 3



latitude=$1
longitude=$2
altitude=$3

if [ -z "$1" ]
then
    latitude=56.461983
fi

if [ -z "$2" ]
then
    longitude=84.935541
fi

if [ -z "$3" ]
then
    altitude=15.0
fi



result=$(rosservice call /dji_sdk/mission_waypoint_upload "waypoint_task: 
  velocity_range: 15.0
  idle_velocity: 10.0
  action_on_finish: 0
  mission_exec_times: 1
  yaw_mode: 0
  trace_mode: 0
  action_on_rc_lost: 1
  gimbal_pitch_mode: 1
  mission_waypoint: 
    - 
      latitude: $latitude
      longitude: $longitude
      altitude: $altitude
      damping_distance: 0.20000000298
      target_yaw: 0
      target_gimbal_pitch: 0
      turn_mode: 1
      has_action: 0
      action_time_limit: 60
      waypoint_action: 
        action_repeat: 0
        command_list: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        command_parameter: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    - 
      latitude: $latitude
      longitude: $longitude
      altitude: 1.0
      damping_distance: 0.20000000298
      target_yaw: 0
      target_gimbal_pitch: 0
      turn_mode: 1
      has_action: 0
      action_time_limit: 60
      waypoint_action: 
        action_repeat: 0
        command_list: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        command_parameter: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]")



sleep 5

action=$(rosservice call /dji_sdk/mission_waypoint_action "action: 0" )

sleep 60

python /home/raspberry/Desktop/servoOpen.py


