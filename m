Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:20865 "EHLO mailhub1.si.c-s.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752297Ab3BUOce (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 09:32:34 -0500
Date: Thu, 21 Feb 2013 13:49:50 +0100
Message-Id: <201302211249.r1LCno6O024776@localhost.localdomain>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] Unset LANG in setlocalversion script
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This patch allows the use of setlocalversion script regardless of the LANG
parameter. Otherwise, the `svn info 2>/dev/null | grep '^Last Changed Rev'`
returns nothing because for instance, in French the text 'Last Changed Rev'
is replaced by 'Révision de la dernière modification'

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

diff -ur linux-3.7.9/scripts/setlocalversion linux/scripts/setlocalversion
--- linux-3.7.9/scripts/setlocalversion	2013-02-17 19:53:32.000000000 +0100
+++ linux/scripts/setlocalversion	2012-11-03 03:15:32.000000000 +0100
@@ -9,6 +9,8 @@
 #
 #
 
+unset LANG
+
 usage() {
 	echo "Usage: $0 [--save-scmversion] [srctree]" >&2
 	exit 1
