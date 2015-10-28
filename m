Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33813 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754902AbbJ1Amq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:46 -0400
Received: by padhk11 with SMTP id hk11so238190470pad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:45 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 05/10] merge_config.sh: Better handling of CONFIG_FOO=n
Date: Wed, 28 Oct 2015 09:42:06 +0900
Message-Id: <1445992931-28107-6-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Kconfig knows how to handle CONFIG_FOO=n just fine, but it'll always
use "# CONFIG FOO is not set" in the resulting config. Mangle the input
accordingly so we don't report this as a failure when it isn't.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index c244042..933f2d6 100755
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
2.1.4

