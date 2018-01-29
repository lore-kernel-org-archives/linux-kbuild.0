Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42612 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbeA2Nmu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jan 2018 08:42:50 -0500
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com [209.85.217.170]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w0TDge4R030763
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2018 22:42:41 +0900
Received: by mail-ua0-f170.google.com with SMTP id q8so4665637uae.4
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2018 05:42:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <A2CC712A-47AA-4997-926D-422B91BF2D05@redfish-solutions.com>
References: <1516597101-30637-1-git-send-email-philipp@redfish-solutions.com>
 <CAK7LNASfxqz3h6eS8gf0XrWg5pTkaixKiyi+svPM3Wuqu8QG6g@mail.gmail.com> <A2CC712A-47AA-4997-926D-422B91BF2D05@redfish-solutions.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Jan 2018 22:41:59 +0900
Message-ID: <CAK7LNATHr-EnAaig694NU3mtZg1tR0fnx1jEOu514Kg=RaM2mw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kconfig: double up dollar signs in strings
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philip Prindeville <philipp_subx@redfish-solutions.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-01-29 4:21 GMT+09:00 Philip Prindeville
<philipp_subx@redfish-solutions.com>:
> Inline
>
>> On Jan 28, 2018, at 4:11 AM, Masahiro Yamada <yamada.masahiro@socionext.=
com> wrote:
>>
>> 2018-01-22 13:58 GMT+09:00 Philip Prindeville <philipp@redfish-solutions=
.com>:
>>> From: Philip Prindeville <philipp@redfish-solutions.com>
>>>
>>> Since kconfig reads and writes makefiles, reflect that dollars need
>>> to be doubled up in make syntax so that they're not interpolated.
>>>
>>> Example: if we have a CONFIG_VAR of type string that we want to have
>>> the value of "abc$def" then it must be written to the file .config
>>> file as:
>>>
>>> CONFIG_VAR=3D"abc$$def"
>>>
>>> to avoid the $d from being interpolated as the $(d).
>>>
>>> Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
>>
>>
>> Question:
>> If you want to interpolate $d, how can you do that?
>> Is it possible to make CONFIG_VAR=3D"abc${d}ef=E2=80=9D ?
>
>
> That would be an entirely new requirement of Kbuild, then.

I would not say this is requirement, but
looks like xtensa is already doing interpolation. [1]

[1] https://github.com/torvalds/linux/blob/v4.15/arch/xtensa/configs/cadenc=
e_csp_defconfig#L18




> No type that we enter manually has any form of interpretation or interpol=
ation: not string, not bool, not hex, and not int=E2=80=A6  These values ar=
e always literals.
>
> If there=E2=80=99s to be interpolation, then this would be done in the Ma=
kefile itself as:
>
> $(LEFT_PART)$($(MIDDLE_VAR_NAME))$(RIGHT_PART)
>
> where MIDDLE_VAR_NAME:=3Dd or some other similar construct.
>
> That would be done in the Makefile which includes the .config, not the .c=
onfig itself.  Witness:
>
> obj-$(CONFIG_BONDING) +=3D bonding/
>
> in drivers/net/Makefile =E2=80=94- this is how (and more importantly WHER=
E) we handle interpolation.
>
>>
>> Currently,
>> User input: abc$$def    ->  Output: CONFIG_FOO=3D"abc$$def"
>>
>> User input: abc${d}ef   ->  Output: CONFIG_FOO=3D"abc${d}ef"
>>
>> Both are possible by inputting the string verbatim.
>
>
> Then that would be the result of abusing Kbuild.  The values that we ente=
r are meant to be literal values.  Not macros to be interpolated.
>
> Otherwise, we=E2=80=99d have to do all sorts of type checking like (a) is=
 $(d) defined? (b) is $(d) also of type STRING? etc.  Way out of scope of t=
he current language definition.



There is some room for discussion if we should ban interpolation or not.
Even if this is abuse, it is matter of Kbuild,
not in the scope of Kconfig.

My point is,
'$' is not a special character for Kconfig.
So, Kconfig is agnostic about it.



>
>>
>> With your patch, the conversion is forced as follows:
>>
>> User Input: abc$def         ->   Output:  CONFIG_FOO=3D"abc$$def
>>
>> So, having a single $ is banned.
>>
>>
>> I am wondering what value is added by this patch=E2=80=A6
>
>
> It (a) prevents the user who is potentially naive user (who is oblivious =
about Makefile syntax and the fact that dollars need to be doubled up) from=
 accidentally entering a single one where two would [currently] be required=
=E2=80=A6


There is one more thing you are missing.

You are only talking about the use in Makefile, but
string type options are used in C as well.

For example, CONFIG_DEFAULT_HOSTNAME [2], CONFIG_PANEL_BOOT_MESSAGE [3].

[2] https://github.com/torvalds/linux/blob/v4.15/include/linux/uts.h#L13
[3] https://github.com/torvalds/linux/blob/v4.15/drivers/auxdisplay/charlcd=
.c#L730


With your patch,

User input: abc$def  ->
Output of include/generated/autoconf.h:   #define CONFIG_FOO "ab$$def"

This is breakage since $ is doubled up in C language,
where it should not happen.




> (we do, after all, handle backslash, quote, and dquote without requiring =
the user to be aware of their special properties=E2=80=A6 why be inconsiste=
nt?)

I am not sure about this background,
but I guess escaping is C-oriented.

User input: abc"def     ->     #define CONFIG_FOO  "abc\"def"

User input: abc\def     ->     #define CONFIG_FOO  "abc\\def"

Single-quote is not escaped.  Kconfig handles it as-is.

User input: abc'def     ->     #define CONFIG_FOO  "abc'def"


So, one down-side is, CONFIG option cannot contain escape sequence like '\n=
'
I am thinking of dropping escaping.
U-Boot already did this. [4]

[4] https://github.com/u-boot/u-boot/commit/20c20826efabf9ed64f5555bc8739bd=
bb89c1edd



> and (b) it provides additional error checking and safety by affirming tha=
t a STRING really is a literal value and not a MACRO open to some forms of =
interpolation but not others.


Why does Kconfig need to check this?




> I guess the question boils down to:  should the casual Kbuild user have t=
o be familiar with the intricacies of Makefile syntax?  I don=E2=80=99t thi=
nk so.  The whole point of Kbuild is to provide a layer of abstraction so t=
hat he doesn=E2=80=99t need to
> hand-edit Makefiles.  This fix just makes that abstraction more complete.
>
> -Philip
>
>
>>
>>
>>> scripts/kconfig/confdata.c | 6 +++++-
>>> scripts/kconfig/symbol.c   | 9 ++++++---
>>> 2 files changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
>>> index 87f723804079ed3b6c1fbb0d1470f717582c4a28..e45f23dd04a7ceede2533d8=
0d3ec8fc993685112 100644
>>> --- a/scripts/kconfig/confdata.c
>>> +++ b/scripts/kconfig/confdata.c
>>> @@ -155,11 +155,15 @@ static int conf_set_sym_val(struct symbol *sym, i=
nt def, int def_flags, char *p)
>>>        case S_STRING:
>>>                if (*p++ !=3D '"')
>>>                        break;
>>> -               for (p2 =3D p; (p2 =3D strpbrk(p2, "\"\\")); p2++) {
>>> +               for (p2 =3D p; (p2 =3D strpbrk(p2, "\"\\$")); p2++) {
>>>                        if (*p2 =3D=3D '"') {
>>>                                *p2 =3D 0;
>>>                                break;
>>>                        }
>>> +                       else if (*p2 =3D=3D '$' && p2[1] !=3D '$') {
>>> +                               conf_warning("invalid string found");
>>> +                               break;
>>> +                       }
>>>                        memmove(p2, p2 + 1, strlen(p2));
>>>                }
>>>                if (!p2) {
>>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>>> index 7caabdb51c647e12e35b500bdebd262ba1545eb0..2458da4e2b203e5213e4ea0=
cb380f8f88af566ab 100644
>>> --- a/scripts/kconfig/symbol.c
>>> +++ b/scripts/kconfig/symbol.c
>>> @@ -923,7 +923,7 @@ const char *sym_escape_string_value(const char *in)
>>>
>>>        p =3D in;
>>>        for (;;) {
>>> -               l =3D strcspn(p, "\"\\");
>>> +               l =3D strcspn(p, "\"\\$");
>>>                p +=3D l;
>>>
>>>                if (p[0] =3D=3D '\0')
>>> @@ -940,14 +940,17 @@ const char *sym_escape_string_value(const char *i=
n)
>>>
>>>        p =3D in;
>>>        for (;;) {
>>> -               l =3D strcspn(p, "\"\\");
>>> +               l =3D strcspn(p, "\"\\$");
>>>                strncat(res, p, l);
>>>                p +=3D l;
>>>
>>>                if (p[0] =3D=3D '\0')
>>>                        break;
>>>
>>> -               strcat(res, "\\");
>>> +               if (p[0] =3D=3D '$')
>>> +                       strcat(res, "$");
>>> +               else
>>> +                       strcat(res, "\\");
>>>                strncat(res, p++, 1);
>>>        }
>>>
>>> --
>>> 2.7.4
>>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
