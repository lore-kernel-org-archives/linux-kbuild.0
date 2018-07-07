Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:58102 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753075AbeGGAQO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 20:16:14 -0400
From: Adam Borowski <kilobyte@angband.pl>
Date: Sat,  7 Jul 2018 02:15:48 +0200
Message-Id: <20180707001548.21854-1-kilobyte@angband.pl>
Subject: [PATCH resend] scripts: teach extract-vmlinux about LZ4 and ZSTD
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Paul Menzel <pmenzel+linux-kernel@molgen.mpg.de>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Cc: Adam Borowski <kilobyte@angband.pl>

Note that the LZ4 signature is different than that of modern LZ4 as we
use the "legacy" format which suffers from some downsides like inability
to disable compression.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
The first time this was sent I managed to screw up both the subject and
scissors line, so it's likely whatever filter you're using didn't notice
the patch inside a thread.

ZSTD compression for vmlinux is not yet in, but being able to unpack it
can't hurt.  LZ4 is in for quite a while.


 scripts/extract-vmlinux | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
index 5061abcc2540..e6239f39abad 100755
--- a/scripts/extract-vmlinux
+++ b/scripts/extract-vmlinux
@@ -57,6 +57,8 @@ try_decompress '\3757zXZ\000' abcde unxz
 try_decompress 'BZh'          xy    bunzip2
 try_decompress '\135\0\0\0'   xxx   unlzma
 try_decompress '\211\114\132' xy    'lzop -d'
+try_decompress '\002!L\030'   xxx   'lz4 -d'
+try_decompress '(\265/\375'   xxx   unzstd
 
 # Bail out:
 echo "$me: Cannot find vmlinux." >&2
-- 
2.18.0

