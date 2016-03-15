Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34804 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965881AbcCOUse (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2016 16:48:34 -0400
Received: by mail-ob0-f171.google.com with SMTP id ts10so30659226obc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Mar 2016 13:48:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56E87463.9020300@suse.com>
References: <1457828035-30584-1-git-send-email-yamada.masahiro@socionext.com>
 <CALCETrVqzidL7SXsCVm8wWrcQMR9dFOLGnDtC-eEYMO4a+yszA@mail.gmail.com>
 <CAK7LNARELkQbhAfBdh9Tx7gVGkpN9gTJzoqJwOF-0CH4zm+wcw@mail.gmail.com>
 <CALCETrVgSUy4ofeBmkZ7TurKvmQVX8C1aj__SLOL6SboQ3S-WA@mail.gmail.com>
 <CAK7LNAQOJjcn7Q+s_pKqzUuojMBtOsRNKsmVwDFXvTeU-zvSeQ@mail.gmail.com>
 <CALCETrU+6sj=reBgPBy7Mq6KYY7BKkVLGwm4XrVzOzb8aU+meg@mail.gmail.com>
 <CAK7LNATAeMmfwWiZha17mbyWhF6bR5RGjv+gbsQTvL4teoTiPQ@mail.gmail.com>
 <CALCETrVNMv5XwpXTJcevVLCfTSMbsqKsjzzukoGr7VAHuumFpg@mail.gmail.com> <56E87463.9020300@suse.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 15 Mar 2016 13:48:13 -0700
Message-ID: <CALCETrW2h+Rt5oEmr09Faf9OesFWYZ_SXmj=zHE4+rDYO85p6Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop FORCE from PHONY targets
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>, Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Luck <tony.luck@intel.com>, Nathan Lynch <nathan_lynch@mentor.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>

On Tue, Mar 15, 2016 at 1:45 PM, Michal Marek <mmarek@suse.com> wrote:
> Dne 15.3.2016 v 19:27 Andy Lutomirski napsal(a):
>> Fair enough, although I'm curious why this happens.  It might be worth
>> changing the docs to say that .PHONY is *not* an substitute for FORCE
>> in that context, then.
>
> These two are unrelated, except that FORCE is redundant for a .PHONY
> target. FORCE is our idiom to tell make to always remake the target and
> let us handle the dependencies manually. Listing a target as .PHONY
> tells make that the target will not produce a file of the same name
> (typically, "all", "install", etc).
>

Except that apparently if-changed doesn't work on .PHONY targets that
don't specify FORCE, which confuses me.

--Andy


-- 
Andy Lutomirski
AMA Capital Management, LLC
