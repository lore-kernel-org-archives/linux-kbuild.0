Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45398 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726665AbeKUTjr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Nov 2018 14:39:47 -0500
Date: Wed, 21 Nov 2018 10:06:03 +0100
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: Backed up kernels
Message-ID: <20181121100603.5afd53ed@endymion>
In-Reply-To: <CAK7LNATyF4GvvoMz0FphfBu739Qvy7L1KzdFcNyj5HhFsYK53Q@mail.gmail.com>
References: <20181120144007.016e4998@endymion>
        <CAK7LNATyF4GvvoMz0FphfBu739Qvy7L1KzdFcNyj5HhFsYK53Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, martin.wilck@suse.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Masahiro,

On Wed, 21 Nov 2018 15:59:49 +0900, Masahiro Yamada wrote:
> On Tue, Nov 20, 2018 at 10:40 PM Jean Delvare <jdelvare@suse.de> wrote:
> > Therefore I am asking, can we change "make install" so that it does NOT
> > create a backup copy of an existing kernel?  
> 
> I think your suggestion makes sense,
> but "make install" is basically implemented
> by arch-specific shell script.
> (For example, arch/x86/boot/install.sh)

Thanks for the pointer. However I have a hard time believing that the
script above is what is run when I call "make install". It looks pretty
old, doesn't support kernel files with version strings, and only knows
of lilo as a boot loader.

But I see there is a hook at the beginning for a user or distribution
provided install script:

if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi

So I guess that what I really care about is the /sbin/installkernel
script on my system, which is part of the dracut package. Which means I
must talk to the dracut package maintainer of my distribution.

> Will you talk to the maintainers
> of architecture you are interested in?
> 
> (or send it to linux-arch@vger.kernel.org)

It doesn't seem x86-specific, as apparently a lot of code was
copy-and-pasted across architectures over time. It probably doesn't
make sense to change it on one architecture and not on the others.

Also, if anyone is using these basic kernel-provided installation
scripts, then keeping a backup may actually make sense, because the
kernel files have no version strings, so a new kernel would always
overwrite the previous one, only leaving one kernel in place. If that
kernel doesn't boot for whatever reason, then game over.

So I think we should leave things as is on the kernel side.

Thanks again,
-- 
Jean Delvare
SUSE L3 Support
