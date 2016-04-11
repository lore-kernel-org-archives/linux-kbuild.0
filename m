Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42292 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750912AbcDKAGy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Apr 2016 20:06:54 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH 1/4] localmodconfig: Recognize more keywords that end a menu entry
Date: Sun, 10 Apr 2016 17:06:30 -0700
Message-Id: <1460333193-16361-1-git-send-email-bpoirier@suse.com>
In-Reply-To: <20160410235234.GA13689@f1.synalogic.ca>
References: <20160410235234.GA13689@f1.synalogic.ca>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Based on the list in Documentation/kbuild/kconfig-language.txt

This removes junk from %depends because parsing of a menu entry spilled
over to another menu entry.

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 514735d..c5b388c 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -256,8 +256,8 @@ sub read_kconfig {
 
 	    $iflevel-- if ($iflevel);
 
-	# stop on "help"
-	} elsif (/^\s*help\s*$/) {
+	# stop on "help" and keywords that end a menu entry
+	} elsif (/^\s*help\s*$/ || /^(comment|choice|menu)\b/) {
 	    $state = "NONE";
 	}
     }
-- 
2.7.4

