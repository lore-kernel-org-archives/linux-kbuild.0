Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:46149 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab3F0GXM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Jun 2013 02:23:12 -0400
Received: by mail-wi0-f179.google.com with SMTP id hj3so244311wib.6
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2013 23:23:11 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20130626214425.GA3223@free.fr>
References: <20130625205836.GB14074@free.fr>
	<1372196264-3407-1-git-send-email-yann.morin.1998@free.fr>
	<20130626134852.GA25921@sepie.suse.cz>
	<20130626214425.GA3223@free.fr>
Date: Thu, 27 Jun 2013 08:23:11 +0200
Message-ID: <CA+icZUXBJrdveoptnvGAxsob9dXakqo0-vCnTJxFR563XYgGDQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "kconfig: fix randomising choice entries in
 presence of KCONFIG_ALLCONFIG"
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Wed, Jun 26, 2013 at 11:44 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Michal, All,
>
> On 2013-06-26 15:48 +0200, Michal Marek spake thusly:
>> On Tue, Jun 25, 2013 at 11:37:44PM +0200, Yann E. MORIN wrote:
>> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> >
>> > This reverts commit 8357b48549e17b3e4e402c7f977b65708922e60f.
>> >
>> > It breaks more stuff than it fixes.
>>
>> Thanks, I applied it to kbuild.git#kconfig, after verifying that the
>> issue is gone.
>
> Yes, thanks. I'm sorry this second attempt was a (slightly different!)
> failure again. :-(
>
> The fix is working for boolean choices, but exposes a latent bug on
> tristate changes. Obviously, we must fix that latent bug first, but I
> can't come to a sane solution.
>
> I'll let it mature in a corner of my head for one more night. Maybe I'll
> see things clearer tomorrow. ;-)
>

Just as a side-effect:
Yesterday, I did some git-bisecting which has shown a char-misc-next issue.
Unfortunately, I had to revert this change in several runs to do a
sane bisecting.

NOTE:
Can you please write up some cooler changelog next time why this
revert was done?
In one of your emails you did some nice analysis.
Such informations belong IMHO into the revert's changelog.

- Sedat -

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
