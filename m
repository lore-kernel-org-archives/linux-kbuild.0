Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42307 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751808AbcDKAHH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Apr 2016 20:07:07 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH 3/4] localmodconfig: Add missing $ to reference a variable
Date: Sun, 10 Apr 2016 17:06:32 -0700
Message-Id: <1460333193-16361-3-git-send-email-bpoirier@suse.com>
In-Reply-To: <1460333193-16361-1-git-send-email-bpoirier@suse.com>
References: <20160410235234.GA13689@f1.synalogic.ca>
 <1460333193-16361-1-git-send-email-bpoirier@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

That is clearly what the original intention was. This does not change the
output .config but it prevents some useless processing.

! eq "m" is changed to the simpler eq "y"; symbols with values other than
m|y are not included in %orig_configs.

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index f06972a..bbc160c 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -454,7 +454,7 @@ sub parse_config_depends
 	    $p =~ s/^[^$valid]*[$valid]+//;
 
 	    # We only need to process if the depend config is a module
-	    if (!defined($orig_configs{$conf}) || !$orig_configs{conf} eq "m") {
+	    if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
 		next;
 	    }
 
-- 
2.7.4

