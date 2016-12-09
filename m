Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34745 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752850AbcLIE6w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 23:58:52 -0500
Date: Fri, 9 Dec 2016 13:58:57 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [regression ?] kbuild: fix building bzImage with
 CONFIG_TRIM_UNUSED_KSYMS enabled
Message-ID: <20161209045857.GD4661@jagdpanzerIV.localdomain>
References: <20161209024357.GB4661@jagdpanzerIV.localdomain>
 <20161209025637.GC4661@jagdpanzerIV.localdomain>
 <alpine.LFD.2.20.1612082235510.1657@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1612082235510.1657@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On (12/08/16 22:40), Nicolas Pitre wrote:
> > > after 53924022d8a ("kbuild: fix building bzImage withCONFIG_TRIM_UNUSED_KSYMS
> > > enabled") all of my build scripts build the kernel without the modules.
> > 
> > [..]
> > > +# For the kernel to actually contain only the needed exported symbols,
> > > +# we have to build modules as well to determine what those symbols are.
> > > +# (this can be evaluated only once include/config/auto.conf has been included)
> > 					^^^^^
> > 
> > ah, the config. so the patch is wrong.
> 
> Furthermore, the export statement exports the variable not its value. 
> Even if the value is changed afterwards, referencing the exported 
> variable will see the new value.

yeah, need to investigate more. for some, unknown, reason
modules_install gives me empty lib/modules.

the build script (archlinux) builds it in 2 steps: build() and package().
basically:

build:
make -j4 > build_log 2>&1

package:
make -j4 INSTALL_MOD_PATH="${pkgdir}" modules_install >> build_log 2>&1



makepkg
ls -la
pkg/kernel-4.9.0-rc8-dbg-00085-ga37102d-dirty/lib/modules/4.9.0-rc8-dbg-00085-ga37102d-dirty/kernel/
drwxr-xr-x 2 ss ss 4096 Dec  9 13:51 .
drwxr-xr-x 3 ss ss 4096 Dec  9 13:51 ..


git revert 865563924022d8
makepkg
ls -la pkg/kernel-4.9.0-rc8-dbg-00086-g7ea3980-dirty/lib/modules/4.9.0-rc8-dbg-00086-g7ea3980-dirty/kernel/
drwxr-xr-x 10 ss ss 4096 Dec  9 13:55 .
drwxr-xr-x  3 ss ss 4096 Dec  9 13:55 ..
drwxr-xr-x  3 ss ss 4096 Dec  9 13:55 arch
drwxr-xr-x  2 ss ss 4096 Dec  9 13:55 crypto
drwxr-xr-x 14 ss ss 4096 Dec  9 13:55 drivers
drwxr-xr-x  4 ss ss 4096 Dec  9 13:55 fs
drwxr-xr-x  4 ss ss 4096 Dec  9 13:55 lib
drwxr-xr-x  2 ss ss 4096 Dec  9 13:55 mm
drwxr-xr-x  3 ss ss 4096 Dec  9 13:55 net
drwxr-xr-x  5 ss ss 4096 Dec  9 13:55 sound


revert-the-revert

git revert 7ea39801035a23
[master 7b90890] Revert "Revert "kbuild: fix building bzImage with CONFIG_TRIM_UNUSED_KSYMS enabled""


makepkg
ls -la
pkg/kernel-4.9.0-rc8-dbg-00087-g7b90890-dirty/lib/modules/4.9.0-rc8-dbg-00087-g7b90890-dirty/kernel/
drwxr-xr-x 2 ss ss 4096 Dec  9 13:56 .
drwxr-xr-x 3 ss ss 4096 Dec  9 13:56 ..


not sure I see why...

	-ss
