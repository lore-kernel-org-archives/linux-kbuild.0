Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42944 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752354Ab0KZNdj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 08:33:39 -0500
Message-ID: <4CEFB731.4050307@suse.cz>
Date: Fri, 26 Nov 2010 14:33:37 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>	<1286889586-13483-1-git-send-email-mmarek@suse.cz>	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>	<AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com>	<20101122135715.121b5eb7.sfr@canb.auug.org.au>	<AANLkTi=io3tsuL8Hd2a0y8PyBYYAzb-gkJo1GfmpcF+L@mail.gmail.com>	<AANLkTi=eTvdfPjgd0pGVmBx6zCB8yL3qNVq0MR1wH88b@mail.gmail.com>	<AANLkTik-vnDTRTshpXE7ufjCM9AcfLGQV5v9CcjV=zJx@mail.gmail.com> <AANLkTimBAx_yg9S1yqKsXeC048WMkus9aBz5RJAUWBpH@mail.gmail.com>
In-Reply-To: <AANLkTimBAx_yg9S1yqKsXeC048WMkus9aBz5RJAUWBpH@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, randy.dunlap@oracle.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>

On 26.11.2010 13:33, Catalin Marinas wrote:
> On 25 November 2010 18:09, Arnaud Lacombe <lacombar@gmail.com> wrote:
>> On Thu, Nov 25, 2010 at 12:43 PM, Catalin Marinas
>> <catalin.marinas@arm.com> wrote:
>>> Now, commenting on your patches, you added a new statement, 'visible
>>> if...' for menus. Can we not change it to something like:
>>>
>>> -menu "I2C Algorithms"
>>> -       depends on !I2C_HELPER_AUTO
>>> +menu "I2C Algorithms" if !I2C_HELPER_AUTO
>>>
>> no because if_expr are translated internally in term of dependency,
>> which we don't want.
> 
> That's correct but I was wondering whether we could change this kind
> of 'if' to a visibility attribute or a weaker dependency and avoid
> 'select' warnings. This way we wouldn't introduce new keywords to the
> kconfig language.

I quite like the "visible if" notation because it makes it explicit that
it only affects the display of the menu and does not add any dependency
to the data.

Michal
