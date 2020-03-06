#! /usr/bin/env python
import rospy
import importlib
from std_msgs.msg import UInt8
import time
import os

class servoOpen(object):
    def __init__(self):
        self._hunter = rospy.Subscriber('/dji_sdk/flight_status', UInt8, self.stat_flight)
	self.flag = 0
        self.servo()

    def stat_flight(self, msg):
	#rospy.loginfo(msg)
	if msg.data == "0" and flag ==0:
		os.system("python /home/raspberry/Desktop/servoOpen.py")
		os.system("sleep 5;rosnode kill servo_op")


if __name__ == "__main__":
    rospy.init_node('servo_op', log_level=rospy.INFO)
    x = servoOpen()
    rospy.spin()
