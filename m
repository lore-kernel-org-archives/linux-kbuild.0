Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:35568 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752809AbbJLC7Q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Oct 2015 22:59:16 -0400
MIME-Version: 1.0
From: Pranith Kumar <bobby.prani+lkml@gmail.com>
Date: Sun, 11 Oct 2015 22:58:44 -0400
Message-ID: <CAJhHMCA=CGdBdnGKzG05HDPOESgGZvZ=VwDTMUnpgT==mKSe3w@mail.gmail.com>
Subject: bindeb-pkg error (was Re: kbuild misc changes for v4.3-rc1 )
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, andrej.skvortzov@gmail.com, arnaud.patard@rtp-net.org, Borislav Petkov <bp@suse.de>, dmitry.kalinkin@gmail.com, f.fainelli@gmail.com, fabio.estevam@freescale.com, jim.epost@gmail.com, k.kozlowski@samsung.com, linux@rasmusvillemoes.dk, lists@nerdbynature.de, mike.marciniszyn@intel.com, riku.voipio@linaro.org, sboyd@codeaurora.org, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Michal,

On Tue, Sep 8, 2015 at 11:38 AM, Michal Marek <mmarek@suse.cz> wrote:
> Hi Linus,
>
> these are the non-core kbuild changes for 4.3-rc1:
> - deb-pkg:
>   + module signing fix
>   + dtb files are added to the package
>   + do not require `hostname -f` to work during build
>   + make deb-pkg generates a source package, bindeb-pkg has been added
>     to only generate the binary package

It would have been great to not change the functionality of the
target. Instead you could have added srcdeb-pkg to generate both the
source and binary.

Other than that, I keep seeing these errors now:

dpkg-gencontrol: warning: File::FcntlLock not available; using flock
which is not NFS-safe
dpkg-deb: building package `linux-firmware-image-4.3.0-rc4+' in
`../linux-firmware-image-4.3.0-rc4+_4.3.0-rc4+-8_powerpc.deb'.
dpkg-gencontrol: warning: File::FcntlLock not available; using flock
which is not NFS-safe
dpkg-deb: building package `linux-headers-4.3.0-rc4+' in
`../linux-headers-4.3.0-rc4+_4.3.0-rc4+-8_powerpc.deb'.
dpkg-gencontrol: warning: File::FcntlLock not available; using flock
which is not NFS-safe
dpkg-deb: building package `linux-libc-dev' in
`../linux-libc-dev_4.3.0-rc4+-8_powerpc.deb'.
dpkg-gencontrol: warning: File::FcntlLock not available; using flock
which is not NFS-safe
dpkg-deb: building package `linux-image-4.3.0-rc4+' in
`../linux-image-4.3.0-rc4+_4.3.0-rc4+-8_powerpc.deb'.
dpkg-genchanges: warning: package linux-image-4.3.0-rc4 listed in
files list but not in control info
dpkg-genchanges: warning: package linux-firmware-image-4.3.0-rc4
listed in files list but not in control info
dpkg-genchanges: warning: package linux-headers-4.3.0-rc4 listed in
files list but not in control info
dpkg-genchanges: binary-only upload (no source code included)
Use of uninitialized value $b in string eq at
/usr/share/perl5/Dpkg/Arch.pm line 399.
Use of uninitialized value $arch in pattern match (m//) at
/usr/share/perl5/Dpkg/Arch.pm line 335.
Use of uninitialized value $arch in hash element at
/usr/share/perl5/Dpkg/Arch.pm line 340.
dpkg-genchanges: error: cannot fstat file
../linux-firmware-image-4.3.0-rc4_4.3.0-rc4-7_powerpc.deb: No such
file or directory
scripts/package/Makefile:97: recipe for target 'bindeb-pkg' failed
make[1]: *** [bindeb-pkg] Error 2
Makefile:1226: recipe for target 'bindeb-pkg' failed
make: *** [bindeb-pkg] Error 2

Any idea on how to fix this?

Thanks,
Pranith
