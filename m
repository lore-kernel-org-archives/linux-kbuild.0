Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53056 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732049AbfIEL0O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Sep 2019 07:26:14 -0400
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
 <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net> <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
 <20190905104147.GA27788@linux-8ccs> <CAK8P3a0rf0PhXK1RdF1mWTyGggBJeH0h0YOCxDvJFgxu8wmWKw@mail.gmail.com>
 <20190905111617.GB27788@linux-8ccs>
In-Reply-To: <20190905111617.GB27788@linux-8ccs>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Sep 2019 20:25:32 +0900
Message-ID: <CAK7LNATBWCTJ-FXydob5FUYMymsqCxhenBynb2_NfJdSC2yGDQ@mail.gmail.com>
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Dharm <mdharm-usb@one-eyed-alien.net>, Guenter Roeck <linux@roeck-us.net>, Matthias Maennich <maennich@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Cc: Android Kernel" <kernel-team@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Martijn Coenen <maco@android.com>, Sandeep Patil <sspatil@google.com>, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-modules@vger.kernel.org, linux-usb <linux-usb@vger.kernel.org>, USB Mass Storage on Linux <usb-storage@lists.one-eyed-alien.net>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>

On Thu, Sep 5, 2019 at 8:16 PM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Arnd Bergmann [05/09/19 12:52 +0200]:
> >On Thu, Sep 5, 2019 at 12:41 PM Jessica Yu <jeyu@kernel.org> wrote:
> >> +++ Matthew Dharm [04/09/19 09:16 -0700]:
> >> >On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> >> >HOWEVER, I have one question:  If these patches are included, and
> >> >someone wants to introduce a bit of code which needs to use two
> >> >symbols from different namespaces but with the same name, can that be
> >> >done?  That is, if driver A has symbol 'foo' and driver B has symbol
> >> >'foo' (both in their respective namespaces), and driver C wants to use
> >> >A.foo and B.foo, can that be supported?
> >>
> >> As of now, we currently don't support this - modpost will warn if a
> >> symbol is exported more than once (across modules + vmlinux), and the
> >> module loader currently assumes exported symbol names are unique.  Do
> >> you have a concrete use case? If there is a strong need for this, I
> >> don't think it'd be too hard to implement.
> >
> >I think what would prevent this from working in general is that having
> >two modules with the same exported symbol in different namespaces
> >won't link if you try to build both modules into the kernel itself.
> >
> >      Arnd
>
> Ah yeah, you are right. I only tried building an identically named
> exported symbol in a module and in the kernel, and there I got away
> with a modpost warning. But this breaks when building the module into
> the kernel, so I guess this is out of the question.
>
> Thanks,
>
> Jessica
>


The cover letter starts with
"As of Linux 5.3-rc7, there are 31207 [1] exported symbols in the kernel".

Whether or not we apply this patch set,
we will have to carefully maintain them
so that 31207 symbols are unique, anyway.
(And, we can do this with allmodconfig + modpost)

So, what is the point of the namespace,
where it does not loosen the scope of uniqueness?



--
Best Regards
Masahiro Yamada
