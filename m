Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47714 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750931AbaHPF7S (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Aug 2014 01:59:18 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 3/3] scripts/tags.sh: fix DEFINE_HASHTABLE in emacs case
Date: Sat, 16 Aug 2014 07:56:58 +0200
Message-Id: <1408168618-6269-4-git-send-email-dirk@gouders.net>
In-Reply-To: <1408168618-6269-1-git-send-email-dirk@gouders.net>
References: <gh61htovas.fsf@quad.gouders.net>
 <1408168618-6269-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Dirk Gouders <dirk@gouders.net>, Masatake YAMATO <yamato@redhat.com>, linux-kbuild@vger.kernel.org, Jianyu Zhan <nasa4836@gmail.com>

The emacs --regex for DEFINE_HASHTABLE produced a warning because of
an unmatched '\('.  Further, the whole entry did not work, because the
regex needs to match from the beginning of a line, including keywords
like 'static'.  Finally, '\w' should not be used, because it
stops at underscores which are often part of variable names in C,
resulting in wrong entries in the tags file.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Inspired-by: Masatake YAMATO <yamato@redhat.com>
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 0f61bd7..fd651f9 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -255,7 +255,7 @@ emacs()
 	--regex='/_PE(\([^,)]*\).*/PEVENT_ERRNO__\1/'		\
 	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
 	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
-	--regex='/DEFINE_HASHTABLE\((\w*)/\1/'
+	--regex='/[^#]*DEFINE_HASHTABLE(\([^,)]*\)/\1/'
 
 	all_kconfigs | xargs $1 -a                              \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
-- 
2.0.2

