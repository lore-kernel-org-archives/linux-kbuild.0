Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:17563 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754019AbcCNEIZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Mar 2016 00:08:25 -0400
MIME-Version: 1.0
In-Reply-To: <CALCETrVqzidL7SXsCVm8wWrcQMR9dFOLGnDtC-eEYMO4a+yszA@mail.gmail.com>
References: <1457828035-30584-1-git-send-email-yamada.masahiro@socionext.com>
	<CALCETrVqzidL7SXsCVm8wWrcQMR9dFOLGnDtC-eEYMO4a+yszA@mail.gmail.com>
Date: Mon, 14 Mar 2016 13:08:16 +0900
Message-ID: <CAK7LNARELkQbhAfBdh9Tx7gVGkpN9gTJzoqJwOF-0CH4zm+wcw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop FORCE from PHONY targets
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Nathan Lynch <nathan_lynch@mentor.com>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>

Hi Andy

2016-03-14 9:39 GMT+09:00 Andy Lutomirski <luto@amacapital.net>:
> On Mar 12, 2016 4:14 PM, "Masahiro Yamada"
> <yamada.masahiro@socionext.com> wrote:
>>
>> These targets are marked as PHONY.  No need to add FORCE to their
>> dependency.
>
> If this is, in fact, correct, can you update
> Documentation/kbuild/makefiles.txt as well?

Which line do you want me to update?




-- 
Best Regards
Masahiro Yamada
