Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:63786 "EHLO
	conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754903AbcDTI4t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 04:56:49 -0400
MIME-Version: 1.0
In-Reply-To: <20160420084710.GF15339@pobox.suse.cz>
References: <1460081770-29437-1-git-send-email-yamada.masahiro@socionext.com>
	<20160420084710.GF15339@pobox.suse.cz>
Date: Wed, 20 Apr 2016 17:56:31 +0900
Message-ID: <CAK7LNATv51PRc9bGU7Q8_oTk9=C5ryfu7vMsKbG5drcgVbf1-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop redundant "PHONY += FORCE"
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>, Russell King <linux@arm.linux.org.uk>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Michal,

2016-04-20 17:47 GMT+09:00 Michal Marek <mmarek@suse.cz>:
> On Fri, Apr 08, 2016 at 11:16:10AM +0900, Masahiro Yamada wrote:
>> "PHONY += FORCE" is already cared by scripts/Makefile.build,
>> which these files are included from.
>
> arch/ia64/Makefile is in fact included via the main Makefile. But this
> one also has the PHONY += FORCE statement. Maybe we should initialize
> PHONY with FORCE in Kbuild.include. Nevertheless, this patch is correct.
>
> Michal

Ah, right.

If it is not too late and you do not mind,
could you rephrase the git-log?

Like this?

----------------------->8------------------------------------
"PHONY += FORCE" is already cared by scripts/Makefile.build or the
top level Makefile, which these files are included from.
-----------------------8<------------------------------------



-- 
Best Regards
Masahiro Yamada
