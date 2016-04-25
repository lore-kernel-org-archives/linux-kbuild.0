Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35313 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754372AbcDYMHg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 08:07:36 -0400
Subject: Re: [PATCH] kbuild: drop redundant "PHONY += FORCE"
References: <1460081770-29437-1-git-send-email-yamada.masahiro@socionext.com>
 <20160420084710.GF15339@pobox.suse.cz>
 <CAK7LNATv51PRc9bGU7Q8_oTk9=C5ryfu7vMsKbG5drcgVbf1-Q@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <571E0883.5020904@suse.cz>
Date: Mon, 25 Apr 2016 14:07:31 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNATv51PRc9bGU7Q8_oTk9=C5ryfu7vMsKbG5drcgVbf1-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>, Russell King <linux@arm.linux.org.uk>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 2016-04-20 10:56, Masahiro Yamada wrote:
> Hi Michal,
> 
> 2016-04-20 17:47 GMT+09:00 Michal Marek <mmarek@suse.cz>:
>> On Fri, Apr 08, 2016 at 11:16:10AM +0900, Masahiro Yamada wrote:
>>> "PHONY += FORCE" is already cared by scripts/Makefile.build,
>>> which these files are included from.
>>
>> arch/ia64/Makefile is in fact included via the main Makefile. But this
>> one also has the PHONY += FORCE statement. Maybe we should initialize
>> PHONY with FORCE in Kbuild.include. Nevertheless, this patch is correct.
>>
>> Michal
> 
> Ah, right.
> 
> If it is not too late and you do not mind,
> could you rephrase the git-log?

Hi Masahiro,

I'd rather not rewrite the git log. It was just a minor nitpick and
there is not so much going on in arch/ia64 to cause confusion.

Michal
