Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47710 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbaHPF7E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Aug 2014 01:59:04 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 1/3] scripts/tags.sh: Don't specify kind-spec for emacs' ctags/etags
Date: Sat, 16 Aug 2014 07:56:56 +0200
Message-Id: <1408168618-6269-2-git-send-email-dirk@gouders.net>
In-Reply-To: <1408168618-6269-1-git-send-email-dirk@gouders.net>
References: <gh61htovas.fsf@quad.gouders.net>
 <1408168618-6269-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Dirk Gouders <dirk@gouders.net>, Masatake YAMATO <yamato@redhat.com>, linux-kbuild@vger.kernel.org, Jianyu Zhan <nasa4836@gmail.com>

Emacs' ctags/etags don't know about kind-spec in --regex and
produce warnings:

etags: invalid regexp modifier `v', ignoring
etags: invalid regexp modifier `/', ignoring

Fix it by removing kind-spec for the emacs case.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Inspired-by: Masatake YAMATO <yamato@redhat.com>
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index cbfd269..7279897 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -263,7 +263,7 @@ emacs()
 	--regex='/_PE(\([^,)]*\).*/PEVENT_ERRNO__\1/'		\
 	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
 	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
-	--regex='/DEFINE_HASHTABLE\((\w*)/\1/v/'
+	--regex='/DEFINE_HASHTABLE\((\w*)/\1/'
 
 	all_kconfigs | xargs $1 -a                              \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
-- 
2.0.2

