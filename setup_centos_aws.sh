#!/bin/bash

# Install Apache Http 2
yum install httpd git wget && \

# Install mod_security
yum install mod_security && \

# Change to the Apache Http 2 folder:
cd /etc/httpd/modsecurity.d && \

# Clone repo:
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git && \

# Change to the owasp folder:
cd /etc/httpd/modsecurity.d/owasp-modsecurity-crs && \

# Rename the crs-setup.conf.example file:
mv crs-setup.conf.example crs-setup.conf && \

# Change to the rules folder:
cd /etc/httpd/modsecurity.d/owasp-modsecurity-crs/rules && \

# Get IP Management configuration:
wget -c https://raw.githubusercontent.com/softctrl/mod_security_block_ip/master/REQUEST-800-IP-MANAGEMENT.conf && \

# Edit the mod_security.conf file:
echo '
## Be carefull next.
* Now you need to manually edit this file:
	vi /etc/httpd/conf.d/mod_security.conf
	or 
	nano /etc/httpd/conf.d/mod_security.conf

Then, you need to go to the last lines and make those changes:

===================================
= OLD
===================================
    # ModSecurity Core Rules Set and Local configuration
        Include modsecurity.d/*.conf
        Include modsecurity.d/activated_rules/*.conf
        Include modsecurity.d/local_rules/*.conf
===================================

Change to:

===================================
= NEW
===================================
    # ModSecurity Core Rules Set and Local configuration

        Include modsecurity.d/owasp-modsecurity-crs/crs-setup.conf
        Include modsecurity.d/owasp-modsecurity-crs/rules/*.conf

        Include modsecurity.d/*.conf
        Include modsecurity.d/activated_rules/*.conf
        Include modsecurity.d/local_rules/*.conf
===================================

' && \

read -p "Press enter to continue" && \

# Restart the Apache Http2 service

service httpd restart && \

echo "##### Done"
