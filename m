Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:36208 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964AbbJ1Amt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:49 -0400
Received: by pacfv9 with SMTP id fv9so248528107pac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:49 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 06/10] merge_config.sh: only consider last value of symbols
Date: Wed, 28 Oct 2015 09:42:07 +0900
Message-Id: <1445992931-28107-7-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 933f2d6..1945b2c 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -39,7 +39,7 @@ usage() {
 }
 
 getval() {
-	grep -w -e "$1" "$2" | sed 's/^CONFIG_\(.*\)=n$/# CONFIG_\1 is not set/g'
+	grep -w -e "$1" "$2" | tail -1 | sed 's/^CONFIG_\(.*\)=n/# CONFIG_\1 is not set/g'
 }
 
 CONF_IS_ERR=false
-- 
2.1.4

