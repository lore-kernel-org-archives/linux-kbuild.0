Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:45568 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab3KGFjF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Nov 2013 00:39:05 -0500
Received: from static-50-53-39-157.bvtn.or.frontiernet.net ([50.53.39.157] helo=dragon.site)
	by merlin.infradead.org with esmtpsa (Exim 4.80.1 #2 (Red Hat Linux))
	id 1VeIJ6-0004aX-RU
	for linux-kbuild@vger.kernel.org; Thu, 07 Nov 2013 05:39:04 +0000
Message-ID: <527B2778.4000502@infradead.org>
Date: Wed, 06 Nov 2013 21:39:04 -0800
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: bugzilla #43067: kconfig is 8-bit characters only?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

https://bugzilla.kernel.org/show_bug.cgi?id=43067 asserts that

"The Linux Kernel Configuration system (lkc) expects 8 bit characters only (declared in scripts/kconfig/zconf.l: %option 8bit)."

but that drivers/mtd/nand/Kconfig uses a UTF-8 acute accented capital E 2 times.
I have confirmed that this does indeed muck up nconfig's output as described there.

Do we want to update Documentation/kbuild/kconfig-language.txt to require that
Kconfig text be 8-bit characters only (as zconf.l seems to expect) [and then update
this offending Kconfig file] or is someone interested in making *config support
UTF-8 characters?

thanks,
-- 
~Randy
