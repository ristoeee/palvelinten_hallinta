# My first module for Linux servers

## Monitoring with Prometheus and Node Explorer, visualization with Grafana

*To use this, you should be familiar with **Salt** (https://docs.saltproject.io/salt/install-guide/en/latest/index.html) as this module is using it.*


![Screenshot 2024-11-30 192457](https://github.com/user-attachments/assets/6026beea-0679-49bb-8be2-9981ac8a83bc)


## How to install

Copy everything under ´salt´ folder from this repo to your master's `/srv/salt/` folder and then run command `sudo salt '*' state.apply monitoring` or you can spefify the slaves you want to run it. Installation may take a minute or two so sit back and enjoy your coffee. 

After installation is completed, head to your <minion_IP:3000> and start building your dashboards with Grafana.

The h5.md file is a report of doing this module and there's more detailed steps, but it's in Finnish at the moment.


Risto Ennevaara | http://ennevaara.com/
