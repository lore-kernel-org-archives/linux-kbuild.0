Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:36724 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752944Ab1EBQRx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2011 12:17:53 -0400
MIME-Version: 1.0
In-Reply-To: <4DBED641.8080605@suse.cz>
References: <71633.1304013549@localhost>
	<1304083893-18849-1-git-send-email-mmarek@suse.cz>
	<20110502153813.GC15769@sepie.suse.cz>
	<BANLkTi=xfP_1guk5ZuCj0R_r=XqaGwZw-w@mail.gmail.com>
	<4DBED641.8080605@suse.cz>
Date: Mon, 2 May 2011 12:17:52 -0400
Message-ID: <BANLkTikLfXCKKqgrHKy4T7JvumWc_gi7mg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Allow to combine multiple W= levels
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Valdis.Kletnieks@vt.edu, bp@alien8.de, sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davej@redhat.com

Hi,

On Mon, May 2, 2011 at 12:05 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 2.5.2011 17:53, Arnaud Lacombe wrote:
>>
>> Hi Michal,
>>
>> On Mon, May 2, 2011 at 11:38 AM, Michal Marek<mmarek@suse.cz>  wrote:
>>>
>>> On Fri, Apr 29, 2011 at 03:31:33PM +0200, Michal Marek wrote:
>>>>
>>>> Add support for make W=12, make W=123 and so on, to enable warnings from
>>>> multiple W= levels. Normally, make W=<level>  does not include warnings
>>>> from the previous level.
>>>>
>>>> Signed-off-by: Michal Marek<mmarek@suse.cz>
>>>> ---
>>>>  scripts/Makefile.build |    8 ++++++--
>>>>  1 files changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>>>> index 9c0c481..28cef2a 100644
>>>> --- a/scripts/Makefile.build
>>>> +++ b/scripts/Makefile.build
>>>> @@ -60,6 +60,8 @@ endif
>>>>  # $(call cc-option, -W...) handles gcc -W.. options which
>>>>  # are not supported by all versions of the compiler
>>>>  ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
>>>> +warning-  := $(empty)
>>>> +
>>>>  warning-1 := -Wextra -Wunused -Wno-unused-parameter
>>>>  warning-1 += -Wmissing-declarations
>>>>  warning-1 += -Wmissing-format-attribute
>>>> @@ -85,9 +87,11 @@ warning-3 += -Wswitch-default
>>>>  warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
>>>>  warning-3 += $(call cc-option, -Wvla)
>>>>
>>>> -warning := $(warning-$(KBUILD_ENABLE_EXTRA_GCC_CHECKS))
>>>> +warning := $(warning-$(findstring 1,
>>>> $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
>>>> +warning += $(warning-$(findstring 2,
>>>> $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
>>>> +warning += $(warning-$(findstring 3,
>>>> $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
>>>>
>>>> -ifeq ("$(warning)","")
>>>> +ifeq ("$(strip $(warning))","")
>>>>          $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
>>>>  endif
>>>
>>> Pushed to kbuild-2.6.git#kbuild with the following make help update:
>>>
>> you did not comment on the point I raised.
>
> Valdis did. Why is it a problem that W=123 can be interchanged with W=321?
>
Because 321 != 123 and 321 > 123. As I am a dumb human being, I would
expect 321 to have a different meaning than 123, but also 321 to be
more verbose than 123. Said otherwise, humans tends to naturally
interpret 321 and 123 as number rather than concatenation of
character.

 - Arnaud

> Michal
>
