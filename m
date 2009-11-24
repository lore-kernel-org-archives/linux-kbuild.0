Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34631 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932541AbZKXNM5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 08:12:57 -0500
Message-ID: <4B0BDBDD.7090606@suse.cz>
Date: Tue, 24 Nov 2009 14:13:01 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] scripts/package: add KBUILD_PKG_ROOTCMD variable
References: <20091014064622.GA8711@progeny.tock> <20091014071627.GA6256@merkur.ravnborg.org> <200910141159.03799.elendil@planet.nl> <20091014110331.GZ28231@baikonur.stro.at> <20091015133139.GA6718@progeny.tock> <20091015133532.GB6718@progeny.tock> <4B0BC306.9010009@suse.cz> <20091124120314.GA1926@progeny.tock>
In-Reply-To: <20091124120314.GA1926@progeny.tock>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

On 24.11.2009 13:03, Jonathan Nieder wrote:
> Hi,
> 
> Michal Marek wrote:
>> GNU tar has --owner and --group options to override the owner and group
>> of the files in the archive, something like
>>
>> opts=
>> if tar --owner=root --group=root --help >/dev/null 2>&1; then
>>     opts="--owner=root --group=root"
>> fi
>> tar cf - . $opts ...
>>
>> would make tar-pkg do the right thing automatically without specifying
>> fakeroot.
> 
> Sounds appealing.  Probably it is safe to assume GNU tar is available
> for running tar-pkg. I’ll look into this, though I wouldn’t mind if a
> patch appears before I finish.

I would still fallback to plain tar, you never know what exotic
system users build on and GNU tar is not mentioned in
Documentation/Changes. But you're right, this would be another patch.


>>> @@ -96,10 +100,10 @@ clean-dirs += $(objtree)/tar-install/
>>>  # Help text displayed when executing 'make help'
>>>  # ---------------------------------------------------------------------------
>>>  help: FORCE
>>> +	@echo ' Set KBUILD_PKG_ROOTCMD={sudo|fakeroot -u|...} and make as non-root:'
>>>  	@echo '  rpm-pkg         - Build both source and binary RPM kernel packages'
>>>  	@echo '  binrpm-pkg      - Build only the binary kernel package'
>>>  	@echo '  deb-pkg         - Build the kernel as an deb package'
>>>  	@echo '  tar-pkg         - Build the kernel as an uncompressed tarball'
>>>  	@echo '  targz-pkg       - Build the kernel as a gzip compressed tarball'
>>>  	@echo '  tarbz2-pkg      - Build the kernel as a bzip2 compressed tarball'
> 
> If this variable is to only be used for some targets, this help text
> starts to look out of place.  Maybe make deb-pkg should error out with
> a suggestion to set it if `id -u` is not 0, instead.

Good idea.


> Thanks for the thoughtful review.  Updated patch coming soon.

Thanks!

Michal
