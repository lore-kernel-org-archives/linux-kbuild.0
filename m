Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 66.63.173.11.static.quadranet.com ([66.63.173.11]:47687 "EHLO
	q1.ich-9.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753959AbbDIWki (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 18:40:38 -0400
Message-ID: <1428616290.3787.22.camel@memnix.com>
Subject: [PATCH RFC 1/1] Explicit check for existing X.509 module signing
 keypair
From: Abelardo Ricart III <aricart@memnix.com>
Date: Thu, 09 Apr 2015 17:51:30 -0400
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz


The module-signing.txt documentation states that the kernel will use an existing
x.509 key pair for module signing should they exist in the root of the source tree.
However, user provided signing keys are overwritten during build if the last-modified 
times on the key pair don't align with what make expects. This patch explicitly checks 
for the existence of the signing key files, skipping key generation should they exist.

Signed-off-by: Abelardo Ricart III <aricart@memnix.com>
---

diff --git a/kernel/Makefile b/kernel/Makefile
index 1408b33..6b8f292 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -168,6 +168,9 @@ ifndef CONFIG_MODULE_SIG_HASH
 $(error Could not determine digest type to use from kernel config)
 endif
 
+ifneq ("$(wildcard $(srctree)/signing_key.priv)","")
+ifneq ("$(wildcard $(srctree)/signing_key.x509)","")
+$(warning *** X.509 module signing key pair not found in root of source tree ***)
 signing_key.priv signing_key.x509: x509.genkey
        @echo "###"
        @echo "### Now generating an X.509 key pair to be used for signing modules."
@@ -184,6 +187,8 @@ signing_key.priv signing_key.x509: x509.genkey
        @echo "###"
        @echo "### Key pair generated."
        @echo "###"
+endif
+endif
 
 x509.genkey:
        @echo Generating X.509 key generation config
