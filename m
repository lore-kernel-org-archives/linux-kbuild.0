Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47705 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750931AbaHPF7E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Aug 2014 01:59:04 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 2/3] scripts/tags.sh: remove *PCGFLAGS regular expressions
Date: Sat, 16 Aug 2014 07:56:57 +0200
Message-Id: <1408168618-6269-3-git-send-email-dirk@gouders.net>
In-Reply-To: <1408168618-6269-1-git-send-email-dirk@gouders.net>
References: <gh61htovas.fsf@quad.gouders.net>
 <1408168618-6269-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Dirk Gouders <dirk@gouders.net>, Johannes Weiner <hannes@cmpxchg.org>, Masatake YAMATO <yamato@redhat.com>, linux-kbuild@vger.kernel.org

Commit 0a31bc97c80c3fa8 (mm: memcontrol: rewrite uncharge API)
removed the macros {TEST,SET,CLEAR,TESTCLEAR}PCFLAG.  Remove
corresponding entries from tags.sh -- in the emacs case they also
produced warnigs because of unmatched '\('.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Inspired-by: Masatake YAMATO <yamato@redhat.com>
---
 scripts/tags.sh | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 7279897..0f61bd7 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -193,10 +193,6 @@ exuberant()
 	--regex-c++='/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/' \
 	--regex-c++='/__TESTCLEARFLAG_FALSE\(([^,)]*).*/__TestClearPage\1/' \
 	--regex-c++='/_PE\(([^,)]*).*/PEVENT_ERRNO__\1/'		\
-	--regex-c++='/TESTPCGFLAG\(([^,)]*).*/PageCgroup\1/'		\
-	--regex-c++='/SETPCGFLAG\(([^,)]*).*/SetPageCgroup\1/'		\
-	--regex-c++='/CLEARPCGFLAG\(([^,)]*).*/ClearPageCgroup\1/'	\
-	--regex-c++='/TESTCLEARPCGFLAG\(([^,)]*).*/TestClearPageCgroup\1/' \
 	--regex-c='/PCI_OP_READ\((\w*).*[1-4]\)/pci_bus_read_config_\1/' \
 	--regex-c='/PCI_OP_WRITE\((\w*).*[1-4]\)/pci_bus_write_config_\1/' \
 	--regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
@@ -256,10 +252,6 @@ emacs()
 	--regex='/__CLEARPAGEFLAG_NOOP(\([^,)]*\).*/__ClearPage\1/' \
 	--regex='/TESTCLEARFLAG_FALSE(\([^,)]*\).*/TestClearPage\1/' \
 	--regex='/__TESTCLEARFLAG_FALSE(\([^,)]*\).*/__TestClearPage\1/' \
-	--regex='/TESTPCGFLAG\(([^,)]*).*/PageCgroup\1/'	\
-	--regex='/SETPCGFLAG\(([^,)]*).*/SetPageCgroup\1/'	\
-	--regex='/CLEARPCGFLAG\(([^,)]*).*/ClearPageCgroup\1/'	\
-	--regex='/TESTCLEARPCGFLAG\(([^,)]*).*/TestClearPageCgroup\1/' \
 	--regex='/_PE(\([^,)]*\).*/PEVENT_ERRNO__\1/'		\
 	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
 	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
-- 
2.0.2

