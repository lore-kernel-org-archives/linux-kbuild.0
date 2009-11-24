Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.211.182]:46923 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932121AbZKXLva (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 06:51:30 -0500
Received: by ywh12 with SMTP id 12so6276934ywh.21
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2009 03:51:36 -0800 (PST)
Date: Tue, 24 Nov 2009 06:03:14 -0600
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH v2 1/2] scripts/package: add KBUILD_PKG_ROOTCMD variable
Message-ID: <20091124120314.GA1926@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
 <20091015133139.GA6718@progeny.tock>
 <20091015133532.GB6718@progeny.tock>
 <4B0BC306.9010009@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4B0BC306.9010009@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Hi,

Michal Marek wrote:
> Dne 15.10.2009 15:35, Jonathan Nieder napsal(a):

>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>> index f67cc88..6997f38 100644
>> --- a/scripts/package/Makefile
>> +++ b/scripts/package/Makefile
>> @@ -53,7 +53,8 @@ rpm-pkg rpm: $(objtree)/kernel.spec FORCE
>>  	set -e; \
>>  	mv -f $(objtree)/.tmp_version $(objtree)/.version
>>  
>> -	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta ../$(KERNELPATH).tar.gz
>> +	$(KBUILD_PKG_ROOTCMD) $(RPM) $(RPMOPTS) --target $(UTS_MACHINE) \
>> +		-ta ../$(KERNELPATH).tar.gz
>>  	rm ../$(KERNELPATH).tar.gz
>>  
>>  clean-files := $(objtree)/kernel.spec
>> @@ -70,8 +71,9 @@ binrpm-pkg: $(objtree)/binkernel.spec FORCE
>>  	set -e; \
>>  	mv -f $(objtree)/.tmp_version $(objtree)/.version
>>  
>> -	$(RPM) $(RPMOPTS) --define "_builddir $(objtree)" --target \
>> -		$(UTS_MACHINE) -bb $<
>> +	$(KBUILD_PKG_ROOTCMD) $(RPM) $(RPMOPTS) \
>> +		--define "_builddir $(objtree)" \
>> +		--target $(UTS_MACHINE) -bb $<
> 
> Why is this needed for the rpm targets? The generates spec file doesn't
> require root privileges and correctly sets root as the owner of the
> packaged files.

It was my ignorance of how rpm works.

> GNU tar has --owner and --group options to override the owner and group
> of the files in the archive, something like
> 
> opts=
> if tar --owner=root --group=root --help >/dev/null 2>&1; then
>     opts="--owner=root --group=root"
> fi
> tar cf - . $opts ...
> 
> would make tar-pkg do the right thing automatically without specifying
> fakeroot.

Sounds appealing.  Probably it is safe to assume GNU tar is available
for running tar-pkg.  I’ll look into this, though I wouldn’t mind if a
patch appears before I finish.

> I don't know about deb-pkg, if it needs fakeroot, let's add
> the variable, but it's not needed for *rpm-pkg and after a simple change
> to buildtar it would not be needed for tar-pkg.

Yes, deb-pkg needs it.

>> @@ -96,10 +100,10 @@ clean-dirs += $(objtree)/tar-install/
>>  # Help text displayed when executing 'make help'
>>  # ---------------------------------------------------------------------------
>>  help: FORCE
>> +	@echo ' Set KBUILD_PKG_ROOTCMD={sudo|fakeroot -u|...} and make as non-root:'
>>  	@echo '  rpm-pkg         - Build both source and binary RPM kernel packages'
>>  	@echo '  binrpm-pkg      - Build only the binary kernel package'
>>  	@echo '  deb-pkg         - Build the kernel as an deb package'
>>  	@echo '  tar-pkg         - Build the kernel as an uncompressed tarball'
>>  	@echo '  targz-pkg       - Build the kernel as a gzip compressed tarball'
>>  	@echo '  tarbz2-pkg      - Build the kernel as a bzip2 compressed tarball'

If this variable is to only be used for some targets, this help text
starts to look out of place.  Maybe make deb-pkg should error out with
a suggestion to set it if `id -u` is not 0, instead.

Thanks for the thoughtful review.  Updated patch coming soon.
