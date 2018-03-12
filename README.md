# docker-teamspeak
Docker image for teamspeak 3 server
based on debian stretch

This docker images provides a Teamspeak 3 server with self-update mechanism on startup. Due to persistent storage it is easy to import/export Teamspeak 3 data such as database or license.

## Usage

**Full example**

```
docker run -d --name teamspeak -v /home/mountme/:/usr/local/teamspeak/mounted -p 9987:9987/udp -p 2010:2010/udp -p 30033:30033 -p 10011:10011 -p 41144:41144 -p 2008:2008 -e LICENSE=accept halfbax/docker-teamspeak
```
After your first run you can delete **-e LICENSE=accept** from your start command.


**License agreement**

On your **first run** without an imported agreement you have to accept it by running this once.
```
docker run -d --name teamspeak -e LICENSE=accept ...
```

**Persitent storage** 
( */usr/local/teamspeak/mounted* is **static**. Do not modify this value unless you know what you are doing. ):
```
docker run -d --name teamspeak -v /home/mountme/:/usr/local/teamspeak/mounted ...
```


**Ports**

Default port (UDP incoming): 9987
Default filetransfer port (TCP outgoing): 30033
Default serverquery port (TCP incoming): 10011
Default weblist port (UDP outgoing): 2010
Default tsdns port (TCP outgoing): 41144
Default accounting port (TCP outgoing): 2008

```
docker run -d --name teamspeak -p 9987:9987/udp -p 2010:2010/udp -p 30033:30033 -p 10011:10011 -p 41144:41144 -p 2008:2008
```

## License

Released under the [MIT](LICENSE) license
