Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:47944 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755761Ab1HaNfY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 09:35:24 -0400
Received: by pzk37 with SMTP id 37so1329948pzk.1
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 06:35:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E5E26B8.5030606@suse.cz>
References: <1313471973-13966-1-git-send-email-lacombar@gmail.com>
	<4E5E26B8.5030606@suse.cz>
Date: Wed, 31 Aug 2011 09:35:24 -0400
Message-ID: <CACqU3MUO52++5GYsjK0xripry4Yz93hbM7L6xLppAvb0XS9vvQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: protect locale-unsafe calls
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, s.koylux@gmail.com

Hi,

On Wed, Aug 31, 2011 at 8:19 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 16.8.2011 07:19, Arnaud Lacombe wrote:
>> There is a few calls in kconfig where we end-up using tolower(3) or toupper(3)
>> in an unsafe manner. As highlighted by Serdar, it would seem that Turkish's
>> locale do not have representable lowercase for the Engligh capital-dotless-i.
>>
>> Introduces locale-safe portion in the backend where we reset the local to the
>> default "C".
>>
>> Reported-by: Serdar KÖYLÜ <s.koylux@gmail.com>
>> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>> ---
>>  scripts/kconfig/confdata.c |   10 ++++++++++
>
> I think that just changing kconfig will make things even worse, because
> fixdep does the same operation (CONFIG_FOO -> include/config/foo.h) and
> would get out of sync with kconfig now. I guess the direct cause for
> Serdar's build failure was this staging driver:
> drivers/staging/cxt1e1/sbecom_inline_linux.h:
>
>    53  #if defined(CONFIG_MODVERSIONS) && defined(MODULE) && !
> defined(MODVERSIONS)
>    54  #define MODVERSIONS
>    55  #endif
>    56
>    57  #ifdef MODULE
>    58  #ifdef MODVERSIONS
>    59  #include <config/modversions.h>
>                  ^^^^^^^^^^^^^^^^^^^^
>    60  #endif
>    61  #include <linux/module.h>
>    62  #endif
>    63  #endif
>
> I'll send a patch cleaning this up once I verify that it really is the
> cause.
>
> As for the tollower/toupper issue, I would propose a much simpler way:
> Let's not try to be cute and simply use include/config/FOO_BAR.h for
> each CONFIG_FOO_BAR. x86_64 allmodconfig results in some 5k symbols
> enabled, I'm sure any filesystem will handle a directory with 5k files
> in it.
>
fine with me.

 - Arnaud

> Michal
>
