Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:35320 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776AbbEGAgK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 20:36:10 -0400
Date: Thu, 7 May 2015 00:36:04 +0000
From: sylvain.bertrand@gmail.com
Subject: [PATCH v2] scripts: fix link-vmlinux.sh bash-ism
Message-ID: <20150507003604.GA16571@freedom>
References: <20141229163456.GB27533@dhcppc1>
 <54A6BF7E.8070003@suse.cz>
 <20150303163453.GA21318@localhost.localdomain>
 <550895A1.1000901@suse.cz>
 <20150427152525.GA22179@freedom>
 <20150506135422.GA24849@freedom>
 <554A2457.70609@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <554A2457.70609@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

While building linux with dash shell:
  LINK    vmlinux
trap: SIGHUP: bad trap
/src/linux-4.0/Makefile:933: recipe for target 'vmlinux' failed
make[1]: *** [vmlinux] Error 1

See the following document for behavior of posix shell trap instruction:
http://pubs.opengroup.org/onlinepubs/000095399/utilities/trap.html

Cc: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
---
--- a/scripts/link-vmlinux.sh	2014-12-29 15:10:29.436431249 +0000
+++ b/scripts/link-vmlinux.sh	2014-12-29 16:23:06.010853608 +0000
@@ -111,7 +111,6 @@
 }
 
 # Delete output files in case of error
-trap cleanup SIGHUP SIGINT SIGQUIT SIGTERM ERR
 cleanup()
 {
 	rm -f .old_version
@@ -124,6 +123,20 @@
 	rm -f vmlinux.o
 }
 
+on_exit()
+{
+	if [ $? -ne 0 ]; then
+		cleanup
+	fi
+}
+trap on_exit EXIT
+
+on_signals()
+{
+	exit 1
+}
+trap on_signals HUP INT QUIT TERM
+
 #
 #
 # Use "make V=1" to debug this script
@@ -231,7 +244,6 @@
 	if ! cmp -s System.map .tmp_System.map; then
 		echo >&2 Inconsistent kallsyms data
 		echo >&2 Try "make KALLSYMS_EXTRA_PASS=1" as a workaround
-		cleanup
 		exit 1
 	fi
 fi
