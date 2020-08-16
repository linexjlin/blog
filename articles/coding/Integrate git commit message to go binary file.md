## Install [go-bindata](github.com/jteeuwen/go-bindata)
```
go get -u github.com/jteeuwen/go-bindata/...
```

## bind git version log file to binary
like this command 
```
go-bindata .git/logs
```
in Makefile we change this code to 
```
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
VERSIONINFO=".git/logs"
BINDCMD="go-bindata"
UPX=upx
BINARY_NAME=tbot

all: build
build:
        $(BINDCMD) $(VERSIONINFO)
        $(GOBUILD) -o $(BINARY_NAME) -v

release:
        $(BINDCMD) $(VERSIONINFO)
        $(GOBUILD) -ldflags="-s -w" -o $(BINARY_NAME) -v
        $(UPX) $(BINARY_NAME)
clean:
        $(GOCLEAN)
        rm -f $(BINARY_NAME)
```
after run this code it generate a bindata.go with binary data in it.

## Ingore bindata.go
add a new line to .gitignore file like below
```
# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib
nconfig
tbot
config.yaml
bindata.go
```

## Add version flag
like below:
```
const (
        VERSION_FILE = ".git/logs/HEAD"
)

func main() {
        runtime.GOMAXPROCS(runtime.NumCPU())
        version := flag.Bool("version", false, "")
        c := flag.String("conf", "config.yaml", "-conf config.yaml")
        flag.Parse()
        if *version {
                data, _ := Asset(VERSION_FILE)
                fmt.Println(string(data))
                return
        }
...
```
Here is the last effect:

![](https://ipfs.ee/ipfs/QmUR8TAcMvR5Jzws3VTm5dSCGzFMMuTS8B6dRoza4WctFh/2735624c-7ec4-423f-aa3b-4eac1d7f8fc1.png)

after run ```make build``` or ```make release``` command, the commit messages will auto add to to binary file.

