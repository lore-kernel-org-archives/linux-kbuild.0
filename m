Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:36458 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752547Ab1FJDON convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jun 2011 23:14:13 -0400
MIME-Version: 1.0
In-Reply-To: <BANLkTim84t=yeqykZydEjHrVYGnO4xc5ew@mail.gmail.com>
References: <20110609214241.GA4849@sepie.suse.cz>
	<BANLkTim84t=yeqykZydEjHrVYGnO4xc5ew@mail.gmail.com>
Date: Thu, 9 Jun 2011 23:14:13 -0400
Message-ID: <BANLkTi=qaA_AMvq_78eon3Lr86wT2R497g@mail.gmail.com>
Subject: Re: [GIT] kbuild fixes for 3.0
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, pefoley2@verizon.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Thu, Jun 9, 2011 at 8:10 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Jun 9, 2011 at 2:42 PM, Michal Marek <mmarek@suse.cz> wrote:
>>
>>      kbuild: Hack for depmod not handling X.Y versions
>
> This doesn't seem to be enough, I still get (on F-14):
>
>  sh /home/torvalds/v2.6/linux/arch/x86/boot/install.sh
> 3.0-rc2-00251-g7f45e5cd1718-dirty arch/x86/boot/bzImage \
>        System.map "/boot"
>  WARNING: Couldn't open directory
> /tmp/initramfs.Z9p0zm/lib/modules/3.0.0-rc2-00191-g4c1f683a4a34-dirty:
> No such file or directory
>  FATAL: Could not open
> /tmp/initramfs.Z9p0zm/lib/modules/3.0.0-rc2-00191-g4c1f683a4a34-dirty/modules.dep.temp
> for writing: No such file or directory
>  E: "depmod -a 3.0-rc2-00251-g7f45e5cd1718-dirty" failed.
>
> from "make install" when I try to remove the SUBLEVEL.
>
> As a result, the initrd is unusable, and has no modules in it.
>
any chance to share your .config ? x86-64's defconfig, plus Michal
branch merged on top of the tip of your tree, plus the following patch
removing the SUBLEVEL:

diff --git a/Makefile b/Makefile
index 72c0e32..5c75864 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,6 @@
 VERSION = 3
 PATCHLEVEL = 0
-SUBLEVEL = 0
+SUBLEVEL =
 EXTRAVERSION = -rc2
 NAME = Sneaky Weasel

install is fine for me. What bugs me is that "git grep '\.temp'" in
that tree does not return anything relevant.

Thanks,
 - Arnaud
