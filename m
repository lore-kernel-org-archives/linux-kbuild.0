Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:34507 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754017AbbETWCj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:39 -0400
Received: by pdbnk13 with SMTP id nk13so83727805pdb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:39 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 05/10] merge_config.sh: Better handling of CONFIG_FOO=n
Date: Wed, 20 May 2015 15:00:55 -0700
Message-Id: <1432159260-39390-6-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Kconfig knows how to handle CONFIG_FOO=n just fine, but it'll always
use "# CONFIG FOO is not set" in the resulting config. Mangle the input
accordingly so we don't report this as a failure when it isn't.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 2364246..81c0b16 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -39,7 +39,7 @@ usage() {
 }
 
 getval() {
-	grep -w -e "$1" "$2"
+	grep -w -e "$1" "$2" | sed 's/^CONFIG_\(.*\)=n$/# CONFIG_\1 is not set/g'
 }
 
 CONF_IS_ERR=false
-- 
1.7.10.4

