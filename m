Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:51923 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866Ab0KZMdz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 07:33:55 -0500
MIME-Version: 1.0
In-Reply-To: <AANLkTik-vnDTRTshpXE7ufjCM9AcfLGQV5v9CcjV=zJx@mail.gmail.com>
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>
	<1286889586-13483-1-git-send-email-mmarek@suse.cz>
	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>
	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>
	<AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com>
	<20101122135715.121b5eb7.sfr@canb.auug.org.au>
	<AANLkTi=io3tsuL8Hd2a0y8PyBYYAzb-gkJo1GfmpcF+L@mail.gmail.com>
	<AANLkTi=eTvdfPjgd0pGVmBx6zCB8yL3qNVq0MR1wH88b@mail.gmail.com>
	<AANLkTik-vnDTRTshpXE7ufjCM9AcfLGQV5v9CcjV=zJx@mail.gmail.com>
Date: Fri, 26 Nov 2010 12:33:54 +0000
Message-ID: <AANLkTimBAx_yg9S1yqKsXeC048WMkus9aBz5RJAUWBpH@mail.gmail.com>
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
From: Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>, randy.dunlap@oracle.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>

On 25 November 2010 18:09, Arnaud Lacombe <lacombar@gmail.com> wrote:
> On Thu, Nov 25, 2010 at 12:43 PM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
>> Now, commenting on your patches, you added a new statement, 'visible
>> if...' for menus. Can we not change it to something like:
>>
>> -menu "I2C Algorithms"
>> -       depends on !I2C_HELPER_AUTO
>> +menu "I2C Algorithms" if !I2C_HELPER_AUTO
>>
> no because if_expr are translated internally in term of dependency,
> which we don't want.

That's correct but I was wondering whether we could change this kind
of 'if' to a visibility attribute or a weaker dependency and avoid
'select' warnings. This way we wouldn't introduce new keywords to the
kconfig language.

-- 
Catalin
