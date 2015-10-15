Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54997 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753046AbbJOURZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 16:17:25 -0400
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 4/9] tags: Fix erroneous pattern match in a comment
Date: Thu, 15 Oct 2015 22:16:30 +0200
Message-Id: <1444940195-28272-5-git-send-email-mmarek@suse.com>
In-Reply-To: <1444940195-28272-1-git-send-email-mmarek@suse.com>
References: <1444940195-28272-1-git-send-email-mmarek@suse.com>
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
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 5b7828756083..996301c3883d 100755
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

