Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.redfish-solutions.com ([66.232.79.143]:39186 "EHLO
        mail.redfish-solutions.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752432AbeA1TVf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jan 2018 14:21:35 -0500
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Subject: Re: [PATCH v1 1/1] kconfig: double up dollar signs in strings
From: Philip Prindeville <philipp_subx@redfish-solutions.com>
In-Reply-To: <CAK7LNASfxqz3h6eS8gf0XrWg5pTkaixKiyi+svPM3Wuqu8QG6g@mail.gmail.com>
Date: Sun, 28 Jan 2018 12:21:29 -0700
Content-Transfer-Encoding: 8BIT
Message-Id: <A2CC712A-47AA-4997-926D-422B91BF2D05@redfish-solutions.com>
References: <1516597101-30637-1-git-send-email-philipp@redfish-solutions.com>
 <CAK7LNASfxqz3h6eS8gf0XrWg5pTkaixKiyi+svPM3Wuqu8QG6g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Inline

> On Jan 28, 2018, at 4:11 AM, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> 2018-01-22 13:58 GMT+09:00 Philip Prindeville <philipp@redfish-solutions.com>:
>> From: Philip Prindeville <philipp@redfish-solutions.com>
>> 
>> Since kconfig reads and writes makefiles, reflect that dollars need
>> to be doubled up in make syntax so that they're not interpolated.
>> 
>> Example: if we have a CONFIG_VAR of type string that we want to have
>> the value of "abc$def" then it must be written to the file .config
>> file as:
>> 
>> CONFIG_VAR="abc$$def"
>> 
>> to avoid the $d from being interpolated as the $(d).
>> 
>> Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
> 
> 
> Question:
> If you want to interpolate $d, how can you do that?
> Is it possible to make CONFIG_VAR="abc${d}ef” ?


That would be an entirely new requirement of Kbuild, then.

No type that we enter manually has any form of interpretation or interpolation: not string, not bool, not hex, and not int…  These values are always literals.

If there’s to be interpolation, then this would be done in the Makefile itself as:

$(LEFT_PART)$($(MIDDLE_VAR_NAME))$(RIGHT_PART)

where MIDDLE_VAR_NAME:=d or some other similar construct.

That would be done in the Makefile which includes the .config, not the .config itself.  Witness:

obj-$(CONFIG_BONDING) += bonding/

in drivers/net/Makefile —- this is how (and more importantly WHERE) we handle interpolation.


> 
> Currently,
> User input: abc$$def    ->  Output: CONFIG_FOO="abc$$def"
> 
> User input: abc${d}ef   ->  Output: CONFIG_FOO="abc${d}ef"
> 
> Both are possible by inputting the string verbatim.


Then that would be the result of abusing Kbuild.  The values that we enter are meant to be literal values.  Not macros to be interpolated.

Otherwise, we’d have to do all sorts of type checking like (a) is $(d) defined? (b) is $(d) also of type STRING? etc.  Way out of scope of the current language definition.


> 
> With your patch, the conversion is forced as follows:
> 
> User Input: abc$def         ->   Output:  CONFIG_FOO="abc$$def
> 
> So, having a single $ is banned.
> 
> 
> I am wondering what value is added by this patch…


It (a) prevents the user who is potentially naive user (who is oblivious about Makefile syntax and the fact that dollars need to be doubled up) from accidentally entering a single one where two would [currently] be required… (we do, after all, handle backslash, quote, and dquote without requiring the user to be aware of their special properties… why be inconsistent?) and (b) it provides additional error checking and safety by affirming that a STRING really is a literal value and not a MACRO open to some forms of interpolation but not others.

I guess the question boils down to:  should the casual Kbuild user have to be familiar with the intricacies of Makefile syntax?  I don’t think so.  The whole point of Kbuild is to provide a layer of abstraction so that he doesn’t need to
hand-edit Makefiles.  This fix just makes that abstraction more complete.

-Philip


> 
> 
>> scripts/kconfig/confdata.c | 6 +++++-
>> scripts/kconfig/symbol.c   | 9 ++++++---
>> 2 files changed, 11 insertions(+), 4 deletions(-)
>> 
>> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
>> index 87f723804079ed3b6c1fbb0d1470f717582c4a28..e45f23dd04a7ceede2533d80d3ec8fc993685112 100644
>> --- a/scripts/kconfig/confdata.c
>> +++ b/scripts/kconfig/confdata.c
>> @@ -155,11 +155,15 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>>        case S_STRING:
>>                if (*p++ != '"')
>>                        break;
>> -               for (p2 = p; (p2 = strpbrk(p2, "\"\\")); p2++) {
>> +               for (p2 = p; (p2 = strpbrk(p2, "\"\\$")); p2++) {
>>                        if (*p2 == '"') {
>>                                *p2 = 0;
>>                                break;
>>                        }
>> +                       else if (*p2 == '$' && p2[1] != '$') {
>> +                               conf_warning("invalid string found");
>> +                               break;
>> +                       }
>>                        memmove(p2, p2 + 1, strlen(p2));
>>                }
>>                if (!p2) {
>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>> index 7caabdb51c647e12e35b500bdebd262ba1545eb0..2458da4e2b203e5213e4ea0cb380f8f88af566ab 100644
>> --- a/scripts/kconfig/symbol.c
>> +++ b/scripts/kconfig/symbol.c
>> @@ -923,7 +923,7 @@ const char *sym_escape_string_value(const char *in)
>> 
>>        p = in;
>>        for (;;) {
>> -               l = strcspn(p, "\"\\");
>> +               l = strcspn(p, "\"\\$");
>>                p += l;
>> 
>>                if (p[0] == '\0')
>> @@ -940,14 +940,17 @@ const char *sym_escape_string_value(const char *in)
>> 
>>        p = in;
>>        for (;;) {
>> -               l = strcspn(p, "\"\\");
>> +               l = strcspn(p, "\"\\$");
>>                strncat(res, p, l);
>>                p += l;
>> 
>>                if (p[0] == '\0')
>>                        break;
>> 
>> -               strcat(res, "\\");
>> +               if (p[0] == '$')
>> +                       strcat(res, "$");
>> +               else
>> +                       strcat(res, "\\");
>>                strncat(res, p++, 1);
>>        }
>> 
>> --
>> 2.7.4
>> 

