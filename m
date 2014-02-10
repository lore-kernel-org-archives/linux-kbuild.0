Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:49520 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751738AbaBJFys (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Feb 2014 00:54:48 -0500
Date: Mon, 10 Feb 2014 06:54:46 +0100
From: Andi Kleen <andi@firstfloor.org>
Subject: ifdef CONFIG in top level makefile
Message-ID: <20140210055446.GQ11821@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


Here's one interesting problem I hit with LTO:

I added some ifdef CONFIG_.... checks early in the top level Makefile.
But I noticed that when a config is first generated these CONFIGs 
seem to be ignored, it's only read later. I assume that is because
the Makefile is no re-parsed after the config is fully set up.

Correct theory? If yes is there a workaround for this?

I assume this could hit other ifdefs in that Makefile too.

Thanks.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
