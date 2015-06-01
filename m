Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud6.xs4all.net ([194.109.24.31]:40472 "EHLO
	lb3-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751158AbbFAH4x (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jun 2015 03:56:53 -0400
Message-ID: <1433145409.2361.14.camel@x220>
Subject: Re: make binrpm-pkg problem with Fedora 22
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 01 Jun 2015 09:56:49 +0200
In-Reply-To: <CA+r1ZhieLs6vb6RUZGeVp_crCu-LyYT9DOoAuynBT2xDEh=UCg@mail.gmail.com>
References: <CA+r1ZhieLs6vb6RUZGeVp_crCu-LyYT9DOoAuynBT2xDEh=UCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Fri, 2015-05-29 at 10:16 -0700, Jim Davis wrote:
> On a new Fedora 22 install,  running 'make binrpm-pkg' in the v4.1-rc5
> kernel source tree fails with
> 
> rpm --define "_builddir ." --target \
>     x86_64 -bb ./binkernel.spec
> rpm --target: unknown option
> scripts/package/Makefile:60: recipe for target 'binrpm-pkg' failed

This looks like the issue I ran into a few times after installing
Fedora: the need to install the rpm-build package separately, because it
isn't included in the default install. At least, the installs I do tend
to have it excluded. (The gotcha that I trip over _every_ time is that
rpmbuild is packaged in rpm-build. Note the hyphen.)

> From that makefile,
> 
> # Do we have rpmbuild, otherwise fall back to the older rpm
> RPM := $(shell if [ -x "/usr/bin/rpmbuild" ]; then echo rpmbuild; \
>                    else echo rpm; fi)
> 
> but it looks like the rpmbuild functionality has been taken out of
> (plain) rpm now.

This made me grep rpm's history a bit. I found a change from 2008 that
reads:
    Update rpm manpage wrt build modes
    - the build modes have been removed ages ago, just point to rpmbuild manual

And there's a change from 2000 that already reads:
    Remove build modes from rpm, use rpmb and/or popt glue instead.

We could consult people actually familiar with rpm's history, but it
appears plain rpm hasn't been able to build rpms for quite some time. So
I think scripts/package/Makefile should only (try to) use rpmbuild.

Hope this helps,


Paul Bolle

