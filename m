Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:35948 "EHLO mailhub1.si.c-s.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751055Ab3BVJAM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Feb 2013 04:00:12 -0500
Date: Fri, 22 Feb 2013 09:59:18 +0100
Message-Id: <201302220859.r1M8xIKl029662@localhost.localdomain>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] Unset langage specific variables in setlocalversion script
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This patch allows the use of setlocalversion script regardless of the language
parameters. Otherwise, the `svn info 2>/dev/null | grep '^Last Changed Rev'`
returns nothing because for instance, in French the text 'Last Changed Rev'
is replaced by 'Révision de la dernière modification'

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

diff -ur linux-3.7.9/scripts/setlocalversion linux/scripts/setlocalversion
--- linux-3.7.9/scripts/setlocalversion	2013-02-17 19:53:32.000000000 +0100
+++ linux/scripts/setlocalversion	2013-02-22 03:37:31.000000000 +0100
@@ -108,7 +108,7 @@
 	fi
 
 	# Check for svn and a svn repo.
-	if rev=`svn info 2>/dev/null | grep '^Last Changed Rev'`; then
+	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
 		rev=`echo $rev | awk '{print $NF}'`
 		printf -- '-svn%s' "$rev"
 
