Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36349 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1169027AbdDXLHt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 07:07:49 -0400
Received: by mail-lf0-f47.google.com with SMTP id c80so71635288lfh.3
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2017 04:07:48 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 2/2] builddeb: fix typo
Date: Mon, 24 Apr 2017 14:07:41 +0300
Message-Id: <20170424110741.4524-3-riku.voipio@linaro.org>
In-Reply-To: <20170424110741.4524-1-riku.voipio@linaro.org>
References: <20170424110741.4524-1-riku.voipio@linaro.org>
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
index a88bd5a6b346..aad67000e4dd 100755
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

