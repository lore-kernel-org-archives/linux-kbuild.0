Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35888 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932654AbZKXL05 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 06:26:57 -0500
Message-ID: <4B0BC306.9010009@suse.cz>
Date: Tue, 24 Nov 2009 12:27:02 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] scripts/package: add KBUILD_PKG_ROOTCMD variable
References: <20091014064622.GA8711@progeny.tock> <20091014071627.GA6256@merkur.ravnborg.org> <200910141159.03799.elendil@planet.nl> <20091014110331.GZ28231@baikonur.stro.at> <20091015133139.GA6718@progeny.tock> <20091015133532.GB6718@progeny.tock>
In-Reply-To: <20091015133532.GB6718@progeny.tock>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Dne 15.10.2009 15:35, Jonathan Nieder napsal(a):
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index f67cc88..6997f38 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -53,7 +53,8 @@ rpm-pkg rpm: $(objtree)/kernel.spec FORCE
>  	set -e; \
>  	mv -f $(objtree)/.tmp_version $(objtree)/.version
>  
> -	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta ../$(KERNELPATH).tar.gz
> +	$(KBUILD_PKG_ROOTCMD) $(RPM) $(RPMOPTS) --target $(UTS_MACHINE) \
> +		-ta ../$(KERNELPATH).tar.gz
>  	rm ../$(KERNELPATH).tar.gz
>  
>  clean-files := $(objtree)/kernel.spec
> @@ -70,8 +71,9 @@ binrpm-pkg: $(objtree)/binkernel.spec FORCE
>  	set -e; \
>  	mv -f $(objtree)/.tmp_version $(objtree)/.version
>  
> -	$(RPM) $(RPMOPTS) --define "_builddir $(objtree)" --target \
> -		$(UTS_MACHINE) -bb $<
> +	$(KBUILD_PKG_ROOTCMD) $(RPM) $(RPMOPTS) \
> +		--define "_builddir $(objtree)" \
> +		--target $(UTS_MACHINE) -bb $<

Why is this needed for the rpm targets? The generates spec file doesn't
require root privileges and correctly sets root as the owner of the
packaged files.


>  clean-files += $(objtree)/binkernel.spec
>  
> @@ -79,7 +81,8 @@ clean-files += $(objtree)/binkernel.spec
>  # ---------------------------------------------------------------------------
>  deb-pkg: FORCE
>  	$(MAKE) KBUILD_SRC=
> -	$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
> +	$(KBUILD_PKG_ROOTCMD) $(CONFIG_SHELL) \
> +		$(srctree)/scripts/package/builddeb
>  
>  clean-dirs += $(objtree)/debian/
>  
> @@ -88,7 +91,8 @@ clean-dirs += $(objtree)/debian/
>  # ---------------------------------------------------------------------------
>  tar%pkg: FORCE
>  	$(MAKE) KBUILD_SRC=
> -	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
> +	$(KBUILD_PKG_ROOTCMD) $(CONFIG_SHELL) \
> +		$(srctree)/scripts/package/buildtar $@

GNU tar has --owner and --group options to override the owner and group
of the files in the archive, something like

opts=
if tar --owner=root --group=root --help >/dev/null 2>&1; then
    opts="--owner=root --group=root"
fi
tar cf - . $opts ...

would make tar-pkg do the right thing automatically without specifying
fakeroot. I don't know about deb-pkg, if it needs fakeroot, let's add
the variable, but it's not needed for *rpm-pkg and after a simple change
to buildtar it would not be needed for tar-pkg.

Michal

>  
>  clean-dirs += $(objtree)/tar-install/
>  
> @@ -96,10 +100,10 @@ clean-dirs += $(objtree)/tar-install/
>  # Help text displayed when executing 'make help'
>  # ---------------------------------------------------------------------------
>  help: FORCE
> +	@echo ' Set KBUILD_PKG_ROOTCMD={sudo|fakeroot -u|...} and make as non-root:'
>  	@echo '  rpm-pkg         - Build both source and binary RPM kernel packages'
>  	@echo '  binrpm-pkg      - Build only the binary kernel package'
>  	@echo '  deb-pkg         - Build the kernel as an deb package'
>  	@echo '  tar-pkg         - Build the kernel as an uncompressed tarball'
>  	@echo '  targz-pkg       - Build the kernel as a gzip compressed tarball'
>  	@echo '  tarbz2-pkg      - Build the kernel as a bzip2 compressed tarball'
> -

