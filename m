Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:42702 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966705AbeBNEJv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Feb 2018 23:09:51 -0500
Received: by mail-ua0-f194.google.com with SMTP id 47so12925160uau.9
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2018 20:09:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180213235448.GA30690@example.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com> <CAFkk2KQ80dKfQaT1sx_X72ZYVu+N8dBLhEpJEAeK7f52Bb5V1g@mail.gmail.com>
 <20180213235448.GA30690@example.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 14 Feb 2018 05:09:50 +0100
Message-ID: <CAFkk2KTtvHPtSXWX83aVaXpixU7CukG==NvwXDGmHbg0=1sC8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

On Wed, Feb 14, 2018 at 12:54 AM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> Hi Ulf,
>
> On Tue, Feb 13, 2018 at 07:18:27AM +0100, Ulf Magnusson wrote:
>> On Tue, Feb 13, 2018 at 1:56 AM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
>> > From: Eugeniu Rosca <erosca@de.adit-jv.com>
>> >
>> > Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
>> > git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
>> > and vanilla arm64 defconfig, here is the top 10 CONFIG options with
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
>> >
>> > The story behind the above table is that the user needs to visually
>> > review/evaluate 212 expressions which *potentially* select REGMAP_I2C
>> > in order to identify the expressions which *actually* select REGMAP_I2C,
>> > for a particular ARCH and for a particular defconfig used.
>> >
>> > To make this experience smoother, transform the way reverse dependencies
>> > are displayed to the user from [1] to [2].
>> >
>> > [1] Before this commit
>> > Symbol: MTD_BLKDEVS [=y]
>> >   ...
>> >   Selected by:
>> >   - MTD_BLOCK [=y] && MTD [=y] && BLOCK [=y]
>> >   - MTD_BLOCK_RO [=n] && MTD [=y] && MTD_BLOCK [=y]!=y && BLOCK [=y]
>> >   - FTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - NFTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - INFTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - RFD_FTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - SSFDC [=n] && MTD [=y] && BLOCK [=y]
>> >   - SM_FTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - MTD_SWAP [=n] && MTD [=y] && SWAP [=y]
>> >
>> > [2] After this commit
>> > Symbol: MTD_BLKDEVS [=y]
>> >   ...
>> >   Selected by:
>> >   - [y] MTD_BLOCK [=y] && MTD [=y] && BLOCK [=y]
>> >   - [ ] MTD_BLOCK_RO [=n] && MTD [=y] && MTD_BLOCK [=y]!=y && BLOCK [=y]
>> >   - [ ] FTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - [ ] NFTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - [ ] INFTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - [ ] RFD_FTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - [ ] SSFDC [=n] && MTD [=y] && BLOCK [=y]
>> >   - [ ] SM_FTL [=n] && MTD [=y] && BLOCK [=y]
>> >   - [ ] MTD_SWAP [=n] && MTD [=y] && SWAP [=y]
>> >
>> > This patch has been tested using a custom variant of zconfdump which
>> > prints the reverse dependencies for each config symbol.
>> >
>> > Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> > Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
>> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>> > ---
>> >  scripts/kconfig/expr.c | 14 +++++++++++++-
>> >  1 file changed, 13 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> > index 0704bcdf4c78..173fc5b252d5 100644
>> > --- a/scripts/kconfig/expr.c
>> > +++ b/scripts/kconfig/expr.c
>> > @@ -1185,7 +1185,19 @@ expr_print_newline(struct expr *e,
>> >                    void *data,
>> >                    int prevtoken)
>> >  {
>> > -       fn(data, NULL, "\n  - ");
>> > +       switch (expr_calc_value(e)) {
>> > +       case yes:
>> > +               fn(data, NULL, "\n  - [y] ");
>> > +               break;
>> > +       case mod:
>> > +               fn(data, NULL, "\n  - [m] ");
>> > +               break;
>> > +       case no:
>> > +               fn(data, NULL, "\n  - [ ] ");
>> > +               break;
>> > +       default:
>> > +               break;
>>
>> The default case is redundant. expr_calc_value() returns a
>>
>>         typedef enum tristate {
>>                 no, mod, yes
>>         } tristate;
>>
>> (There's a separate sym_get_string_value() that deals with "string
>> values" of symbols.)
>
> Is this variant better?
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 0704bcdf4c78..4bf01269ce72 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1185,7 +1185,24 @@ expr_print_newline(struct expr *e,
>                    void *data,
>                    int prevtoken)
>  {
> -       fn(data, NULL, "\n  - ");
> +       char buf[32];
> +       const char *str;
> +
> +       switch (expr_calc_value(e)) {
> +       case yes:
> +               str = sym_get_string_value(&symbol_yes);
> +               break;
> +       case mod:
> +               str = sym_get_string_value(&symbol_mod);
> +               break;
> +       case no:
> +               /* Prefer '[ ]' to '[n]' for readability */
> +               str = " ";
> +               break;
> +       }
> +
> +       sprintf(buf, "\n  - [%s] ", str);
> +       fn(data, NULL, buf);
>         expr_print(e, fn, data, prevtoken);
>  }
>

The older version was simpler. sym_get_string_value(&symbol_yes/no)
would never be anything other than "y"/"n" in practice. :)

Just removing the following two lines from the original version would
be best I think:

        default:
                break

>> > +       }
>> >         expr_print(e, fn, data, prevtoken);
>> >  }
>> >
>> > --
>> > 2.16.1
>> >
>>
>> Looks good to me otherwise. I still like that earlier sorting idea,
>> but this is a big improvement already.
>
> To be honest, purely as a user, I would probably prefer something like
> below:
>
> Selected by [y/m]:
> - EXPR_01
> - EXPR_02
> Selected by [n]:
> - EXPR_03
> - EXPR_04
>
> But (as a developer) I feel it can only come at the price of increased
> complexity of __expr_print() (at least, if not bigger than, [1]). What I
> like about the current approach suggested by Masahiro is that it keeps
> the impact low with still making a great improvement in readability.
>
> If you think we should explore the second possibility of grouping the
> active/inactive dependencies, I'll try to come up with some solution
> in the next days.
>
> [1] https://marc.info/?l=linux-kbuild&m=151777006005199&w=4

IMO, we could take this as is (after addressing other people's
comments), since it's already a big improvement, and then add sorting
later if we feel like it.

Don't have to do everything at once. :)

Think it should be pretty straightforward to add the kind of sorting
you had in mind at least, by changing PRINT_ALL_SELECTS into
PRINT_INACTIVE_SELECTS in [1], and tweaking some conditions.

>
>> Cheers,
>> Ulf
>
> Thanks for your review and comments!
>
> Best regards,
> Eugeniu.

Cheers,
Ulf
