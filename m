Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 209.248.170.90.nw.nuvox.net ([209.248.170.90]:56123 "EHLO
	GVL-MAIL.koe-americas.local" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752380Ab2HMToL convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Aug 2012 15:44:11 -0400
From: David Cullen <David.Cullen@koe-americas.com>
Subject: [PATCH RFC] Fix "/usr/bin/xargs: rm: Argument list too long" during
 make distclean
Date: Mon, 13 Aug 2012 19:39:00 +0000
Message-ID: <502957D5.1070800@koe-americas.com>
Content-Language: en-US
Content-Type: text/plain; charset=US-ASCII
Content-ID: <73320576C9BD404EBCDEE56EC30113BE@koe-americas.com>
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

When running "make distclean" in a cross chroot environment, the
following messages are emitted:

    [user@host:/home/work/linux]: make distclean
    /usr/bin/xargs: rm: Argument list too long
    make: *** [clean] Error 126

I use the following patch to get around the problem:

diff --git a/Makefile b/Makefile
index b771af5..e2bca8e 100644
--- a/Makefile
+++ b/Makefile
@@ -1033,7 +1033,7 @@ distclean: mrproper
                -o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
                -o -name '.*.rej' \
                -o -name '*%' -o -name '.*.cmd' -o -name 'core' \) \
-               -type f -print | xargs rm -f
+               -type f -print | xargs -s 122880 rm -f


 # Packaging of the kernel to various formats
@@ -1242,7 +1242,7 @@ clean: $(clean-dirs)
                -o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
                -o -name '*.symtypes' -o -name 'modules.order' \
                -o -name modules.builtin -o -name '.tmp_*.o.*' \
-               -o -name '*.gcno' \) -type f -print | xargs rm -f
+               -o -name '*.gcno' \) -type f -print | xargs -s 122880 rm -f

 # Generate tags for editors
 # ---------------------------------------------------------------------------


Is there another way to solve this problem that does not require
a patch to the Makefile?
