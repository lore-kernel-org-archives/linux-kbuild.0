Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:45894 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753236AbZGENs1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2009 09:48:27 -0400
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com ([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1MNSWI-0002yO-UA
	for linux-kbuild@vger.kernel.org; Sun, 05 Jul 2009 10:16:43 -0400
Date: Sun, 5 Jul 2009 09:46:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Correct initramfs compression comment.
Message-ID: <alpine.LFD.2.00.0907050943170.27170@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Fix the Makefile comment since bzip2 is now supported.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/usr/Makefile b/usr/Makefile
index 245145a..1e6a9e4 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -6,7 +6,7 @@ klibcdirs:;
 PHONY += klibcdirs


-# Gzip, but no bzip2
+# Gzip
 suffix_$(CONFIG_INITRAMFS_COMPRESSION_GZIP)   = .gz

 # Bzip2


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
========================================================================
