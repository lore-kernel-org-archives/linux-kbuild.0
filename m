Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60277 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933140AbcKBRVX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 13:21:23 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/2] Documentation/HOWTO: Use a more recent gcc + binutils
Date: Wed,  2 Nov 2016 18:20:57 +0100
Message-Id: <20161102172058.13641-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, ben@decadent.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Debian Woody is pre-gcc3.2 and Sarge ships 3.3 gcc. I tried to compile
v4.8.6 on Sarge failed due to binutils:
|arch/x86/entry/entry_32.S: Assembler messages:
|arch/x86/entry/entry_32.S:379: Error: invalid character '"' in operand 1
|arch/x86/entry/entry_32.S:454: Error: too many positional arguments
|arch/x86/entry/entry_32.S:580: Error: too many positional arguments
|arch/x86/boot/bioscall.S:68: Error: `68(%esp)' is not a valid 16 bit base/=
index expression

among other errors. Sarge comes with GNU ld version 2.15 with is not
recent enough. I don't see those errors on Etch which ships version 2.17
and therefore I raise the limit to 2.17.
gcc is a different story. 3.3 It throws a lot of warnings
|include/linux/irq.h:402: warning: parameter has incomplete type
|include/linux/irq.h:403: warning: parameter has incomplete type
|drivers/gpu/drm/i915/i915_gem_gtt.h:312: warning: parameter has incomplete=
 type

during the compile and fails then with
| cc1: error: unrecognized option `-Wno-override-init'

or later with

|lib/lzo/lzo1x_compress.c: In function `lzo1x_1_do_compress':
|lib/lzo/lzo1x_compress.c:132: error: implicit declaration of function `__b=
uiltin_ctz'

Etch (with gcc v4.1.2) gets to compile the kernel without plenty of
warnings and it also chokes on Wno-override-init but that one could be
easily fixed if we want to keep v4.1 as the minimum.
So I think raising the bar to gcc v4.1 isn't that bad given that the
last release of gcc 4.1 was on February 13, 2007.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/Changes | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/Changes b/Documentation/Changes
index 22797a15dc24..14e65b445707 100644
--- a/Documentation/Changes
+++ b/Documentation/Changes
@@ -29,9 +29,9 @@ you probably needn't concern yourself with isdn4k-utils.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
         Program        Minimal version       Command to check the version
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-GNU C                  3.2              gcc --version
+GNU C                  4.1              gcc --version
 GNU make               3.80             make --version
-binutils               2.12             ld -v
+binutils               2.17             ld -v
 util-linux             2.10o            fdformat --version
 module-init-tools      0.9.10           depmod -V
 e2fsprogs              1.41.4           e2fsck -V
--=20
2.10.2

