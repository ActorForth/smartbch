# Full node client of smartBCH

This repository contains the code of the full node client of smartBCH, an EVM&amp;Web3 compatible sidechain for Bitcoin Cash.

You can get more information at [smartbch.org](https://smartbch.org).

We are actively developing smartBCH and a testnet will launch soon. Before that, you can [download the source code](https://github.com/smartbch/smartbch/releases/tag/v0.1.0) and start [a private single node testnet](https://docs.smartbch.org/smartbch/developers-guide/runsinglenode) to test your DApp.

[![Go version](https://img.shields.io/badge/go-1.16-blue.svg)](https://golang.org/)
[![API Reference](https://camo.githubusercontent.com/915b7be44ada53c290eb157634330494ebe3e30a/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6c616e672f6764646f3f7374617475732e737667)](https://pkg.go.dev/github.com/smartbch/smartbch)
[![codecov](https://codecov.io/gh/smartbch/smartbch/branch/cover/graph/badge.svg)](https://codecov.io/gh/smartbch/smartbch)
![build workflow](https://github.com/smartbch/smartbch/actions/workflows/main.yml/badge.svg)

## Docker

To run smartBCH via `docker-compose` you can execute the commands below! Note, the first time you run docker-compose it will take a while, as it will need to build the docker image.

### First run the following to init the node:

```
make init
```

This will generate the test-keys and place them in test-keys.txt.
<br/>

### Next run the following to start your service:

```
make up
```
<br/>


### Stopping
You can stop your service by the following:

```
make down
```
<br/>


### Restart
This command will reset your docker container while keeping the volume.

```
make reset
```
<br/>


### Removing the volume
If you wish to remove your nodes data, simply delete the ```smartbch_data``` folder.

This may require sudo.

```
rm -rf smartbch_data/
```
<br/>


## Deploying a contract

### Install metamask
For this use case we will be using metamask, which can be used as a browser extension

Download at: [metamask](https://metamask.io/download.html)

If you do not have an existing wallet, follow the instructions to create a wallet.
Otherwise, import your wallet.

<br/>


## Remix
We will be using [remix](http://remix.ethereum.org/) to deploy our contract, as they have sample contracts available.

<br/>


## Connecting to node

<div align="center">
<img style="vertical-align: middle;" src="./img/metamask_select_network.png" alt="drawing" width="250"/>

First we must select our network. Click the circle in the top right of the extension and navigate to localhost.

<br/>

<img src="./img/metamask_set_chain.png" alt="drawing" width="250"/>

Next we must change the chain id of the network to match our testnet node. Change the chain ID from 1337 to 10001.

<br/>

<img style="vertical-align: middle;" src="./img/metamask_menu.png" alt="drawing" width="250"/>

We must now import an account from our test-keys. Click the import account button.

<br/>

<img src="./img/metamask_pk.png" alt="drawing" width="250"/>

Paste a value from the test-keys.txt file into the private key field.
<br/>

<img src="./img/metamask_after_import.png" alt="drawing" width="250"/>

It should now show that you have 10 ETH
<br/>

<img src="./img/metamask_contracts.png" alt="drawing" width="250"/>

Navigate to the file explorer on the left side menu.

<br/>

<img src="./img/metamask_compile.png" alt="drawing" width="250"/>

Next we need to compile a script, you may be able to add your own script into this menu however we will be compiling one of the examples provided. Right click a contract and select compile.

<br/>

<img src="./img/metamask_deploy.png" alt="drawing" width="250"/>

Navigate to the Deploy and Run transactions menu, the 3rd icon down. If your environment does not show Injected Web 3, please select the environment drop down menu and change the environment.
<br/>

<img src="./img/metamask_injected_web3.png" alt="drawing" width="250"/>

Now that we are on the injected web3 environment, select your compiled contract in the contract field if not already displayed, and select Deploy.

<br/>

<img src="./img/metamask_initial_contract_view.png" alt="drawing" width="250"/>


This will open the metamask extension, and show the initial contract configuration.
We need to edit the gas for our testnet to accept the transaction. Please select EDIT

<br/>

<img src="./img/metamask_set_gas.png" alt="drawing" width="250"/>

The testnet node requires at least 10 GWEI for gas to be accepted. After changing the amount from 0, save the gas priority.

<br/>


<img src="./img/metamask_contract_deploy.png" alt="drawing" width="250"/>

Now your contract should display the corrected gas amount, hit confirm to attempt to broadcast to the network.

<br/>



<img src="./img/metamask_success.png" alt="drawing" width="250"/>

Upon a successful broadcast you should see this message in your console on the bottom of the remix page.

<br/>




