Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:26778 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755658AbcBHUnl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 15:43:41 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 0/6] Trim unused exported symbols
Date: Mon, 08 Feb 2016 15:28:29 -0500
Message-id: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

The kernel and some modules make many symbols available for
other modules to use via EXPORT_SYMBOL() and variants. Depending
on the set of modules being selected in your kernel configuration,
many of those exported symbols might never be used.

One direct effect of EXPORT_SYMBOL() entries is to force the referenced
code and the code it references into the kernel binary with no
possibilityes for dead code elimination, eeven though the referenced
code is never executed.

This patch series provides the option to omit those exported symbols
from the kernel and modules that are never referenced by any of the
selected modules in the current kernel configuration.  In turns this
allows for optimizing the compiled code and reducing final binaryes'
size. When using LTO the binari size reduction is even more effective.

Also, by removing some entry points, it could be argued that this has
some security advantages by reducing the attack surface of the kernel.
But this is not my main motivation for doing this so I'll let security
experts judge the merit of this claim.

Here's some numbers showing the effect of this series.

Kernel v4.5-rc2 x86 defconfig:

$ size vmlinux
   text    data     bss     dec     hex filename
12362563        1856456 1101824 15320843         e9c70b vmlinux

$ wc -l Module.symvers
8806 Module.symvers

Kernel v4.5-rc2 x86 defconfig + CONFIG_TRIM_UNUSED_EXPSYMS=y:

$ size vmlinux
   text    data     bss     dec     hex filename
12059848        1856456 1101824 15018128         e52890 vmlinux

$ wc -l Module.symvers
225 Module.symvers

Because the x86 defconfig only contains 18 modules, the number of
needed exported symbols is only 225 out of a possible 8806 for this
configuration.  The kernel text size shrank by about 2.4%.

More numbers, on ARM this time.

Kernel v4.5-rc2 arm defconfig (same as multi_v7_defconfig):

$ size vmlinux
   text    data     bss     dec     hex filename
13664222        1554068  351368 15569658         ed92fa vmlinux

$ wc -l Module.symvers
10044 Module.symvers

Kernel v4.5-rc2 arm defconfig + CONFIG_TRIM_UNUSED_EXPSYMS=y:

$ size vmlinux
   text    data     bss     dec     hex filename
13255051        1554132  351240 15160423         e75467 vmlinux

$ wc -l Module.symvers
2703 Module.symvers

This time many more modules (279 of them) are part of the build
configuration. Still, only 2703 out of 10044 exported symbols are
required. And despite a smaller number of omitted exports, the kernel
shrank by 3%.

Now let's add LTO into the mix.

Kernel v4.5-rc2 arm defconfig + LTO:

$ size vmlinux
   text    data     bss     dec     hex filename
12813766        1538324  344356 14696446         e03ffe vmlinux

$ wc -l Module.symvers
8415 Module.symvers

Kernel v4.5-rc2 arm defconfig + LTO + CONFIG_TRIM_UNUSED_EXPSYMS=y:

$ size vmlinux
   text    data     bss     dec     hex filename
12197437        1536052  338660 14072149         d6b955 vmlinux

$ wc -l Module.symvers
1742 Module.symvers

This time the kernel shrank by 5%.

Finally, let's have a look at a configuration that is potentially more
representative of an embedded target.

Kernel v4.5-rc2 arm realview_defconfig + LTO:

$ size vmlinux
   text    data     bss     dec     hex filename
4422942  209640  126880 4759462  489fa6 vmlinux

$ wc -l Module.symvers
5597 Module.symvers

Kernel v4.5-rc2 arm realview_defconfig + LTO + CONFIG_TRIM_UNUSED_EXPSYMS=y:

$ size vmlinux
   text    data     bss     dec     hex filename
3823485  205416  125800 4154701  3f654d vmlinux

$ wc -l Module.symvers
52 Module.symvers

Here we reduced the kernel text by about 13.6%. Disabling module
support altogether would reduce it by 13.9% i.e. only 0.3% difference.
This means the overhead of using modules on embedded targets is greatly
reduced.

I know that Viro posted a series allowing for assembly code to declare
exported symbols but this doesn't conflict (we don't touch the same
files) and making this work with his series is very trivial.

diffstat:


 Makefile                  | 14 +++++++
 include/linux/export.h    | 22 ++++++++++-
 init/Kconfig              | 16 ++++++++
 scripts/Kbuild.include    |  3 +-
 scripts/Makefile.build    | 16 ++++++--
 scripts/adjust_expsyms.sh | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 scripts/basic/fixdep.c    | 80 +++++++++++++++++++++++++++++---------
 7 files changed, 224 insertions(+), 24 deletions(-)

