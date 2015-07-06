Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from numascale.com ([213.162.240.84]:56888 "EHLO numascale.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754937AbbGFThV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jul 2015 15:37:21 -0400
From: "Espen Carlsen" <ec@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com> <1436005169.20057.60.camel@tiscali.nl>
In-Reply-To: <1436005169.20057.60.camel@tiscali.nl>
Subject: RE: [PATCH, resend] build: fix broken kernel RPM source symlink
Date: Mon, 6 Jul 2015 21:37:17 +0200
Message-ID: <006601d0b823$2b144820$813cd860$@numascale.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Language: no
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Michal Marek' <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

> From: Paul Bolle [mailto:pebolle@tiscali.nl] On di, 2015-06-30 at
> 13:47 +0200, Espen Carlsen wrote:
> > Fix the 'rpm-pkg' makefile target to always generate the correct 
> > /usr/src/kernel/<ver> symlink; this fails on non-RPM-native systems
>           /kernels/
> > eg Ubuntu.
> > On a non-RPM-native system, the symlink created by rpmbuild points 
> > to the source tree, so the ln -sf commands to overwrite build and 
> > source will create a new link inside the directory pointed to by the 
> > build and source symlinks. This will break the -devel.rpm, as the 
> > build and source symlinks will point to non-existing directories 
> > after installing them.
> Perhaps this is all obvious but what exactly happens currently and 
> what happens after this change? (An example might help readers that 
> are just as easily confused as I am. Perhaps that might also explain 
> why this is only an issue on non-RPM-native systems.)

In my examples, kernel-4.1.0.spec is the kernel.spec file generated from mkspec with the two ln -sf lines commented out to show how it works.
This is the how BUILDROOT looks after rpmbuild -bi kernel-4.1.0.spec on an Ubuntu system, notice that on Ubuntu, there are already a 'build' and 'source' symlink before the ln -sf commands are issued, CentOS however doesn't have those links on the same step.
user@build-ubuntu:/srv/user/rpmbuild$ rpmbuild -bi SPECS/kernel-4.1.0.spec
user@build-ubuntu:/srv/user/rpmbuild$ cd BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0/
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ls -gG
total 64
lrwxrwxrwx 1    35 Jul  6 18:56 build -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
drwxr-xr-x 5  4096 Jul  6 19:00 kernel
-rw-r--r-- 1   640 Jul  6 19:00 modules.alias
-rw-r--r-- 1  1272 Jul  6 19:00 modules.alias.bin
-rw-r--r-- 1  8897 Jul  6 19:00 modules.builtin
-rw-r--r-- 1 11866 Jul  6 19:00 modules.builtin.bin
-rw-r--r-- 1  1155 Jul  6 19:00 modules.dep
-rw-r--r-- 1  2056 Jul  6 19:00 modules.dep.bin
-rw-r--r-- 1    52 Jul  6 19:00 modules.devname
-rw-r--r-- 1   682 Jul  6 19:00 modules.order
-rw-r--r-- 1   131 Jul  6 19:00 modules.softdep
-rw-r--r-- 1  1419 Jul  6 19:00 modules.symbols
-rw-r--r-- 1  1484 Jul  6 19:00 modules.symbols.bin
lrwxrwxrwx 1    35 Jul  6 19:00 source -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$

Now when you manually do the ln -sf ln -sf /usr/src/kernels/4.1.0, 
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ln -sf /usr/src/kernels/4.1.0 build
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ln -sf /usr/src/kernels/4.1.0 source
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ls -gG
total 64
lrwxrwxrwx 1    35 Jul  6 18:56 build -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
drwxr-xr-x 5  4096 Jul  6 19:00 kernel
-rw-r--r-- 1   640 Jul  6 19:00 modules.alias
-rw-r--r-- 1  1272 Jul  6 19:00 modules.alias.bin
-rw-r--r-- 1  8897 Jul  6 19:00 modules.builtin
-rw-r--r-- 1 11866 Jul  6 19:00 modules.builtin.bin
-rw-r--r-- 1  1155 Jul  6 19:00 modules.dep
-rw-r--r-- 1  2056 Jul  6 19:00 modules.dep.bin
-rw-r--r-- 1    52 Jul  6 19:00 modules.devname
-rw-r--r-- 1   682 Jul  6 19:00 modules.order
-rw-r--r-- 1   131 Jul  6 19:00 modules.softdep
-rw-r--r-- 1  1419 Jul  6 19:00 modules.symbols
-rw-r--r-- 1  1484 Jul  6 19:00 modules.symbols.bin
lrwxrwxrwx 1    35 Jul  6 19:00 source -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ 

As you can see, the 'build' and 'source' symlink still points to the same directory as it did before the ln command was issued.
Also you can see in the directory pointed to by the 'build' symlink, that a link to the /usr/src/kernels/4.1.0 was created as '4.1.0':
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ls -gG build/
total 47084
lrwxrwxrwx   1       22 Jul  6 19:03 4.1.0 -> /usr/src/kernels/4.1.0
-rw-r--r--   1    18693 Jun 30 12:30 COPYING
drwxr-xr-x 108    12288 Jun 30 12:30 Documentation
-rw-r--r--   1     2163 Jun 30 12:30 Kbuild
-rw-r--r--   1      252 Jun 30 12:30 Kconfig
-rw-r--r--   1    54359 Jun 30 12:30 Makefile
-rw-r--r--   1   455465 Jul  6 19:00 Module.symvers
-rw-r--r--   1  3268556 Jul  6 19:00 System.map
drwxr-xr-x  33     4096 Jul  6 19:00 arch
drwxr-xr-x   3     4096 Jul  6 18:58 block
drwxr-xr-x   4     4096 Jul  6 18:58 crypto
drwxr-xr-x 122     4096 Jul  6 19:00 drivers
drwxr-xr-x  36     4096 Jul  6 19:00 firmware
drwxr-xr-x  76    12288 Jul  6 18:59 fs
drwxr-xr-x  30     4096 Jul  4 18:15 include
drwxr-xr-x   2     4096 Jul  6 19:00 init
drwxr-xr-x   2     4096 Jul  6 18:58 ipc
drwxr-xr-x  16    12288 Jul  6 18:59 kernel
-rw-r--r--   1     3662 Jul  4 18:20 kernel.spec
drwxr-xr-x  11    20480 Jul  6 18:59 lib
drwxr-xr-x   3    12288 Jul  6 18:58 mm
-rw-r--r--   1     8897 Jul  6 18:58 modules.builtin
-rw-r--r--   1      682 Jul  6 19:00 modules.order
drwxr-xr-x  59     4096 Jul  6 19:00 net
drwxr-xr-x  15     4096 Jun 30 12:30 samples
drwxr-xr-x  14     4096 Jul  6 19:00 scripts
drwxr-xr-x   9     4096 Jul  6 18:58 security
drwxr-xr-x  23     4096 Jul  6 18:59 sound
drwxr-xr-x  21     4096 Jun 30 12:30 tools
drwxr-xr-x   2     4096 Jul  6 18:58 usr
drwxr-xr-x   3     4096 Jun 30 12:30 virt
-rwxr-xr-x   1 24870599 Jul  6 19:00 vmlinux
-rw-r--r--   1 26536701 Jul  6 19:00 vmlinux.o
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ 

Now, if I instead add -T to the ln command, like this:
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ln -sfT /usr/src/kernels/4.1.0 build
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ln -sfT /usr/src/kernels/4.1.0 source
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$ ls -gG
total 64
lrwxrwxrwx 1    22 Jul  6 19:06 build -> /usr/src/kernels/4.1.0
drwxr-xr-x 5  4096 Jul  6 19:00 kernel
-rw-r--r-- 1   640 Jul  6 19:00 modules.alias
-rw-r--r-- 1  1272 Jul  6 19:00 modules.alias.bin
-rw-r--r-- 1  8897 Jul  6 19:00 modules.builtin
-rw-r--r-- 1 11866 Jul  6 19:00 modules.builtin.bin
-rw-r--r-- 1  1155 Jul  6 19:00 modules.dep
-rw-r--r-- 1  2056 Jul  6 19:00 modules.dep.bin
-rw-r--r-- 1    52 Jul  6 19:00 modules.devname
-rw-r--r-- 1   682 Jul  6 19:00 modules.order
-rw-r--r-- 1   131 Jul  6 19:00 modules.softdep
-rw-r--r-- 1  1419 Jul  6 19:00 modules.symbols
-rw-r--r-- 1  1484 Jul  6 19:00 modules.symbols.bin
lrwxrwxrwx 1    22 Jul  6 19:06 source -> /usr/src/kernels/4.1.0 
user@build-ubuntu:/srv/user/rpmbuild/BUILDROOT/kernel-4.1.0-1.x86_64/lib/modules/4.1.0$
 
You can see that it overwrites the existing symlink with the correct one instead of creating a new link inside the directory pointed to by the old symlink.

To sum it all up, without the change to mkspec, the package 'kernel-devel' package generated on an Ubuntu system is broken, as '/lib/modules/4.1.0/build' points to a directory that will not be on the server where the package is installed on:
user@build-ubuntu:/srv/user/rpmbuild/RPMS/x86_64$ rpm -qplv kernel-devel-4.1.0-1.x86_64.rpm
lrwxrwxrwx    1 root    root                       35 Jul  4 18:31 /lib/modules/4.1.0/build -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
lrwxrwxrwx    1 root    root                       35 Jul  6 12:15 /lib/modules/4.1.0/source -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
drwxr-xr-x    2 root    root                        0 Jul  6 12:15 /usr/src/kernels/4.1.0

> It doesn't help that the description of -T in "man ln" is rather 
> unhelpful. "info ln" was better, after following some references, but 
> I'm still not sure what it buys you for this issue.

> > --- a/scripts/package/mkspec
> > +++ b/scripts/package/mkspec
> 
> > -echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
> > -echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
> > +echo "ln -sfT /usr/src/kernels/$KERNELRELEASE build"
> > +echo "ln -sfT /usr/src/kernels/$KERNELRELEASE source"

Espen Carlsen


