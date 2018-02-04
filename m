Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:34029 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751797AbeBDWMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 17:12:03 -0500
Received: by mail-vk0-f67.google.com with SMTP id f186so16590950vkc.1
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Feb 2018 14:12:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180204214953.GA2905@example.com>
References: <20180204113712.8983-1-rosca.eugeniu@gmail.com>
 <CAFkk2KQmROW-Z--qwvxWQrsohBSsnk_EhqZixOWFXUxeBj=tkQ@mail.gmail.com> <20180204214953.GA2905@example.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 4 Feb 2018 23:12:01 +0100
Message-ID: <CAFkk2KR9JDTxtD7=HVzP4eS2hh6xFNd-AkPi7_cDSgjc8k4u4A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Minimize 'Selected by' and 'Implied by'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>

On Sun, Feb 4, 2018 at 10:49 PM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> Hi Ulf,
>
> On Sun, Feb 04, 2018 at 03:46:00PM +0100, Ulf Magnusson wrote:
>> On Sun, Feb 4, 2018 at 12:37 PM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
>> > From: Eugeniu Rosca <erosca@de.adit-jv.com>
>> >
>> > Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
>> > readable") made an incredible improvement in how reverse dependencies
>> > are perceived by the user, by breaking down the single (often
>> > interminable) expression string into small readable chunks.
>> >
>> > Even so, what happens in practice when reading the reverse
>> > dependencies is that 80-90% of the OR sub-expressions simply don't
>> > matter, since they evaluate to [=n].
>> >
>> > Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
>> > git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
>> > and vanilla arm64 defconfig, here is the top 30 of CONFIG options with
>> > the highest amount of OR sub-expressions that make up the final
>> > "{Selected,Implied} by" reverse dependency expression.
>> >
>> > | Config                        | Revdep all | Revdep ![=n] |
>> > |-------------------------------|------------|--------------|
>> > | REGMAP_I2C                    | 212        | 9            |
>> > | CRC32                         | 167        | 25           |
>> > | FW_LOADER                     | 128        | 5            |
>> > | MFD_CORE                      | 124        | 9            |
>> > | FB_CFB_IMAGEBLIT              | 114        | 2            |
>> > | FB_CFB_COPYAREA               | 111        | 2            |
>> > | FB_CFB_FILLRECT               | 110        | 2            |
>> > | SND_PCM                       | 103        | 2            |
>> > | CRYPTO_HASH                   | 87         | 19           |
>> > | WATCHDOG_CORE                 | 86         | 6            |
>> > | IRQ_DOMAIN                    | 75         | 19           |
>> > | SERIAL_CORE                   | 75         | 9            |
>> > | PHYLIB                        | 74         | 16           |
>> > | REGMAP_MMIO                   | 72         | 15           |
>> > | GENERIC_PHY                   | 67         | 20           |
>> > | DMA_ENGINE                    | 66         | 11           |
>> > | SERIAL_CORE_CONSOLE           | 64         | 9            |
>> > | CRYPTO_BLKCIPHER              | 64         | 13           |
>> > | PINMUX                        | 60         | 17           |
>> > | CRYPTO                        | 59         | 10           |
>> > | MII                           | 58         | 8            |
>> > | GPIOLIB_IRQCHIP               | 58         | 9            |
>> > | MFD_SYSCON                    | 58         | 15           |
>> > | VIDEOBUF2_DMA_CONTIG          | 46         | 4            |
>> > | REGMAP_IRQ                    | 45         | 6            |
>> > | REGMAP_SPI                    | 44         | 2            |
>> > | CLKSRC_MMIO                   | 42         | 5            |
>> > | SND_SOC_GENERIC_DMAENGINE_PCM | 41         | 3            |
>> > | CRYPTO_SHA1                   | 37         | 2            |
>> > | REGMAP                        | 36         | 4            |
>> >
>> > The story behind the above is that we still need to visually
>> > review/evaluate 212 expressions which *potentially* select REGMAP_I2C
>> > in order to identify the expressions which *actually* select
>> > REGMAP_I2C, for a particular ARCH and for a particular defconfig used.
>> >
>> > This patch attempts to bring at user's fingertips those reverse
>> > dependencies that actually participate in selection of given symbol
>> > filtering out the rest of them.
>> >
>> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>> > ---
>> >  scripts/kconfig/expr.c | 24 +++++++++++++++++-------
>> >  1 file changed, 17 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> > index 2ba332b3fed7..147b2d8a8f3e 100644
>> > --- a/scripts/kconfig/expr.c
>> > +++ b/scripts/kconfig/expr.c
>> > @@ -1234,14 +1234,24 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
>> >                 fn(data, e->right.sym, e->right.sym->name);
>> >                 break;
>> >         case E_OR:
>> > -               if (revdep && e->left.expr->type != E_OR)
>> > -                       fn(data, NULL, "\n  - ");
>> > -               __expr_print(e->left.expr, fn, data, E_OR, revdep);
>> > -               if (revdep)
>> > -                       fn(data, NULL, "\n  - ");
>> > -               else
>> > +               if (revdep) {
>> > +                       struct expr *left = e->left.expr;
>> > +                       struct expr *right = e->right.expr;
>> > +
>> > +                       if (expr_calc_value(left) != no) {
>> > +                               if (left->type != E_OR)
>> > +                                       fn(data, NULL, "\n  - ");
>> > +                               __expr_print(left, fn, data, E_OR, revdep);
>> > +                       }
>> > +                       if (expr_calc_value(right) != no) {
>> > +                               fn(data, NULL, "\n  - ");
>> > +                               __expr_print(right, fn, data, E_OR, revdep);
>> > +                       }
>> > +               } else {
>> > +                       __expr_print(e->left.expr, fn, data, E_OR, revdep);
>> >                         fn(data, NULL, " || ");
>> > -               __expr_print(e->right.expr, fn, data, E_OR, revdep);
>> > +                       __expr_print(e->right.expr, fn, data, E_OR, revdep);
>> > +               }
>> >                 break;
>> >         case E_AND:
>> >                 expr_print(e->left.expr, fn, data, E_AND);
>> > --
>> > 2.16.1
>> >
>>
>> Hello,
>>
>> One downside to this is that people might expect e.g. the '?'
>> menuconfig screen to list all the selecting symbols and use it as a
>> reference.
>
> Agreed. See my proposals below.
>
>> The best solution IMO would be to have a separate "Currently selected
>> by:" section on that screen, listing just the non-n selects. The
>> simpler next best thing would be to just replace the "Selected by:"
>> heading with "Currently selected by:", to make it clear that it
>> includes just the active selects.
>
> One certain thing is that with below two categories, some reverse
> dependencies would be printed twice:
> - "Currently selected by" - showing non-n expressions.
> - "Selected by"           - showing both non-n and n expressions.
>
> To avoid the duplicates, I would think about (naming could be improved):
> - "Actively selected by"   or "Currently selected by"
> - "Inactively selected by" or "Passively selected by"
> - "Actively implied by"    or "Currently implied by"
> - "Inactively implied by"  or "Passively implied by"
>
> I do believe that before proceeding with any further alternative
> implementations, we better first agree that the above way to print the
> reverse dependencies is fine for everybody.
>

Looks good to me. Could go with something like "Current active (m/y)
selects" and "Current inactive (n) selects" maybe, to make it super
clear.

>> For the most-selected symbols you listed, most of them end up as "m"
>> on my system by the way, because they come from drivers compiled in as
>> modules. "n" is the minority. Might want to check that most of the
>> ones with a million selects aren't like that, because it might not be
>> that hard to see what's going on for those anyway.
>
> Replying specifically to your `it might not be that hard to see what's
> going on for those anyway`, I do believe that for certain configs
> it is a pain to visually identify the meaningful (i.e.
> non-n) reverse dependencies when there are tens or hundreds of them.
> Getting this information directly from Kbuild (instead of computing it
> externally, either by hand or scripted) was my main motivation and
> driving factor behind sharing the patch.

Consider that a before-coffee comment. It's clearly pretty helpful
even for those "obvious" cases. I had missed those ARM stats. :)

>
>> I used a similar approach in
>> https://github.com/ulfalizer/Kconfiglib/blob/master/kconfiglib.py#L3022
>> by the way. I was always a bit worried that all the expression
>> simplification shenanigans going on in the C implementation might mess
>> with an approach like that, but it seems fine in practice. :)
>
> Can't wait to put my hands on Kconfiglib. Thanks for sharing!
>

Might gain some features that make it viable as a full C
implementation replacement soon, if some stuff pans out. It's always
been more of an auxiliary library. Apparently the C implementation is
a bit of a PITA on Windows.

>> Cheers,
>> Ulf
>
> Best regards,
> Eugeniu.

Cheers,
Ulf
