Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42300 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751719AbcDKAG6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Apr 2016 20:06:58 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH 2/4] localmodconfig: Fix parsing of "help" text
Date: Sun, 10 Apr 2016 17:06:31 -0700
Message-Id: <1460333193-16361-2-git-send-email-bpoirier@suse.com>
In-Reply-To: <1460333193-16361-1-git-send-email-bpoirier@suse.com>
References: <20160410235234.GA13689@f1.synalogic.ca>
 <1460333193-16361-1-git-send-email-bpoirier@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Help text may start with "help" or "---help---". This patch fixes
read_kconfig() to recognize the second variant.

This removes useless junk from %depends and %selects. That junk is due to
help text that contains the words "selects" and "depends".

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index c5b388c..f06972a 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -257,7 +257,7 @@ sub read_kconfig {
 	    $iflevel-- if ($iflevel);
 
 	# stop on "help" and keywords that end a menu entry
-	} elsif (/^\s*help\s*$/ || /^(comment|choice|menu)\b/) {
+	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|choice|menu)\b/) {
 	    $state = "NONE";
 	}
     }
-- 
2.7.4

