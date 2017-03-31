Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34127 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933145AbdCaNJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2017 09:09:50 -0400
Received: by mail-lf0-f45.google.com with SMTP id z15so43593308lfd.1
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2017 06:09:48 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 2/3] builddeb: fix typo
Date: Fri, 31 Mar 2017 16:09:40 +0300
Message-Id: <20170331130941.5250-3-riku.voipio@linaro.org>
In-Reply-To: <20170331130941.5250-1-riku.voipio@linaro.org>
References: <20170331130941.5250-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.com
Cc: yamada.masahiro@socionext.com, debian-kernel@lists.debian.org, Andrew Donnellan <andrew.donnellan@au1.ibm.com>

From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c0107f581c5d..3407826f2a99 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -69,7 +69,7 @@ set_debarch() {
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
 		echo "" >&2
-		echo "Your architecture doesn't have it's equivalent" >&2
+		echo "Your architecture doesn't have its equivalent" >&2
 		echo "Debian userspace architecture defined!" >&2
 		echo "Falling back to using your current userspace instead!" >&2
 		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
-- 
2.11.0

