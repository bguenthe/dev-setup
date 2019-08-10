# damit wird das node verzeichnis nicht geshared
mkdir -p -m a+rwX /noderedirect/finanzstatus-gui/node_modules
mkdir -p -m a+rwX /repos/finanzstatus-gui/node_modules
sudo mount --bind /noderedirect/finanzstatus-gui/node_modules /repos/finanzstatus-gui/node_modules
cd /repos/finanzstatus-gui
npm install