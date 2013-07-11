Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:49908 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756708Ab3GKVFZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jul 2013 17:05:25 -0400
Received: by mail-we0-f170.google.com with SMTP id w57so7534169wes.15
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jul 2013 14:05:24 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20130711210355.GC29911@merkur.ravnborg.org>
References: <CA+icZUX=sOdR5J3rM0YLw350jWJxS7+R_Bb0WkHb7Q4Ekbc6Zg@mail.gmail.com>
	<20130711210355.GC29911@merkur.ravnborg.org>
Date: Thu, 11 Jul 2013 23:05:24 +0200
Message-ID: <CA+icZUWQpoOH03MRT_r5T5vZKwU9p52tCU6MqyCfVi-k7ZGbNA@mail.gmail.com>
Subject: Re: $(call cc-option) in combination with KBUILD_*FLAGS
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Thu, Jul 11, 2013 at 11:03 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Jul 05, 2013 at 05:36:21PM +0200, Sedat Dilek wrote:
>> Hi,
>>
>> in which case(s) do you have to set a comma or not?
>
> Only when you specify the last option.

You have an example for this?
Thanks.

- Sedat -

> So the comma used here:
>
>     651:KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
>
> is of no use - but it does not harm.
>
>         Sam
