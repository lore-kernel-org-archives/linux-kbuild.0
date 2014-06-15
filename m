Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45381 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751317AbaFOQTK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Jun 2014 12:19:10 -0400
Date: Sun, 15 Jun 2014 18:19:06 +0200
From: Jean Delvare <jdelvare@suse.de>
Subject: Duplicate Kconfig symbol
Message-ID: <20140615181906.20b46668@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi Yann, all,

HISAX_AVM_A1_PCMCIA is declared twice in drivers/isdn/hisax/Kconfig. As
a bool both times, but with different defaults and dependencies.

As far as I can see, Kconfig simply ignores the second declaration.
I'll send a patch to the maintainer of the ISDN subsystem, but
couldn't/shouldn't Kconfig complain about the second declaration,
instead of ignoring it? That would let us spot such errors much earlier.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
