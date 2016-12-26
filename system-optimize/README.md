Role Name: system-optimize
====================

    系统优化

Requirements
------------
    
    None

Role Variables
--------------

    (see defaults/main.yml)

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
         - { role: system-optimize }

License
-------

    BSD

Author Information
------------------

    This role was created in 2016/5 by pdd
