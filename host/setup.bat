:: make sure gow and 7zip is isntalled
:: scoop install gow 7zip

:: exporter
cd %userprofile%/Downloads
mkdir prometheus
cd prometheus
curl -L https://github.com/martinlindhe/wmi_exporter/releases/download/v0.7.999-preview.2/wmi_exporter-0.7.999-preview.2-amd64.exe --output wmi_exporeter.exe
start wmi_exporeter.exe

:: prometheus
cd %userprofile%/Downloads/prometheus
curl -L https://github.com/prometheus/prometheus/releases/download/v2.11.1/prometheus-2.11.1.windows-amd64.tar.gz --output prometheus.tar.gz
tar -xvf prometheus.tar.gz
mv prometheus-2.11.1.windows-amd64 prometheus
cd prometheus
sed -i -e "s/localhost:9090/localhost:9182/" prometheus.yml
start prometheus.exe
start chrome http://localhost:9090

:: grafana
mkdir c:\var\lib\grafana
mkdir c:\var\log\grafana
cd %userprofile%/Downloads/prometheus
curl -L https://dl.grafana.com/oss/release/grafana-6.2.5.windows-amd64.zip --output grafana.zip
7z x grafana.zip
mv grafana-6.2.5 grafana
cd grafana/conf
cp sample.ini custom.ini
sed -i -e "s/;data = \/var\/lib\/grafana/;data = C:\\var\\lib\\grafana/" custom.ini
sed -i -e "s/;logs = \/var\/log\/grafana/;data = C:\\var\\log\\grafana/" custom.ini
sed -i -e "s/;plugins = \/var\/lib\/grafana\/plugins/;plugins = C:\\var\\lib\\grafana\\plugins/" custom.ini
cd %userprofile%/Downloads/prometheus/grafana/bin
start grafana-server.exe
start chrome http://localhost:3000
