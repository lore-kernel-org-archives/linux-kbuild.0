Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55007 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753057AbbJOURZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 16:17:25 -0400
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 7/9] tags: Drop the _PE rule
Date: Thu, 15 Oct 2015 22:16:33 +0200
Message-Id: <1444940195-28272-8-git-send-email-mmarek@suse.com>
In-Reply-To: <1444940195-28272-1-git-send-email-mmarek@suse.com>
References: <1444940195-28272-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

We are not indexing the userspace tools, so the rules only match some
false positives in the kernel code.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/tags.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 8a03c335d107..06246b64c0a1 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -189,7 +189,6 @@ exuberant()
 	--regex-c='/__CLEARPAGEFLAG_NOOP\(([^,)]*).*/__ClearPage\1/'	\
 	--regex-c='/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/' \
 	--regex-c='/__TESTCLEARFLAG_FALSE\(([^,)]*).*/__TestClearPage\1/' \
-	--regex-c='/_PE\(([^,)]*).*/PEVENT_ERRNO__\1/'		\
 	--regex-c='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'	\
 	--regex-c='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
 	--regex-c='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'\
@@ -252,7 +251,6 @@ emacs()
 	--regex='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'		\
 	--regex='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
 	--regex='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'	\
-	--regex='/_PE(\([^,)]*\).*/PEVENT_ERRNO__\1/'		\
 	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
 	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
 	--regex='/[^#]*DEFINE_HASHTABLE(\([^,)]*\)/\1/'
-- 
2.1.4

