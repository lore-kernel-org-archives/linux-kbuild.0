Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from stargate.chelsio.com ([67.207.112.58]:10135 "EHLO
	stargate.chelsio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753687Ab1BXTlV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Feb 2011 14:41:21 -0500
Message-ID: <4D66B45B.2050604@chelsio.com>
Date: Thu, 24 Feb 2011 11:41:15 -0800
From: Dimitris Michailidis <dm@chelsio.com>
MIME-Version: 1.0
Subject: Re: [PATCH] cxgb{3,4}: streamline Kconfig options
References: <4D5D30CA020000780003263A@vpn.id2.novell.com> <20110222.101457.39195901.davem@davemloft.net> <4D64E5720200007800033420@vpn.id2.novell.com> <20110223.122709.193705956.davem@davemloft.net> <4D661E2702000078000336B5@vpn.id2.novell.com>
In-Reply-To: <4D661E2702000078000336B5@vpn.id2.novell.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: David Miller <davem@davemloft.net>, divy@chelsio.com, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org

Jan Beulich wrote:

> As to that INET vs NET dependency - is it possible that the
> network drivers really just need NET, but the iSCSI ones need
> INET? In which case the only common dependency would be
> PCI - certainly not worth a custom helper option.

I see about a dozen network drivers that depend on INET.  These may be the 
result of cut&paste from other drivers' Kconfig entries rather than actual 
dependencies.  Also some of these drivers select or selected in the past 
INET_LRO and that may have something to do with their INET dependency, not sure.

Reading the commit message that introduced CHELSIO_T3_DEPENDS, it talks of 
hidden dependencies that select does not see.  I am not sure which exactly 
but since it's been a few years since that commit I'll try to see what the 
situation is today without the *_DEPENDS symbols and let you know.
