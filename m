Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33145 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbeBQRVK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Feb 2018 12:21:10 -0500
Received: by mail-wm0-f41.google.com with SMTP id x4so9594457wmc.0
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Feb 2018 09:21:10 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sat, 17 Feb 2018 18:20:59 +0100
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Message-ID: <20180217172059.GA16512@example.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com>
 <CAFkk2KQ80dKfQaT1sx_X72ZYVu+N8dBLhEpJEAeK7f52Bb5V1g@mail.gmail.com>
 <20180213235448.GA30690@example.com>
 <CAFkk2KTtvHPtSXWX83aVaXpixU7CukG==NvwXDGmHbg0=1sC8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KTtvHPtSXWX83aVaXpixU7CukG==NvwXDGmHbg0=1sC8Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

Hi Ulf,

On Wed, Feb 14, 2018 at 05:09:50AM +0100, Ulf Magnusson wrote:
> IMO, we could take this as is (after addressing other people's
> comments), since it's already a big improvement, and then add sorting
> later if we feel like it.
> 
> Don't have to do everything at once. :)

I agree that it's not possible to do everything perfect right from the
start. But since we are changing the user experience, I just thought
that we would first like to see how both implementations (prefixed
vs grouped tokens) look like, then make a decision (I'm still open
minded about it), then affect the users.

> 
> Think it should be pretty straightforward to add the kind of sorting
> you had in mind at least, by changing PRINT_ALL_SELECTS into
> PRINT_INACTIVE_SELECTS in [1], and tweaking some conditions.

Yep. Thanks to your support, I've pushed v3, where you've already
provided your review findings, which I'm going to fix soon :)

Thanks,
Eugeniu.
