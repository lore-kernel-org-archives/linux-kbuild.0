Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42314 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752147AbcDKAHL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Apr 2016 20:07:11 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH 4/4] localmodconfig: Recognize standalone "prompt"
Date: Sun, 10 Apr 2016 17:06:33 -0700
Message-Id: <1460333193-16361-4-git-send-email-bpoirier@suse.com>
In-Reply-To: <1460333193-16361-1-git-send-email-bpoirier@suse.com>
References: <20160410235234.GA13689@f1.synalogic.ca>
 <1460333193-16361-1-git-send-email-bpoirier@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Note that this may change the resulting .config, causing it to have fewer
symbols turned on. Before this patch we incorrectly identified some symbols
as not having a prompt and needing to be selected by something else.

Also fix the whitespace repeat after "tristate".

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index bbc160c..d465672 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -237,7 +237,7 @@ sub read_kconfig {
 	    }
 
 	# configs without prompts must be selected
-	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
+	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
 	    # note if the config has a prompt
 	    $prompts{$config} = 1;
 
-- 
2.7.4

