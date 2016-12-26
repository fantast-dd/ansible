Role Name: zabbix_redis
=======================

    zabbix监控redis服务器info and statistics

Requirements
------------

    None(but make sure you've installed zabbix agent; the zabbix_agentd role is recommand).

Role Variables
--------------

    (see defaults/main.yml)
    # redis状态值监控脚本目录
    scripts: /m2odata/server/zabbix-agent/scripts/
    # zabbix监控Item配置文件目录
    config: /m2odata/server/zabbix-agent/etc/zabbix_agentd.conf.d/

Dependencies
------------
    
    None(but make sure you've installed zabbix agent; the zabbix_agentd role is recommand).

Example Playbook
----------------

    - hosts: test
      vars_files:
        - vars/main.yml
      gather_facts: false
      roles:
         - { role: zabbix_redis }

License
-------

    BSD

Author Information
------------------

    This role was created in 2016/5 by pdd
