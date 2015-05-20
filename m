Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35034 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753647AbbETWCk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:40 -0400
Received: by pdea3 with SMTP id a3so83654016pde.2
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:40 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 06/10] merge_config.sh: only consider last value of symbols
Date: Wed, 20 May 2015 15:00:56 -0700
Message-Id: <1432159260-39390-7-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 81c0b16..932fd52 100755
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
1.7.10.4

