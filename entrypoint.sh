if [ ! -f /etc/wgdashboard/src/wgd.sh ]; then
        git clone -q https://github.com/donaldzou/WGDashboard.git /etc/wgdashboardtmp
        cp -r /etc/wgdashboardtmp/* /etc/wgdashboard/
        rm /etc/wgdashboardtmp -R
        cd /etc/wgdashboard/src
        ./wgd.sh install
fi

cd /etc/wgdashboard/src
rm gunicorn.pid
./wgd.sh start
sleep infinity
