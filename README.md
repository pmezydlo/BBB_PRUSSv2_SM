# BBB_PRUSSv2_SM

1.Clone repository:<br>
git clone git@github.com:pmezydlo/BBB_PRUSSv2_SM.git

2.Compile device tree:<br>
dtc -O dtb -I dts -o /lib/firmware/PRU-GPIO-SM-00A0.dtbo -b 0 -@ PRU-GPIO-SM.dts

3.Install DT:<br>
echo PRU-GPIO-SM>/sys/devices/bone_capemgr.9/slots

4.Check DT:<br>
cat /sys/devices/bone_capemgr.9/slots<br>
 <br>
4: ff:P-O-L Bone-LT-eMMC-2G,00A0,Texas Instrument,BB-BONE-EMMC-2G<br>
5: ff:P-O-L Bone-Black-HDMI,00A0,Texas Instrument,BB-BONELT-HDMI<br>
7: ff:P-O-L Override Board Name,00A0,Override Manuf,PRU-GPIO-SM<br>
  

5.Build the project:<br>
make<br>

6.Load sm.bin to PRU with sm:<br>
./sm sm.bin (direction) (number of steps) (number of delay cycle)

for example
./sm sm.bin 0 1000 4000000

