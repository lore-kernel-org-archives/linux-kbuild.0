Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:54319 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751043AbbAMVYc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Jan 2015 16:24:32 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] X.509: shut up about included cert for silent build
Date: Tue, 13 Jan 2015 22:24 +0100
Message-ID: <2124221.xG51kBCe6s@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dhowells@redhat.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mmarek@suse.cz

Every kernel build that includes X.509 support prints out
a message like

 - Including cert signing_key.x509

This may be useful for some cases, but when doing automated
build tests, it just means noise.

To hide the message, this uses '$(kecho)' for printing the
message, which means we still see it when building with V=1,
but not at the normal level or when building with 'make -s'.

Signed-off-by: Arnd Bergmann <arnd@arnd.de>

diff --git a/kernel/Makefile b/kernel/Makefile
index 6892723681d5..4e5598689058 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -144,7 +144,7 @@ endif
 kernel/system_certificates.o: $(obj)/x509_certificate_list
 
 quiet_cmd_x509certs  = CERTS   $@
-      cmd_x509certs  = cat $(X509_CERTIFICATES) /dev/null >$@ $(foreach X509,$(X509_CERTIFICATES),; echo "  - Including cert $(X509)")
+      cmd_x509certs  = cat $(X509_CERTIFICATES) /dev/null >$@ $(foreach X509,$(X509_CERTIFICATES),; $(kecho) "  - Including cert $(X509)")
 
 targets += $(obj)/x509_certificate_list
 $(obj)/x509_certificate_list: $(X509_CERTIFICATES) $(obj)/.x509.list

