### How to package Nelson on Chocolatey:

## Get api key here:

```
https://community.chocolatey.org/account/Packages
```

```
choco pack
choco install nelson.v1.5.0.4088.nupkg -dv -s .

choco apikey -k <your key here> -s https://push.chocolatey.org/
choco push nelson.1.5.0.4088.nupkg -s https://push.chocolatey.org/
```
