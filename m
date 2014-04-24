Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52355 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753344AbaDXN0Y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Apr 2014 09:26:24 -0400
Message-ID: <535910FD.7020405@suse.cz>
Date: Thu, 24 Apr 2014 15:26:21 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] builddeb: use $OBJCOPY variable instead of objcopy
References: <1397297604-4271-1-git-send-email-fathi.boudra@linaro.org> <1397395507.10849.77.camel@deadeye.wl.decadent.org.uk>
In-Reply-To: <1397395507.10849.77.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>, Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Maximilian Attems <max@stro.at>

On 2014-04-13 15:25, Ben Hutchings wrote:
> On Sat, 2014-04-12 at 13:13 +0300, Fathi Boudra wrote:
>> In cross-build environment, we expect to use the cross-compiler objcopy
>> instead of the host objcopy.
>>
>> It fixes following build failures:
>> objcopy --only-keep-debug lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tunnel.ko /srv/build/linux/debian/dbgtmp/usr/lib/debug/lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tunnel.ko
>> objcopy: Unable to recognise the format of the input file `lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tunnel.ko'
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> 
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> 
> You could add:
> 
> Cc: stable <stable@vger.kernel.org> # 3.12+
> Fixes: 810e843746b7 ('deb-pkg: split debug symbols in their own package')

Applied to kbuild.git#misc with the above hears.

Thanks,
Michal

