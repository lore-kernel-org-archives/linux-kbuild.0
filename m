Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:56763 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbcD1VUy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 17:20:54 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Failing randconfig builds with CONFIG_TRIM_UNUSED_KSYMS
Date: Thu, 28 Apr 2016 23:20:47 +0200
Message-ID: <3925577.oSPyrRVJmt@wuerfel>
In-Reply-To: <alpine.LFD.2.20.1604281248300.5091@knanqh.ubzr>
References: <1856264.0h7Es0b6Qr@wuerfel> <alpine.LFD.2.20.1604281248300.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thursday 28 April 2016 16:56:23 Nicolas Pitre wrote:
> On Thu, 28 Apr 2016, Arnd Bergmann wrote:
> Well, the actual explanation is that this module uses only one symbol. 
> And when only one symbol was listed, it got ignored.
 
Ok.

> 
> Now fixing this wasn't all that obvious either.  I had a really nice sed 
> rule to parse multiple instances per line, but sed regexp can only do 
> greedy matching. I found out how people work around that limitation but 
> that doesn't work well for string delimiters.
> 
> In the end the best workaround is simple: substitute any ';' with '\n':

Wow, I could have spent days trying to figure these out, glad I gave
up earlier ;-)

I've applied both patches locally now, and have successfully built
all the configurations that failed before. I'll let you know if something
else should come up.

Thanks,

	Arnd

