Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ocean.emcraft.com ([213.221.7.182]:58974 "EHLO
	ocean.emcraft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932260AbZHJQrI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Aug 2009 12:47:08 -0400
Date: Mon, 10 Aug 2009 20:23:49 +0400
From: Sergei Poselenov <sposelenov@emcraft.com>
Subject: [PATCH] modpost: Remove C99 declaration
Message-ID: <20090810202349.3ff9c617@emcraft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: wd@denx.de

Hello all,

I'm building an off-tree kernel-dependent package (iscsitarget),
which results a set of kernel modules. This is a cross-platform build,
with a toolchain installed on an old RH7.3 host (host GCC v2.96)

Unfortunately, build fails with the following error:
->
PATH=/work/psl/e/arm-2009-08-06/work/bin:/work/psl/e/arm-2009-08-06/work/usr/arm-linux/bin:/work/psl/e/arm-2009-08-06/work/usr/bin:$PATH
CROSS_COMPILE=arm-linux- make  ARCH=arm
-C /work/psl/e/arm-2009-08-06/work/arm/usr/src/linux scripts
HOSTCC='/usr/bin/gcc -B/usr/bin/'
make: Entering directory
`/work/psl/e/arm-2009-08-06/work/arm/usr/src/linux-2.6.30.3'
HOSTCC scripts/basic/fixdep
HOSTCC scripts/basic/docproc
HOSTCC scripts/basic/hash
HOSTCC  scripts/mod/modpost.o
scripts/mod/modpost.c: In function `match': scripts/mod/modpost.c:699:
parse error before `const'
scripts/mod/modpost.c:707: `endp' undeclared (first use in this
function)
scripts/mod/modpost.c:707: (Each undeclared identifier is reported only
once scripts/mod/modpost.c:707: for each function it appears in.)
gcc: file path prefix `/usr/bin/' never used
make[2]: *** [scripts/mod/modpost.o] Error 1
make[1]: *** [scripts/mod] Error 2
make: *** [scripts] Error 2
make: Leaving directory
`/work/psl/e/arm-2009-08-06/work/arm/usr/src/linux-2.6.30.3'
-> 

The origin of the error is obvious - C99 declaration in match().

The patch is trivial:
From ddf9724f833c0c7529e868cde4137e31d34ae854 Mon Sep 17 00:00:00 2001
From: Sergei Poselenov <psl@pollux.denx.de>
Date: Mon, 10 Aug 2009 18:03:07 +0200
Subject: [PATCH] Removed C99 declaration, which breaks build of modpost with
 old compilers.

Signed-off-by: Sergei Poselenov <sposelenov@emcraft.com>
---
 scripts/mod/modpost.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4522948..a496341 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -695,8 +695,9 @@ int match(const char *sym, const char * const pat[])
 {
 	const char *p;
 	while (*pat) {
+		const char *endp;
 		p = *pat++;
-		const char *endp = p + strlen(p) - 1;
+		endp = p + strlen(p) - 1;
 
 		/* "*foo" */
 		if (*p == '*') {
-- 
1.6.0.6


Could someone please comment on the patch and apply?


Also, what is a clean way to clean up a 'scripts' directory only?
Is this ever possible?


Thanks in advance,
Sergei
