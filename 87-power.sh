#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require tlp thermald
sudo tee /etc/thermald/thermal-conf.xml >/dev/null <<EOF
<?xml version="1.0"?>
<ThermalConfiguration>
  <Platform>
    <Name>Lenovo ThinkPad X220</Name>
    <ProductName>*</ProductName>
    <Preference>QUIET</Preference>
    <ThermalZones>
      <ThermalZone>
        <Type>cpu</Type>
        <TripPoints>
          <TripPoint>
            <Temperature>86000</Temperature>
            <type>passive</type>
          </TripPoint>
        </TripPoints>
      </ThermalZone>
    </ThermalZones>
  </Platform>
</ThermalConfiguration>
EOF

sudo sed -i 's/^#*\s*CPU_SCALING_GOVERNOR_ON_AC=.*/CPU_SCALING_GOVERNOR_ON_AC=performance/' /etc/default/tlp
sudo sed -i 's/^#*\s*CPU_SCALING_GOVERNOR_ON_BAT=.*/CPU_SCALING_GOVERNOR_ON_BAT=powersave/' /etc/default/tlp
sudo tlp start

sudo tee /etc/rc.local >/dev/null <<EOF
#!/bin/sh -e

/opt/thermald/sbin/thermald --workaround-enabled --config-file /etc/thermald/thermal-conf.xml
exit 0
EOF

epilogue
