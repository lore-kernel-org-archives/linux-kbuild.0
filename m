Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53873 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753165AbbLDP0s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 10:26:48 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH v2 6/8] tags: Drop the _PE rule
Date: Fri,  4 Dec 2015 16:26:25 +0100
Message-Id: <1449242787-16598-7-git-send-email-mmarek@suse.com>
In-Reply-To: <1449242787-16598-1-git-send-email-mmarek@suse.com>
References: <1449242787-16598-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

We are not indexing the userspace tools, so the rules only match some
false positives in the kernel code.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
v2: Rebased onto current linux-next

 scripts/tags.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 03041ab7634c..17ff331f8840 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -188,7 +188,6 @@ exuberant()
 	--regex-c='/CLEARPAGEFLAG_NOOP\(([^,)]*).*/ClearPage\1/'	\
 	--regex-c='/__CLEARPAGEFLAG_NOOP\(([^,)]*).*/__ClearPage\1/'	\
 	--regex-c='/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/' \
-	--regex-c='/_PE\(([^,)]*).*/PEVENT_ERRNO__\1/'		\
 	--regex-c='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'	\
 	--regex-c='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
 	--regex-c='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'\
@@ -251,7 +250,6 @@ emacs()
 	--regex='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'		\
 	--regex='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
 	--regex='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'	\
-	--regex='/_PE(\([^,)]*\).*/PEVENT_ERRNO__\1/'		\
 	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
 	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
 	--regex='/[^#]*DEFINE_HASHTABLE(\([^,)]*\)/\1/'
-- 
2.1.4

