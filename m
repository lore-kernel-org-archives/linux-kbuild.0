Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46167
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754642Ab1BVSOV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Feb 2011 13:14:21 -0500
Date: Tue, 22 Feb 2011 10:14:57 -0800 (PST)
Message-Id: <20110222.101457.39195901.davem@davemloft.net>
Subject: Re: [PATCH] cxgb{3,4}: streamline Kconfig options
From: David Miller <davem@davemloft.net>
In-Reply-To: <4D5D30CA020000780003263A@vpn.id2.novell.com>
References: <4D5D30CA020000780003263A@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: JBeulich@novell.com
Cc: divy@chelsio.com, dm@chelsio.com, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org

From: "Jan Beulich" <JBeulich@novell.com>
Date: Thu, 17 Feb 2011 13:29:30 +0000

> The CHELSIO_T{3,4}_DEPENDS options are really awkward, and can be
> easily dropped if the reverse dependencies of SCSI_CXGB{3,4}_ISCSI on
> the former get converted to normal (forward) ones referring to
> CHELSIO_T{3,4}.
> 
> Signed-off-by: Jan Beulich <jbeulich@novell.com>

I think the goal of these strange rules is not to be complicated
on purpose, but rather to cause the iSCSI drivers to appear without
the user having to know that he needs to enable the networking
driver in order for that to happen.
