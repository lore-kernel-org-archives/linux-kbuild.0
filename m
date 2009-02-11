Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:38820 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730AbZBKIvV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Feb 2009 03:51:21 -0500
Date: Wed, 11 Feb 2009 09:50:20 +0100
From: Andi Kleen <andi@firstfloor.org>
Subject: one more oldconfig quirk in 2.6.29-rc4
Message-ID: <20090211085020.GA15967@basil.nowhere.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org, linux-kbuild@vger.kernel.org


I changed one option manually in a .config file in a separate
objdir requiring make oldconfig. Then I ran make (without
oldconfig) and got

make[4]: *** [silentoldconfig] Error 1
make[3]: *** [silentoldconfig] Error 2
make[2]: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.  Stop.
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2

In the past make would always run oldconfig automatically.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
