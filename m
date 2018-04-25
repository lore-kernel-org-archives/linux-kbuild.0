Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:43006 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbeDYBQp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Apr 2018 21:16:45 -0400
From: Adam Borowski <kilobyte@angband.pl>
Date: Wed, 25 Apr 2018 03:16:37 +0200
Message-Id: <20180425011637.24203-1-kilobyte@angband.pl>
Subject: [PATCH] scripts: teach extract-vmlinux about LZ4 and ZSTD
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>

Note that the LZ4 signature is different than that of modern LZ4 as we
use the "legacy" format which suffers from some downsides like inability
to disable compression.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
Resent with no scissors and a non-broken subject line, sorry.
Not including the original thread; this is incidental to it.

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
2.17.0

