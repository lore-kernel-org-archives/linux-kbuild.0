Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:53488 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbeHSStx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Aug 2018 14:49:53 -0400
Subject: Re: make *config regression: pkg-build
References: <alpine.LRH.2.21.1808191406030.12334@math.ut.ee>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <177f25ad-de40-ce3f-987f-ac34c2559be4@infradead.org>
Date: Sun, 19 Aug 2018 08:37:59 -0700
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1808191406030.12334@math.ut.ee>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>

On 08/19/2018 04:15 AM, Meelis Roos wrote:
> Just tried to run 'make menuconfig' on v4.18-10568-g08b5fa819970 and 
> found a bad surprise:
> 
> 'make *config' requires 'pkg-config'. Please install it.
> make[1]: *** [scripts/kconfig/Makefile:219: scripts/kconfig/.mconf-cfg] Error 1
> 
> This is clearly a regression - I have libncurses devele pakcage 
> installed in the default system location (as do 99%+ on actuall 
> develeopers proobably) and in this case, pkg-config is useless. 
> pkg-config is needed only when libraries and headers are installed in 
> non-default locations but it is bad to require installation of 
> pkg-config on all the machines where make menuconfig would be possibly 
> run (for example, I have a aboult 100 machine kernel testbed with 
> self-hosted kernel compilation and machine-specific kernel 
> configurations that ocassionally need tweaking).
> 
> I notice 4.18 complained it can not find pkg-config but still worked. 
> This is clearly better than now.
>
> If we want to support developers with libraries in non-default 
> locations, why not - but the common case of system include path should 
> work without any trouble or warnings. For exaple, test if compilation 
> against ncurses works, and if not retry it with pkg-config (and error 
> out if it does not give working result).
> 

Hi,
This is due to my patch: 4ab3b80159d4db63b902ef635d4b5e882911b2da.

Yamada-san, any ideas?  Feel free to just revert it.

thanks,
-- 
~Randy
