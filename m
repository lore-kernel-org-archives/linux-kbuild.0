Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141]:43598 "EHLO
	eu1sys200aog116.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753531Ab1HCKH0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Aug 2011 06:07:26 -0400
Message-ID: <4E3916B8.10301@st.com>
Date: Wed, 03 Aug 2011 10:36:56 +0100
From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Reply-To: srinivas.kandagatla@st.com
MIME-Version: 1.0
Subject: Re: [PATCH kernel-3.0] kbuild: Fix help text not displayed in choice
 option.
References: <1312311798-27851-1-git-send-email-srinivas.kandagatla@st.com> <CACqU3MXuNqO4rfXwQYm_L200_htgYhRG1E5zrJkt9wDPOpfzBw@mail.gmail.com>
In-Reply-To: <CACqU3MXuNqO4rfXwQYm_L200_htgYhRG1E5zrJkt9wDPOpfzBw@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------050603060403040703050508"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, stuart.menefy@st.com

This is a multi-part message in MIME format.
--------------050603060403040703050508
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Hi Arnaud,
Thankyou for the comments,
Here is the new patch with comments included.

Thanks,
srini

Arnaud Lacombe wrote:
> Hi,
>
> On Tue, Aug 2, 2011 at 3:03 PM, Srinivas KANDAGATLA
> <srinivas.kandagatla@st.com> wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>>
>> Help text under choice menu is never displayed because it does not have
>> symbol name associated with it, however many kconfigs have help text
>> under choice, assuming that it will be displayed when user selects help.
>>
>> This patch changes the logic in menu_get_ext_help to display help for
>> cases which dont have symbol names like choice..
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>> Reviewed-by: Stuart Menefy <stuart.menefy@st.com>
>>
> could you please provide a reduced testcase included in the changelog
> ? That will avoid people looking at the bug later on to figure out
> what caused the issue. The following snippet :
>
> choice
>         prompt "Choice"
>         ---help---
>            HELP TEXT ...
>
> config A
>         bool "A"
>
> config B
>         bool "B"
>
> endchoice
>
> should be enough, as the problem is caused by "anonymous" choice.
>
>> ---
>>
>> To see this bug in action, go to "PCI access mode" under PCI support, and hit the
>> help button. You will see no help text displayed. However in  arch/x86/Kconfig under
>> "PCI access mode" there is help section.
>>
>> Help text under choice menu is never displayed because it does not have symbol name
>> associated with it, however many kconfigs have help text under choice, assuming
>> that it will be displayed when user selects help.
>>
>> This patch changes the logic in menu_get_ext_help to display help for cases which
>> dont have symbol names like choice.
>>
> that look good to me.
>
> Thanks,
>  - Arnaud
>
> ps: do you consider Cc: for stable@ ?
>
>>  scripts/kconfig/menu.c |    7 +++----
>>  1 files changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index d660086..beeb92e 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -597,11 +597,10 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
>>        struct symbol *sym = menu->sym;
>>
>>        if (menu_has_help(menu)) {
>> -               if (sym->name) {
>> +               if (sym->name)
>>                        str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
>> -                       str_append(help, _(menu_get_help(menu)));
>> -                       str_append(help, "\n");
>> -               }
>> +               str_append(help, _(menu_get_help(menu)));
>> +               str_append(help, "\n");
>>        } else {
>>                str_append(help, nohelp_text);
>>        }
>> --
>> 1.6.3.3
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>


--------------050603060403040703050508
Content-Type: text/x-patch;
 name="0001-kbuild-Fix-help-text-not-displayed-in-choice-option.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-kbuild-Fix-help-text-not-displayed-in-choice-option.pat";
 filename*1="ch"

From 7d1c644b41f246b897db40384618520787445328 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Date: Tue, 2 Aug 2011 18:49:52 +0100
Subject: [PATCH kernel-3.0] kbuild: Fix help text not displayed in choice option.

Help text under choice menu is never displayed because it does not have
symbol name associated with it, however many kconfigs have help text
under choice, assuming that it will be displayed when user selects help.
for example in Kconfig if we have:
choice
        prompt "Choice"
        ---help---
           HELP TEXT ...

config A
        bool "A"

config B
        bool "B"

endchoice

Without this patch "HELP TEXT" is not displayed when user selects help option 
when "Choice" is highlighted from menuconfig or xconfig or gconfig.

This patch changes the logic in menu_get_ext_help to display help for
cases which dont have symbol names like choice.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Reviewed-by: Stuart Menefy <stuart.menefy@st.com>
---

 scripts/kconfig/menu.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d660086..beeb92e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -597,11 +597,10 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 	struct symbol *sym = menu->sym;
 
 	if (menu_has_help(menu)) {
-		if (sym->name) {
+		if (sym->name)
 			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
-			str_append(help, _(menu_get_help(menu)));
-			str_append(help, "\n");
-		}
+		str_append(help, _(menu_get_help(menu)));
+		str_append(help, "\n");
 	} else {
 		str_append(help, nohelp_text);
 	}
-- 
1.6.3.3


--------------050603060403040703050508--
