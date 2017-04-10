### Installing server
![image4](https://github.com/kickman2l/chef/blob/topic8/installed_server.png)
### Uploading cookbooks to server
![image4](https://github.com/kickman2l/chef/blob/topic8/uploading_cbks.png)
### Uploaded cookbooks on the server
![image4](https://github.com/kickman2l/chef/blob/topic8/uploaded_cbks.png)
### Added environment
![image4](https://github.com/kickman2l/chef/blob/topic8/environment.png)
### Added data bag
![image4](https://github.com/kickman2l/chef/blob/topic8/databag.png)
### Deployed hudson app
![image4](https://github.com/kickman2l/chef/blob/topic8/hudson.png)
### Hudson xml
<?xml version="1.0" encoding="UTF-8"?>
</cumulogic-app>
<single-vm>false</single-vm>
<application>
  <application-context>hudson</application-context>
  <jndi-name></jndi-name>
  <db-name></db-name>
  <db-type></db-type>
<application-file-name>hudson.war</application-file-name>
 <bind-global-services>true</bind-global-services>
</application>
 <services>
    <framework>
      <type>Java EE</type>
       <engine>JBoss Super Test</engine>
    </framework>
  </services>
</cumulogic-app>
