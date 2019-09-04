Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44734 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbfIDQQU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 12:16:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id u14so13648874ljj.11
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Sep 2019 09:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com> <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com> <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
In-Reply-To: <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
From: Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date: Wed, 4 Sep 2019 09:16:07 -0700
Message-ID: <CAA6KcBBeP9xYbVws4=RMFNA4kyrodE-R3mifhbkee-Q+jFRcoQ@mail.gmail.com>
Subject: Re: [usb-storage] Re: [PATCH v4 12/12] RFC: watchdog: export core
 symbols in WATCHDOG_CORE namespace
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Cc: Android Kernel" <kernel-team@android.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, maco@android.com, sspatil@google.com, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-modules@vger.kernel.org, linux-usb <linux-usb@vger.kernel.org>, USB Mass Storage on Linux <usb-storage@lists.one-eyed-alien.net>, linux-watchdog@vger.kernel.org

On Wed, Sep 4, 2019 at 5:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Note that I don't object to the patch set in general. There may be symbols
> which only need be exported in the context of a single subsystem or even
> driver (if a driver consists of more than one module). For example, a mfd
> driver may export symbols which should only be called by its client drivers.
> In such a situation, it may well be beneficial to limit the use of exported
> symbols.

I can appreciate this benefit.

> I am not sure what good that does in practice (if I understand correctly,
> a driver only has to declare that it wants to use a restricted use symbol
> if it wants to use it), but that is a different question.

I think this question implies that you are coming from the perspective
of "security" or wanting to restrict access to the underlying
functions, rather than wanting to clean-up the way symbols are handled
for manageability / maintainability purposes (which is the goal, as I
understand it).

HOWEVER, I have one question:  If these patches are included, and
someone wants to introduce a bit of code which needs to use two
symbols from different namespaces but with the same name, can that be
done?  That is, if driver A has symbol 'foo' and driver B has symbol
'foo' (both in their respective namespaces), and driver C wants to use
A.foo and B.foo, can that be supported?

Matt


-- 
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux
