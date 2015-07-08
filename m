Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:58683 "EHLO
	lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932672AbbGHQ4Z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 12:56:25 -0400
Message-ID: <1436374582.20619.40.camel@tiscali.nl>
Subject: Re: [PATCH, resend] build: fix broken kernel RPM source symlink
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 08 Jul 2015 18:56:22 +0200
In-Reply-To: <006601d0b823$2b144820$813cd860$@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>
	 <1436005169.20057.60.camel@tiscali.nl>
	 <006601d0b823$2b144820$813cd860$@numascale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Espen Carlsen <ec@numascale.com>
Cc: 'Michal Marek' <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

[I resisted looking into the flood of info you included in this message.
But this part could turn out to be interesting.]

On ma, 2015-07-06 at 21:37 +0200, Espen Carlsen wrote:
> This is the how BUILDROOT looks after rpmbuild -bi kernel-4.1.0.spec 
> on an Ubuntu system, notice that on Ubuntu, there are already a 
> 'build' and 'source' symlink before the ln -sf commands are issued, 
> CentOS however doesn't have those links on the same step.
> user@build-ubuntu:/srv/user/rpmbuild$ rpmbuild -bi SPECS/kernel-4.1.0.spec

That is outside the realm of "make rpm".

I assume kernel-4.1.0.spec was a copy, somehow made, of kernel.spec as
was created by "make rpm". Does it matter, for the issue you ran into,
whether "make rpm" or "rpmbuild -bb SPECS/kernel.spec" is involved?

> user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ls -gG
> total 64
> lrwxrwxrwx 1    35 Jul  6 18:56 build -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
> [...]
> lrwxrwxrwx 1    35 Jul  6 19:00 source -> /srv/user/rpmbuild/BUILD/kernel-4.1.0

These two links are, I think, generated in this snippet from the main
Makefile:
_modinst_:
        @rm -rf $(MODLIB)/kernel
        @rm -f $(MODLIB)/source
        @mkdir -p $(MODLIB)/kernel
        @ln -s `cd $(srctree) && /bin/pwd` $(MODLIB)/source
        @if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
                rm -f $(MODLIB)/build ; \
                ln -s $(CURDIR) $(MODLIB)/build ; \
        fi
        @cp -f $(objtree)/modules.order $(MODLIB)/
        @cp -f $(objtree)/modules.builtin $(MODLIB)/
        $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst

I wonder why you don't see similar links when building on CentOS. I saw
similar links in rpm's BUILDROOT when building on Fedora 22.

Thanks,


Paul Bolle
