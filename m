Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35490 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbdAWLkZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 06:40:25 -0500
Received: by mail-lf0-f52.google.com with SMTP id n124so91657643lfd.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Jan 2017 03:40:24 -0800 (PST)
From: riku.voipio@linaro.org
Subject: [PATCH 2/3] builddeb: fix typo
Date: Mon, 23 Jan 2017 13:40:10 +0200
Message-Id: <20170123114011.4189-3-riku.voipio@linaro.org>
In-Reply-To: <20170123114011.4189-1-riku.voipio@linaro.org>
References: <20170123114011.4189-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: debian-kernel@lists.debian.org, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Riku Voipio <riku.voipio@linaro.org>

From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1a4c92d97e48..15e69e45cada 100755
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

