Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53851 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751185AbbLDP0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 10:26:46 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH v2 3/8] tags: Fix erroneous pattern match in a comment
Date: Fri,  4 Dec 2015 16:26:22 +0100
Message-Id: <1449242787-16598-4-git-send-email-mmarek@suse.com>
In-Reply-To: <1449242787-16598-1-git-send-email-mmarek@suse.com>
References: <1449242787-16598-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Apparently, ctags applies the rules before deleting comments:

ctags: Warning: include/linux/completion.h:22: null expansion of name pattern "\2"

Work around this particular case by requiring the group to contain at
least one character. Leave the other patters as they are, until a better
solution is found.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
v2: No change

 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index abcf43eed874..c845b3e2e7b0 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -204,7 +204,7 @@ exuberant()
 	--regex-c='/PCI_OP_WRITE\((\w*).*[1-4]\)/pci_bus_write_config_\1/' \
 	--regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
 	--regex-c='/DEFINE_(RAW_SPINLOCK|RWLOCK|SEQLOCK)\((\w*)/\2/v/'	\
-	--regex-c='/DECLARE_(RWSEM|COMPLETION)\((\w*)/\2/v/'		\
+	--regex-c='/DECLARE_(RWSEM|COMPLETION)\((\w+)/\2/v/'		\
 	--regex-c='/DECLARE_BITMAP\((\w*)/\1/v/'			\
 	--regex-c='/(^|\s)(|L|H)LIST_HEAD\((\w*)/\3/v/'			\
 	--regex-c='/(^|\s)RADIX_TREE\((\w*)/\2/v/'			\
-- 
2.1.4

