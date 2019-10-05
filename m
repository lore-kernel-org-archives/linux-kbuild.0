Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56744 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfJEPCB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Oct 2019 11:02:01 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] scripts: setlocalversion: fix a bashism
Message-ID: <f5cb4272-4cb8-4253-77fd-56aaf73a0dbc@infradead.org>
Date: Sat, 5 Oct 2019 08:01:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mike Crowe <mcrowe@zipitwireless.com>, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix bashism reported by checkbashisms by using only one '=':

possible bashism in scripts/setlocalversion line 96 (should be 'b = a'):
	if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then

Fixes: 38b3439d84f4 ("setlocalversion: update mercurial tag parsing")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mike Crowe <mcrowe@zipitwireless.com>
---
Does anyone still use hg for kernel development?

 scripts/setlocalversion |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-54-rc1.orig/scripts/setlocalversion
+++ lnx-54-rc1/scripts/setlocalversion
@@ -93,7 +93,7 @@ scm_version()
 	# Check for mercurial and a mercurial repo.
 	if test -d .hg && hgid=`hg id 2>/dev/null`; then
 		# Do we have an tagged version?  If so, latesttagdistance == 1
-		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
+		if [ "`hg log -r . --template '{latesttagdistance}'`" = "1" ]; then
 			id=`hg log -r . --template '{latesttag}'`
 			printf '%s%s' -hg "$id"
 		else
