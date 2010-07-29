Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:45248 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753560Ab0G2LmN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 07:42:13 -0400
Received: by fxm14 with SMTP id 14so135340fxm.19
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2010 04:42:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTin1kVoL0kaozsb26id7nsM-BfN1wx1sWf1=EpMi@mail.gmail.com>
References: <AANLkTim9b=n7CvnSJhwDrE_HrnJOJ0H=EpOkGBvJt1CC@mail.gmail.com>
	<20100729091650.GA6085@merkur.ravnborg.org>
	<AANLkTin1kVoL0kaozsb26id7nsM-BfN1wx1sWf1=EpMi@mail.gmail.com>
Date: Thu, 29 Jul 2010 13:42:12 +0200
Message-ID: <AANLkTikEWncPf_tWzcVzMm_trrbiH++EdrtJRD5c-jO_@mail.gmail.com>
Subject: Re: How to access if/endif dependencies programmatically?
From: Vegard Nossum <vegard.nossum@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>

On 29 July 2010 13:29, Vegard Nossum <vegard.nossum@gmail.com> wrote:
>> See how B shows up in two places with different dependencies.
>> Therefore dependencies are an attribute of the menu - not the symbol.
>>
>> So to properly inspect dependencies you need to traverse the menus,
>> not the symbols as they may be used in several places.
>
> Hm, wow, thanks for the explanation, that helps a lot.
>
> There is still just one symbol "B", right, but it has two prompts?
> (And each prompt/menu has a different set of dependencies.)
>
> Can the two prompts have different "depends on"-dependencies, or are
> the following two definitions exactly equivalent?
>
> 1)
> config C
> depends on A
> depends on B
>
> 2)
> config C
> depends on A
> config C
> depends on B

I guess what I really meant was this:

1)
config C
bool "c"
depends on A
depends on B

2)
config C
bool "c1"
depends on A
config C
bool "c2"
depends on B

(This version should actually create two different prompts instead of
just adding dependencies to the same symbol.)


Vegard
