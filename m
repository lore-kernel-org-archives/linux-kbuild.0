Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:48155 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752AbbBFQWx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Feb 2015 11:22:53 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20150206155009.GA23394@kroah.com>
References: <CA+icZUWoPxGgzgjiMEJ1PPXjRp_oa8_C0tceTyK4Ao6_Hco+Gw@mail.gmail.com>
	<20150206155009.GA23394@kroah.com>
Date: Fri, 6 Feb 2015 17:22:51 +0100
Message-ID: <CA+icZUUQF4M2=bOTvD8wWzjpWaR=4=LobQpcCQrkKQKMNd8iHg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IGxpbnV4LTMuMTgueTogQWRkICJrY29uZmlnOiBGaXggd2FybmluZyAi4oCYanVtcA==?=
	=?UTF-8?B?4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQiIg==?=
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Peter_K=C3=BCmmel?= <syntheticpp@gmx.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Feb 6, 2015 at 4:50 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Feb 06, 2015 at 04:40:28PM +0100, Sedat Dilek wrote:
>> Hi,
>>
>> I see the following...
>>
>> $ yes "" | make oldconfig && make silentoldconfig </dev/null
>>   HOSTCC  scripts/basic/fixdep
>>   HOSTCC  scripts/kconfig/conf.o
>>   SHIPPED scripts/kconfig/zconf.tab.c
>>   SHIPPED scripts/kconfig/zconf.lex.c
>>   SHIPPED scripts/kconfig/zconf.hash.c
>>   HOSTCC  scripts/kconfig/zconf.tab.o
>> In file included from scripts/kconfig/zconf.tab.c:2537:0:
>> scripts/kconfig/menu.c: In function ‘get_symbol_str’:
>> scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used
>> uninitialized in this function [-Wmaybe-uninitialized]
>>      jump->offset = strlen(r->s);
>>                   ^
>> scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
>>   struct jump_key *jump;
>>                    ^
>>   HOSTLD  scripts/kconfig/conf
>> scripts/kconfig/conf --oldconfig Kconfig
>> #
>> # configuration written to .config
>> #
>> scripts/kconfig/conf --silentoldconfig Kconfig
>>
>> The fix is "kconfig: Fix warning "‘jump’ may be used uninitialized"" upstream.
>
>
> Sure, what's the git commit id of the patch in Linus's tree?  That's
> annoying to me as well, thanks for reminding me about it.
>

commit 2d560306096739e2251329ab5c16059311a151b0
kconfig: Fix warning "‘jump’ may be used uninitialized"

- Sedat -
