Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:54318 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756118AbYBJW7d (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Feb 2008 17:59:33 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpA.tele.dk (Postfix) with ESMTP id C4166801540
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Feb 2008 23:59:31 +0100 (CET)
Date: Sun, 10 Feb 2008 23:59:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: make V=1 broken
Message-ID: <20080210225939.GB15317@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>

make V=1 is broken at the moment.

I do not have possibility to look at it until
in ~20 hours.
So if anyone can help until then...

To reproduce:

make defconfig
make V=1

	Sam
