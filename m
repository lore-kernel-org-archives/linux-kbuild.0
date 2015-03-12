Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:59180 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754294AbbCLPOZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 11:14:25 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH] net:Kconfig: drop no sense dependence entry for BONDING
Date: Thu, 12 Mar 2015 16:14:15 +0100
Message-ID: <5969250.CkvXFhddBO@tacticalops>
In-Reply-To: <20150312135933.GA3502@udknight>
References: <20150312135933.GA3502@udknight>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, j.vosburgh@gmail.com, vfalico@gmail.com, gospo@cumulusnetworks.com, Erik Hugne <erik.hugne@ericsson.com>

On Thursday 12 March 2015 21:59:33 Wang YanQing wrote:
> "IPV6 || IPV6=n" means no dependence!

IPV6 and BONDING are both tristate symbols and therefore this is not the same
as no dependency. When setting IPV6 to m, the expression evaluates to

"IPV6 || IPV6=n" 
"m || m=n"
"m || n"
"m"

So, if IPV6=m, then BONDING can only be n or m, but not y.

