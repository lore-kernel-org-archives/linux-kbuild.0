Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex.2n.cz ([213.29.92.11]:53417 "EHLO ex.2n.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750857AbYJaKSc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Oct 2008 06:18:32 -0400
Received: from ladis by localhost with local (Exim 3.36 #1 (Debian))	id
 1Kvr02-0005Hx-00	for <linux-kbuild@vger.kernel.org>; Fri, 31 Oct 2008
 11:13:02 +0100
Date: Fri, 31 Oct 2008 11:13:02 +0100
Subject: Menuconfig and !isalpha() characters in comment
Message-ID: <20081031101302.GA20296@michl.2n.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
From: Ladislav Michl <ladis@linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

first let me apologize to report bug which does not trigger in kernel
tree, but I'd rather see it fixed here.

As a testcase apply following patch and run 'make menuconfig ARCH=arm'
Now pressing <space> key no longer toggles selected menuconfig entry,
but rather selects first, second and fourth line of added comment.

How would prefered fix look like? I wouldn't allow comment selection at
first place, but lets wait to some conclusion with good chance to be
accepted in mailine.

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9c0690b..eb89e78 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -3,6 +3,11 @@
 # see Documentation/kbuild/kconfig-language.txt.
 #
 
+comment "----------------"
+comment "................"
+comment "Some comment    "
+comment "----------------"
+
 mainmenu "Linux Kernel Configuration"
 
 config ARM


Best regards,
	ladis
