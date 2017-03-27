Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34949 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751914AbdC0Fsh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 01:48:37 -0400
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/5] scripts: Fix dead URLs to ftp.kernel.org
Date: Mon, 27 Mar 2017 14:47:31 +0900
Message-Id: <20170327054731.31882-6-sj38.park@gmail.com>
In-Reply-To: <20170327054731.31882-1-sj38.park@gmail.com>
References: <20170327054731.31882-1-sj38.park@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rml@tech9.net, axboe@fb.com, shli@kernel.org, raven@themaw.net, yamada.masahito@socionext.com, mmarek@suse.com
Cc: linux-raid@vger.kernel.org, autofs@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

As ftp.kernel.org is closed [0], this commit fixes dead URLs to
ftp.kernel.org in scripts/ to use www.kernel.org instead.

[0] https://www.kernel.org/shutting-down-ftp-services.html

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 scripts/ksymoops/README  | 5 ++---
 scripts/package/builddeb | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/ksymoops/README b/scripts/ksymoops/README
index f6cb06e3f30e..413043980127 100644
--- a/scripts/ksymoops/README
+++ b/scripts/ksymoops/README
@@ -1,8 +1,7 @@
 ksymoops has been removed from the kernel.  It was always meant to be a
 free standing utility, not linked to any particular kernel version.
 The latest version can be found in
-ftp://ftp.<country>.kernel.org/pub/linux/utils/kernel/ksymoops together
-with patches to other utilities in order to give more accurate Oops
-debugging.
+https://www.kernel.org/pub/linux/utils/kernel/ksymoops together with patches to
+other utilities in order to give more accurate Oops debugging.
 
 Keith Owens <kaos@ocs.com.au> Sat Jun 19 10:30:34 EST 1999
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f04e91f0845d..d7cf7156414e 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -257,8 +257,8 @@ EOF
 cat <<EOF > debian/copyright
 This is a packacked upstream version of the Linux kernel.
 
-The sources may be found at most Linux ftp sites, including:
-ftp://ftp.kernel.org/pub/linux/kernel
+The sources may be found at most Linux archive sites, including:
+https://www.kernel.org/pub/linux/kernel
 
 Copyright: 1991 - 2015 Linus Torvalds and others.
 
-- 
2.10.0

