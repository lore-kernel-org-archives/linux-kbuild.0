Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:60678 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756591AbcKBSxz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 14:53:55 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [PATCH 1/2] Documentation/HOWTO: Use a more recent gcc + binutils
References: <20161102172058.13641-1-bigeasy@linutronix.de>
Date: Wed, 02 Nov 2016 19:52:57 +0100
In-Reply-To: <20161102172058.13641-1-bigeasy@linutronix.de> (Sebastian Andrzej
        Siewior's message of "Wed, 2 Nov 2016 18:20:57 +0100")
Message-ID: <87vaw5k92u.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, ben@decadent.org.uk, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 2016-11-02 18:20 +0100, Sebastian Andrzej Siewior wrote:

> Debian Woody is pre-gcc3.2 and Sarge ships 3.3 gcc. I tried to compile
> v4.8.6 on Sarge failed due to binutils:
> |arch/x86/entry/entry_32.S: Assembler messages:
> |arch/x86/entry/entry_32.S:379: Error: invalid character '"' in operand 1
> |arch/x86/entry/entry_32.S:454: Error: too many positional arguments
> |arch/x86/entry/entry_32.S:580: Error: too many positional arguments
> |arch/x86/boot/bioscall.S:68: Error: `68(%esp)' is not a valid 16 bit base/index expression
>
> among other errors. Sarge comes with GNU ld version 2.15 with is not
> recent enough. I don't see those errors on Etch which ships version 2.17
> and therefore I raise the limit to 2.17.

I can confirm that binutils 2.16 is not recent enough either, while 2.17
works.

> gcc is a different story. 3.3 It throws a lot of warnings
> |include/linux/irq.h:402: warning: parameter has incomplete type
> |include/linux/irq.h:403: warning: parameter has incomplete type
> |drivers/gpu/drm/i915/i915_gem_gtt.h:312: warning: parameter has incomplete type
>
> during the compile and fails then with
> | cc1: error: unrecognized option `-Wno-override-init'
>
> or later with
>
> |lib/lzo/lzo1x_compress.c: In function `lzo1x_1_do_compress':
> |lib/lzo/lzo1x_compress.c:132: error: implicit declaration of function `__builtin_ctz'
>
> Etch (with gcc v4.1.2) gets to compile the kernel without plenty of
> warnings and it also chokes on Wno-override-init but that one could be
> easily fixed if we want to keep v4.1 as the minimum.
> So I think raising the bar to gcc v4.1 isn't that bad given that the
> last release of gcc 4.1 was on February 13, 2007.

For the record, the -Wno-override-init problem has already been fixed in
4.9-rc3 by commit a2209b742e6 ("x86/build: Fix build with older GCC
versions").

Cheers,
       Sven

> diff --git a/Documentation/Changes b/Documentation/Changes
> index 22797a15dc24..14e65b445707 100644
> --- a/Documentation/Changes
> +++ b/Documentation/Changes
> @@ -29,9 +29,9 @@ you probably needn't concern yourself with isdn4k-utils.
>  ====================== ===============  ========================================
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
> -GNU C                  3.2              gcc --version
> +GNU C                  4.1              gcc --version
>  GNU make               3.80             make --version
> -binutils               2.12             ld -v
> +binutils               2.17             ld -v
>  util-linux             2.10o            fdformat --version
>  module-init-tools      0.9.10           depmod -V
>  e2fsprogs              1.41.4           e2fsck -V
> -- 
> 2.10.2
