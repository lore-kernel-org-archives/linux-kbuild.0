Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23311 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfIDIq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 04:46:28 -0400
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
In-Reply-To: <20190903161045.GA22754@roeck-us.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Sep 2019 17:45:45 +0900
Message-ID: <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] RFC: watchdog: export core symbols in
 WATCHDOG_CORE namespace
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Maennich <maennich@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Cc: Android Kernel" <kernel-team@android.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, maco@android.com, sspatil@google.com, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-modules@vger.kernel.org, linux-usb <linux-usb@vger.kernel.org>, usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org

On Wed, Sep 4, 2019 at 1:10 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Sep 03, 2019 at 04:06:38PM +0100, Matthias Maennich wrote:
> > Modules using symbols from the WATCHDOG_CORE namespace are required to
> > explicitly import the namespace. This patch was generated with the
> > following steps and serves as a reference to use the symbol namespace
> > feature:
> >
> >  1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
> >     in watchdog_core.c
> >  2) make  (see warnings during modpost about missing imports)
> >  3) make nsdeps
> >
> > I used 'allmodconfig' for the above steps to ensure all occurrences are
> > patched.
> >
> > Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
> > case as not only watchdog_core is defined in drivers/watchdog/Makefile.
> > Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
> > to export into a different namespace.
> >
> > An alternative to this patch would be a single definition line before
> > any use of EXPORT_SYMBOL*:
> >  #define DEFAULT_SYMBOL_NAMESPACE WATCHDOG_CORE
> >
> > This patch serves as a reference on how to use the symbol namespaces.
> >
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Matthias Maennich <maennich@google.com>
>
> As mentioned before, I am opposed to this set of changes. I don't see
> the point of restricting the use of exported symbols in WATCHDOG_CORE.
>
> Guenter


I agree.

I do not like this patch set either.

Anyway, the last two patches (usb-stroage, watchdog)
are useful to demonstrate
that this has a bad taste.


--
Best Regards
Masahiro Yamada
