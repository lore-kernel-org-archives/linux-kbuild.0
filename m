Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36165 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758792AbbFBP3c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Jun 2015 11:29:32 -0400
MIME-Version: 1.0
In-Reply-To: <CAEMqcmoZqBTauRJd764NS=77jDbv-_fXSq_b=F_P5VcSdqog8g@mail.gmail.com>
References: <CAEMqcmpHhHdB3Bx-ktfA2F1ni9BPa1jEZ9HLe4eHZu7_L+gyiA@mail.gmail.com>
	<CAOS_Y6Rj_6yyxGN6UxxmM7c1t+=7mQDR8CXw-XmVQaRFsr3Otw@mail.gmail.com>
	<CAEMqcmoZqBTauRJd764NS=77jDbv-_fXSq_b=F_P5VcSdqog8g@mail.gmail.com>
Date: Tue, 2 Jun 2015 17:29:31 +0200
Message-ID: <CAEMqcmro7gr3M1p8MZfjL4hQWUN_XbbpCytgJ4C40hk4qGNLQA@mail.gmail.com>
Subject: Re: Kconfiglib -- a flexible Kconfig parser -- now on GitHub
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, Jun 2, 2015 at 1:16 PM, Ulf Magnusson <ulfalizer.lkml@gmail.com> wrote:
> On Tue, Jun 2, 2015 at 5:10 AM, Rob Landley <rob@landley.net> wrote:
>> On Mon, Jun 1, 2015 at 6:58 PM, Ulf Magnusson <ulfalizer.lkml@gmail.com> wrote:
>>> Hello,
>>>
>>> A few years ago I posted patches for a Python Kconfig parser and
>>> library I was working on (https://lkml.org/lkml/2011/2/6/151). As not
>>> many people are probably aware of it, an updated version of that
>>> library has been at https://github.com/ulfalizer/Kconfiglib for a
>>> while now, and is being used for some tasks in e.g. Buildroot and Das
>>> U-Boot.
>>>
>>> As a concrete example, I just noticed scripts/checkkconfigsymbols.py
>>> and remembered that I have an example script that does the same thing
>>> (minus some functionality):
>>> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/print_undefined.py.
>>>
>>> I have no intention to get Kconfiglib into the kernel (unless there
>>> would be a demand), and it's definitely not meant to replace the C
>>> implementation or introduce a Python dependency for standard builds.
>>> It's just an auxiliary helper library which some people might find
>>> useful -- especially when doing "unusual" things with Kconfig-based
>>> configuration systems.
>>
>> Huh, I have a todo item to write the old 2.6.12 snapshot of kconfig I
>> have in http://landley.net/toybox (it's the only gpl code left in the
>> build), but I just got finished _removing_ python as a bulid
>> dependency last year and am reluctant to reintroduce it.
>
> One drawback of replacing the C implementation with Kconfiglib would
> be that there's no graphical configuration interface like 'menuconfig'
> built in.
>
> You probably already know this, but some of the menus you see in
> 'menuconfig' rely on an "implicit menu" feature by the way, where a
> menu is created automatically if you have a symbol S and a bunch
> of symbols after it that 'depend on S'. That's just pure presentation
> though. (Except that it leads to oddities within 'choice's sometimes
> -- see the docstring for _determine_actual_symbols() in
> kconfiglib.py.)
>
>>
>> I gave up trying to patch upstream kconfig after a half-dozen rounds
>> of https://lwn.net/Articles/161086/ and such were all ignored. (I just
>> documented http://landley.net/aboriginal/FAQ.html#dev_miniconfig and
>> went on with my life. Yes, still using miniconfig.sh a decade
>> later...)
>>
>
> I'm probably missing something in how miniconfig works, but loading up
> a minimal .config file like that in one of the *conf utilites (or Kconfiglib)
> and writing a new .config should already fill in all the derived stuff.
>
> I've never seen Roman Zippel post. Maybe he's tired of working on
> Kconfig.
>
>> (I have rather elaborate kconfig parsing to extract help text, I use
>> specially formatted menuconfig help entries to create command help,
>> and merge the sub-options to create a unified usage: line and
>> alphabetically sorted option description list. That's the stuff that
>> used to be python, which I rewrote in C last year. Somebody submitted
>> a kconfig parser written in awk to toybox a couple years ago, but I
>> can't maintain awk...)
>
> For what it's worth, Kconfiglib can extract help texts. See
> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/help_grep.py
> for example.
>
> /Ulf

The safest way to reach me is at ulfalizer [a.t] [Google's email service] by the
way. A few days ago I discovered that people had sent emails to this account
asking about Kconfiglib well after I posted the original patches. I
feel pretty bad
about that. :/

I'll keep checking this address for a while too just in case.

/Ulf
