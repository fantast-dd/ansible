Role Name: zabbix_agentd
========================

    安装zabbix客户端zabbix-agentd(3.0.1)

Requirements
------------
    
    None

Role Variables
--------------

    (see defaults/main.yml)
    # zabbix监控Item配置文件目录
    config: /m2odata/server/zabbix-agent/etc/zabbix_agentd.conf.d/
    # zabbix-agent程序绝对路径
    zabbix_agentd: /m2odata/server/zabbix-agent
    # zabbix-agent程序配置文件
    config: /m2odata/server/zabbix-agent/etc/zabbix_agentd.conf
    # zabbix-agent日志文件绝对路径
    logfile: /m2odata/log/zabbix_agentd.log

Dependencies
------------
    
    None

Example Playbook
----------------

    - hosts: test
      vars_files:
        - vars/main.yml
      gather_facts: false
      roles:
         - { role: zabbix_agentd }

License
-------

    BSD

Author Information
------------------

    This role was created in 2016/5 by pdd
