Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:46541 "EHLO
        mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbeBQRbu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Feb 2018 12:31:50 -0500
Received: by mail-vk0-f50.google.com with SMTP id o204so3556050vkd.13
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Feb 2018 09:31:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180217172059.GA16512@example.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com> <CAFkk2KQ80dKfQaT1sx_X72ZYVu+N8dBLhEpJEAeK7f52Bb5V1g@mail.gmail.com>
 <20180213235448.GA30690@example.com> <CAFkk2KTtvHPtSXWX83aVaXpixU7CukG==NvwXDGmHbg0=1sC8Q@mail.gmail.com>
 <20180217172059.GA16512@example.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 17 Feb 2018 18:31:48 +0100
Message-ID: <CAFkk2KTmPEC-CxO2u0qXBKkRvpScGFD3C6LHdgL+LCBWKf7Dig@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

On Sat, Feb 17, 2018 at 6:20 PM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> Hi Ulf,
>
> On Wed, Feb 14, 2018 at 05:09:50AM +0100, Ulf Magnusson wrote:
>> IMO, we could take this as is (after addressing other people's
>> comments), since it's already a big improvement, and then add sorting
>> later if we feel like it.
>>
>> Don't have to do everything at once. :)
>
> I agree that it's not possible to do everything perfect right from the
> start. But since we are changing the user experience, I just thought
> that we would first like to see how both implementations (prefixed
> vs grouped tokens) look like, then make a decision (I'm still open
> minded about it), then affect the users.

Isn't the latest patchset doing both? That seems like the best of both worlds.

And yeah, I just get some personal restlessness when good stuff floats
around for a long time without getting in. :)

Cheers,
Ulf
