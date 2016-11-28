Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34410 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752099AbcK1Sqo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2016 13:46:44 -0500
Date: Tue, 29 Nov 2016 02:46:39 +0800
From: Cheah Kok Cheong <thrust73@gmail.com>
Subject: Re: [PATCH] Scripts: kconfig: nconf: fix _GNU_SOURCE redefined
 warning
Message-ID: <20161128184639.GB16562@linux-Precision-WorkStation-T5500>
References: <1480264106-29881-1-git-send-email-thrust73@gmail.com>
 <5d8cb4b1-fe87-5daf-432b-d6612196a9fc@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5d8cb4b1-fe87-5daf-432b-d6612196a9fc@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Did not add anything. I append output of "make nconfig --trace" and "gcc -v"
below. The -D_GNU_SOURCE flag appeared as it goes into scripts/kconfig.
See whether you can spot anything else.
Sorry for the unwrapped output.

Thanks,
CheahKC

$ make nconfig --trace
Makefile:447: target 'scripts_basic' does not exist
make -f ./scripts/Makefile.build obj=3Dscripts/basic
scripts/Makefile.host:107: update target 'scripts/basic/fixdep' due to: FOR=
CE
set -e;  echo '  HOSTCC  scripts/basic/fixdep'; gcc -Wp,-MD,scripts/basic/.=
fixdep.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-po=
inter -std=3Dgnu89     -o scripts/basic/fixdep scripts/basic/fixdep.c  ; sc=
ripts/basic/fixdep scripts/basic/.fixdep.d scripts/basic/fixdep 'gcc -Wp,-M=
D,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O=
2 -fomit-frame-pointer -std=3Dgnu89     -o scripts/basic/fixdep scripts/bas=
ic/fixdep.c  ' > scripts/basic/.fixdep.tmp; rm -f scripts/basic/.fixdep.d; =
mv -f scripts/basic/.fixdep.tmp scripts/basic/.fixdep.cmd;
  HOSTCC  scripts/basic/fixdep
scripts/Makefile.build:98: update target '__build' due to: scripts/basic/fi=
xdep
:
rm -f .tmp_quiet_recordmcount
Makefile:545: update target 'nconfig' due to: scripts_basic outputmakefile =
FORCE
make -f ./scripts/Makefile.build obj=3Dscripts/kconfig nconfig
scripts/Makefile.host:124: update target 'scripts/kconfig/nconf.o' due to: =
scripts/kconfig/nconf.c FORCE
set -e;  echo '  HOSTCC  scripts/kconfig/nconf.o'; gcc -Wp,-MD,scripts/kcon=
fig/.nconf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-fr=
ame-pointer -std=3Dgnu89   -D_GNU_SOURCE -DCURSES_LOC=3D"<ncurses.h>" -DLOC=
ALE   -c -o scripts/kconfig/nconf.o scripts/kconfig/nconf.c; scripts/basic/=
fixdep scripts/kconfig/.nconf.o.d scripts/kconfig/nconf.o 'gcc -Wp,-MD,scri=
pts/kconfig/.nconf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -=
fomit-frame-pointer -std=3Dgnu89   -D_GNU_SOURCE -DCURSES_LOC=3D"<ncurses.h=
>" -DLOCALE   -c -o scripts/kconfig/nconf.o scripts/kconfig/nconf.c' > scri=
pts/kconfig/.nconf.o.tmp; rm -f scripts/kconfig/.nconf.o.d; mv -f scripts/k=
config/.nconf.o.tmp scripts/kconfig/.nconf.o.cmd;
  HOSTCC  scripts/kconfig/nconf.o
scripts/kconfig/nconf.c:8:0: warning: "_GNU_SOURCE" redefined
 #define _GNU_SOURCE
 ^
<command-line>:0:0: note: this is the location of the previous definition
scripts/Makefile.host:124: update target 'scripts/kconfig/zconf.tab.o' due =
to: scripts/kconfig/zconf.tab.c FORCE scripts/kconfig/zconf.lex.c scripts/k=
config/zconf.hash.c
set -e;  echo '  HOSTCC  scripts/kconfig/zconf.tab.o'; gcc -Wp,-MD,scripts/=
kconfig/.zconf.tab.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -=
fomit-frame-pointer -std=3Dgnu89   -D_GNU_SOURCE -DCURSES_LOC=3D"<ncurses.h=
>" -DLOCALE  -Iscripts/kconfig -c -o scripts/kconfig/zconf.tab.o scripts/kc=
onfig/zconf.tab.c; scripts/basic/fixdep scripts/kconfig/.zconf.tab.o.d scri=
pts/kconfig/zconf.tab.o 'gcc -Wp,-MD,scripts/kconfig/.zconf.tab.o.d -Wall -=
Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu=
89   -D_GNU_SOURCE -DCURSES_LOC=3D"<ncurses.h>" -DLOCALE  -Iscripts/kconfig=
 -c -o scripts/kconfig/zconf.tab.o scripts/kconfig/zconf.tab.c' > scripts/k=
config/.zconf.tab.o.tmp; rm -f scripts/kconfig/.zconf.tab.o.d; mv -f script=
s/kconfig/.zconf.tab.o.tmp scripts/kconfig/.zconf.tab.o.cmd;
  HOSTCC  scripts/kconfig/zconf.tab.o
scripts/Makefile.host:124: update target 'scripts/kconfig/nconf.gui.o' due =
to: scripts/kconfig/nconf.gui.c FORCE
set -e;  echo '  HOSTCC  scripts/kconfig/nconf.gui.o'; gcc -Wp,-MD,scripts/=
kconfig/.nconf.gui.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -=
fomit-frame-pointer -std=3Dgnu89   -D_GNU_SOURCE -DCURSES_LOC=3D"<ncurses.h=
>" -DLOCALE   -c -o scripts/kconfig/nconf.gui.o scripts/kconfig/nconf.gui.c=
; scripts/basic/fixdep scripts/kconfig/.nconf.gui.o.d scripts/kconfig/nconf=
=2Egui.o 'gcc -Wp,-MD,scripts/kconfig/.nconf.gui.o.d -Wall -Wmissing-protot=
ypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu89   -D_GNU_SOU=
RCE -DCURSES_LOC=3D"<ncurses.h>" -DLOCALE   -c -o scripts/kconfig/nconf.gui=
=2Eo scripts/kconfig/nconf.gui.c' > scripts/kconfig/.nconf.gui.o.tmp; rm -f=
 scripts/kconfig/.nconf.gui.o.d; mv -f scripts/kconfig/.nconf.gui.o.tmp scr=
ipts/kconfig/.nconf.gui.o.cmd;
  HOSTCC  scripts/kconfig/nconf.gui.o
scripts/Makefile.host:116: update target 'scripts/kconfig/nconf' due to: FO=
RCE scripts/kconfig/nconf.o scripts/kconfig/zconf.tab.o scripts/kconfig/nco=
nf.gui.o
set -e;  echo '  HOSTLD  scripts/kconfig/nconf'; gcc  -o scripts/kconfig/nc=
onf scripts/kconfig/nconf.o scripts/kconfig/zconf.tab.o scripts/kconfig/nco=
nf.gui.o  -lmenu -lpanel -lncurses -ltinfo; printf '%s\n' 'cmd_scripts/kcon=
fig/nconf :=3D gcc  -o scripts/kconfig/nconf scripts/kconfig/nconf.o script=
s/kconfig/zconf.tab.o scripts/kconfig/nconf.gui.o  -lmenu -lpanel -lncurses=
 -ltinfo' > scripts/kconfig/.nconf.cmd
  HOSTLD  scripts/kconfig/nconf
scripts/kconfig/Makefile:34: update target 'nconfig' due to: scripts/kconfi=
g/nconf
scripts/kconfig/nconf  Kconfig
$

$ gcc -v
Using built-in specs.
COLLECT_GCC=3Dgcc
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/5/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu 5.4.0-6ubu=
ntu1~16.04.4' --with-bugurl=3Dfile:///usr/share/doc/gcc-5/README.Bugs --ena=
ble-languages=3Dc,ada,c++,java,go,d,fortran,objc,obj-c++ --prefix=3D/usr --=
program-suffix=3D-5 --enable-shared --enable-linker-build-id --libexecdir=
=3D/usr/lib --without-included-gettext --enable-threads=3Dposix --libdir=3D=
/usr/lib --enable-nls --with-sysroot=3D/ --enable-clocale=3Dgnu --enable-li=
bstdcxx-debug --enable-libstdcxx-time=3Dyes --with-default-libstdcxx-abi=3D=
new --enable-gnu-unique-object --disable-vtable-verify --enable-libmpx --en=
able-plugin --with-system-zlib --disable-browser-plugin --enable-java-awt=
=3Dgtk --enable-gtk-cairo --with-java-home=3D/usr/lib/jvm/java-1.5.0-gcj-5-=
amd64/jre --enable-java-home --with-jvm-root-dir=3D/usr/lib/jvm/java-1.5.0-=
gcj-5-amd64 --with-jvm-jar-dir=3D/usr/lib/jvm-exports/java-1.5.0-gcj-5-amd6=
4 --with-arch-directory=3Damd64 --with-ecj-jar=3D/usr/share/java/eclipse-ec=
j.jar --enable-objc-gc --enable-multiarch --disable-werror --with-arch-32=
=3Di686 --with-abi=3Dm64 --with-multilib-list=3Dm32,m64,mx32 --enable-multi=
lib --with-tune=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linu=
x-gnu --host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
Thread model: posix
gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4)=20
$=20

On Mon, Nov 28, 2016 at 11:39:01AM +0100, Michal Marek wrote:
> Dne 27.11.2016 v 17:28 Cheah Kok Cheong napsal(a):
> > Fix below warning when make nconfig is run initially
> > or after make clean.
> >=20
> >   HOSTCC  scripts/kconfig/nconf.o
> > scripts/kconfig/nconf.c:8:0: warning: "_GNU_SOURCE" redefined
> >  #define _GNU_SOURCE
> >  ^
> > <command-line>:0:0: note: this is the location of the previous definiti=
on
>=20
> The Makefile does not specify -D_GNU_SOURCE. Are you adding it manually?
>=20
> Thanks,
> Michal
