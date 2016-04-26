Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34479 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752273AbcDZS4s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 14:56:48 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH v2] localmodconfig: Fix whitespace repeat count after "tristate"
Date: Tue, 26 Apr 2016 11:56:38 -0700
Message-Id: <1461696998-3953-1-git-send-email-bpoirier@suse.com>
In-Reply-To: <20160426185421.GB2979@f1.synalogic.ca>
References: <20160426185421.GB2979@f1.synalogic.ca>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Also recognize standalone "prompt".

Before this patch we incorrectly identified some symbols as not having a
prompt and potentially needing to be selected by something else.

Note that this patch could theoretically change the resulting .config,
causing it to have fewer symbols turned on. However, given the current set
of Kconfig files, this situation does not occur because the symbols newly
added to %prompts are absent from %selects.

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 95a6f2b..b8c7b29 100755
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

