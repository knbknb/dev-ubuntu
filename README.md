# ubuntu1804-4dev

An Ubuntu 18.04 amd64 Vagrant box with GNOME desktop enabled and some development tools installed. It is based on the official base box [bento/ubuntu-18.04](https://app.vagrantup.com/bento/boxes/ubuntu-18.04). This will install a 6 GB VirtualBox version of the Ubuntu Desktop 64-bit Linux Distribution codenamed "Bionic Beaver".

For a customization see my repo [my-ubuntu1804-4dev](https://github.com/knbknb/my-ubuntu1804-4dev/)

## Requisites

- VirtualBox ([download here, v6 recommended](https://www.virtualbox.org/wiki/Downloads))- a free and open-source hosted hypervisor for x86 virtualization
- Vagrant ([download here](https://www.vagrantup.com/downloads.html))- for building and maintaining portable virtual software development environments


## **Features**

- Visual Studio Code
- Google Chrome, Firefox
- Postman
- Git
- Docker, Docker Compose
- Argbash, bash-it
- OpenJDK 8
- Python3, Python2
- Node.js 12
- Ruby
- cURL
- jq
- 
- Latest VirtualBox Guest Additions

### Build it manually

Clone the repository, start a new terminal there, and run:

``` bash
vagrant up
```


### Package and Deploy to Vagrant-Cloud


After the provision is done, you can turn the VM into a box:

``` bash
vagrant package
```

If you want to deploy it in your Vagrant Cloud, you can use the [`ci/deploy.sh`](ci/deploy.sh). It needs the `VAGRANT_CLOUD_TOKEN` to be set before running.

``` bash
ci/deploy.sh
```


### **Automated Build**

This box is automatically built by [Travis](https://travis-ci.com). Every new commit triggers a new build. He bumps the version and pushes a new tag on the repository, as long as it also releases a new version on Vagrant Cloud. The loop also tests the new deployed box before releasing it by running `vagrant up` of that version. If it fails, it doesn't release the version and deletes it. For more details check the [`.travis.yml`](.travis.yml) and also the [scripts/deploy.sh](scripts/deploy.sh).

The whole process is:

1. Check out the repository
2. Install the dependencies (VirtualBox and Vagrant for example)
3. `vagrant up`
4. `vagrant package`
5. Bumps the version and create a new tag if not running upon a tagged commit
6. Create a new version and upload the box to the Vagrant Cloud
7. Try to `vagrant up` this uploaded box
8. If the last step succeeds, release the version on Vagrant Cloud and push the tag on GitHub (if created). Else, delete the version on Vagrant Cloud and fail the build.

## **Vagrant Cloud**

This box is available on [Vagrant Cloud](https://app.vagrantup.com/felipecassiors/boxes/ubuntu1804-4dev). For using it:

1. Create a new folder on your computer, like `C:\my-ubuntu1804-4dev`.
2. Open a new terminal there and run `vagrant init felipecassiors/ubuntu1804-4dev`.
3. Notice that a new file called `Vagrantfile` was created. In this file, you can set your options for your VM. For a good example, check my other repository: [my-ubuntu1804-4dev](https://github.com/knbknb/my-ubuntu1804-4dev).
4. Run `vagrant up` and be happy!
