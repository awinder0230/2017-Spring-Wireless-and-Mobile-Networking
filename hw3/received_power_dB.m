function p = received_power_dB(base_station_power, ...
                               base_station_height, ...
                               mobile_device_height, ...
                               distance, ...
                               transmitter_gain, ...
                               receiver_gain)
 p = watt_2_dB(dBm_2_watt(base_station_power)) ...
   + watt_2_dB(two_ray_ground_model(base_station_height, mobile_device_height, distance)) ...
   + transmitter_gain + receiver_gain;
end