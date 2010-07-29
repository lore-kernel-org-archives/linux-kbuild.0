Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:39665 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755287Ab0G2L3v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 07:29:51 -0400
Received: by fxm14 with SMTP id 14so129074fxm.19
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2010 04:29:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100729091650.GA6085@merkur.ravnborg.org>
References: <AANLkTim9b=n7CvnSJhwDrE_HrnJOJ0H=EpOkGBvJt1CC@mail.gmail.com>
	<20100729091650.GA6085@merkur.ravnborg.org>
Date: Thu, 29 Jul 2010 13:29:48 +0200
Message-ID: <AANLkTin1kVoL0kaozsb26id7nsM-BfN1wx1sWf1=EpMi@mail.gmail.com>
Subject: Re: How to access if/endif dependencies programmatically?
From: Vegard Nossum <vegard.nossum@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>

On 29 July 2010 11:16, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Thu, Jul 29, 2010 at 11:01:43AM +0200, Vegard Nossum wrote:
>> Hi,
>>
>> Consider the following kconfig fragment:
>>
>> config A
>>
>> if A
>> config B
>> endif
>
> The dependencies control the visibility.
> The try to explain this consider this adopted
> Kconfig file fragment:
>
> config A
>        bool "A"
>
> config B
>        bool "B"
>
> if A
> config B
>        prompt "BB"
> endif
>
>
> See how B shows up in two places with different dependencies.
> Therefore dependencies are an attribute of the menu - not the symbol.
>
> So to properly inspect dependencies you need to traverse the menus,
> not the symbols as they may be used in several places.

Hm, wow, thanks for the explanation, that helps a lot.

There is still just one symbol "B", right, but it has two prompts?
(And each prompt/menu has a different set of dependencies.)

Can the two prompts have different "depends on"-dependencies, or are
the following two definitions exactly equivalent?

1)
config C
depends on A
depends on B

2)
config C
depends on A
config C
depends on B


Thanks again,


Vegard
