Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:51577 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753195Ab2DWWQx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Apr 2012 18:16:53 -0400
From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: [PATCH 2/3] kbuild, deb-pkg: Bump year in debian/copyright file
Date: Tue, 24 Apr 2012 00:16:28 +0200
Message-Id: <1335219389-10887-2-git-send-email-sedat.dilek@gmail.com>
In-Reply-To: <1335219389-10887-1-git-send-email-sedat.dilek@gmail.com>
References: <1335219389-10887-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@gmail.com>


Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 scripts/package/builddeb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f5b56ac..62c512b 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -201,7 +201,7 @@ This is a packacked upstream version of the Linux kernel.
 The sources may be found at most Linux ftp sites, including:
 ftp://ftp.kernel.org/pub/linux/kernel
 
-Copyright: 1991 - 2009 Linus Torvalds and others.
+Copyright: 1991 - 2012 Linus Torvalds and others.
 
 The git repository for mainline kernel development is at:
 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
-- 
1.7.9.5

