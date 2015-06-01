Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:32943 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038AbbFAU40 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jun 2015 16:56:26 -0400
Received: by labpy14 with SMTP id py14so99102618lab.0
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2015 13:56:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433145409.2361.14.camel@x220>
References: <CA+r1ZhieLs6vb6RUZGeVp_crCu-LyYT9DOoAuynBT2xDEh=UCg@mail.gmail.com>
	<1433145409.2361.14.camel@x220>
Date: Mon, 1 Jun 2015 13:56:25 -0700
Message-ID: <CA+r1ZhiyQbakrxr4saPE_mFjwjGG4aJxLHm3oCvqD=4=ByBA_w@mail.gmail.com>
Subject: Re: make binrpm-pkg problem with Fedora 22
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Mon, Jun 1, 2015 at 12:56 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> On Fri, 2015-05-29 at 10:16 -0700, Jim Davis wrote:
>> On a new Fedora 22 install,  running 'make binrpm-pkg' in the v4.1-rc5
>> kernel source tree fails with
>>
>> rpm --define "_builddir ." --target \
>>     x86_64 -bb ./binkernel.spec
>> rpm --target: unknown option
>> scripts/package/Makefile:60: recipe for target 'binrpm-pkg' failed
>
> This looks like the issue I ran into a few times after installing
> Fedora: the need to install the rpm-build package separately, because it
> isn't included in the default install. At least, the installs I do tend
> to have it excluded. (The gotcha that I trip over _every_ time is that
> rpmbuild is packaged in rpm-build. Note the hyphen.)
>
>> From that makefile,
>>
>> # Do we have rpmbuild, otherwise fall back to the older rpm
>> RPM := $(shell if [ -x "/usr/bin/rpmbuild" ]; then echo rpmbuild; \
>>                    else echo rpm; fi)
>>
>> but it looks like the rpmbuild functionality has been taken out of
>> (plain) rpm now.
>
> This made me grep rpm's history a bit. I found a change from 2008 that
> reads:
>     Update rpm manpage wrt build modes
>     - the build modes have been removed ages ago, just point to rpmbuild manual
>
> And there's a change from 2000 that already reads:
>     Remove build modes from rpm, use rpmb and/or popt glue instead.

Right; the most recent Fedora documentation on rpm I could find
(http://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch08s02.html)
said the rpm -b passthrough to rpmbuild went away in version 4.1,
which was released in 2002.  Downloading the 4.1 tarball, and the
4.0.4 tarball before it, and comparing the man pages, it looks like
4.1 was indeed the last version where that trick in the makefile would
have worked.

>
> We could consult people actually familiar with rpm's history, but it
> appears plain rpm hasn't been able to build rpms for quite some time. So
> I think scripts/package/Makefile should only (try to) use rpmbuild.

I'll see if I can knock together a patch in my copious spare time.

Jim
