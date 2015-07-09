Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from numascale.com ([213.162.240.84]:58692 "EHLO numascale.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750923AbbGIJaF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jul 2015 05:30:05 -0400
From: "Espen Carlsen" <ec@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>	 <1436005169.20057.60.camel@tiscali.nl>	 <006601d0b823$2b144820$813cd860$@numascale.com> <1436374582.20619.40.camel@tiscali.nl>
In-Reply-To: <1436374582.20619.40.camel@tiscali.nl>
Subject: RE: [PATCH, resend] build: fix broken kernel RPM source symlink
Date: Thu, 9 Jul 2015 11:29:57 +0200
Message-ID: <013001d0ba29$d2254df0$766fe9d0$@numascale.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Language: no
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Paul Bolle' <pebolle@tiscali.nl>
Cc: 'Michal Marek' <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

> From: Paul Bolle [mailto:pebolle@tiscali.nl]
> [I resisted looking into the flood of info you included in this message.
> But this part could turn out to be interesting.]
> On ma, 2015-07-06 at 21:37 +0200, Espen Carlsen wrote:
> > This is the how BUILDROOT looks after rpmbuild -bi kernel-4.1.0.spec
> > on an Ubuntu system, notice that on Ubuntu, there are already a
> > 'build' and 'source' symlink before the ln -sf commands are issued,
> > CentOS however doesn't have those links on the same step.
> > user@build-ubuntu:/srv/user/rpmbuild$ rpmbuild -bi
> > SPECS/kernel-4.1.0.spec
> That is outside the realm of "make rpm".
> I assume kernel-4.1.0.spec was a copy, somehow made, of kernel.spec as
> was created by "make rpm". Does it matter, for the issue you ran into,
> whether "make rpm" or "rpmbuild -bb SPECS/kernel.spec" is involved?

During "make rpm", I copied the tar.gz and kernel.spec files, so I could debug.
The reason for using "rpmbuild -bb" instead is that it goes faster to get to the same point than 
"make rpm". But I can reproduce the issue both with "make rpm" and "rpmbuild -bb".

> > user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ls -gG total 64
> > lrwxrwxrwx 1    35 Jul  6 18:56 build -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
> > [...]
> > lrwxrwxrwx 1    35 Jul  6 19:00 source -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
> These two links are, I think, generated in this snippet from the main
> Makefile:
> _modinst_:
>         @rm -rf $(MODLIB)/kernel
>         @rm -f $(MODLIB)/source
>         @mkdir -p $(MODLIB)/kernel
>         @ln -s `cd $(srctree) && /bin/pwd` $(MODLIB)/source
>         @if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
>                 rm -f $(MODLIB)/build ; \
>                 ln -s $(CURDIR) $(MODLIB)/build ; \
>         fi
>         @cp -f $(objtree)/modules.order $(MODLIB)/
>         @cp -f $(objtree)/modules.builtin $(MODLIB)/
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
> I wonder why you don't see similar links when building on CentOS. I saw
> similar links in rpm's BUILDROOT when building on Fedora 22.

I just did my test on Fedora 22.
As I stated in the example email, you have to comment out or remove:
ln -sf /usr/src/kernels/4.1.0 build
ln -sf /usr/src/kernels/4.1.0 source
from the %install section of the .spec file.

Without them, you'll notice that on Fedora 22 Server, when compiling the kernel, the "build" and "source" links aren't there.
That's what those two lines in the spec file are for, to add the "build" and "source" symlinks.
On an Ubuntu system however, the links are there, so the ln -sf lines will not overwrite the existing ones, instead there will be created a new symlink inside the directory that build and source points to named "4.1.0" pointing to /usr/src/kernels/4.1.0 (look at the example mail).
Changing the lines:
ln -sf /usr/src/kernels/4.1.0 build
ln -sf /usr/src/kernels/4.1.0 source
to:
ln -sfT /usr/src/kernels/4.1.0 build
ln -sfT /usr/src/kernels/4.1.0 source
Will change the spec script to overwrite the existing links on the Ubuntu type systems so it will be correct.

Espen

