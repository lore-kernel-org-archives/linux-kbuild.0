Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:46112 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751751AbeFIHtR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Jun 2018 03:49:17 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC v4 0/1] i-search functionality for mconf
In-Reply-To: <20180608215655.GB28473@ravnborg.org> (Sam Ravnborg's message of
        "Fri, 8 Jun 2018 23:56:55 +0200")
References: <20180608184606.5029-1-dirk@gouders.net>
        <20180608215655.GB28473@ravnborg.org>
Date: Sat, 09 Jun 2018 09:40:27 +0200
Message-ID: <ghlgbo5rx0.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>

Sam Ravnborg <sam@ravnborg.org> writes:

> Hi Dirk.
>
> On Fri, Jun 08, 2018 at 08:46:05PM +0200, Dirk Gouders wrote:
>> Hello,
>> 
>> this version is a prototype of the idea, Sam suggested -- I hope I
>> undestood it correctly.
>> 
>> This is a remarkable change to mconf in it's behavior; mainly it now
>> differentiates two focuses and operates differently, depending on the
>> focus.  When the focus is on the menu, mconf is in i-search mode, for
>> a detailed description see 1/1.
>> 
>> As stated earlier, this is just a prototype, documentation is missing
>> and the code is not ready for a real commit.
>
> When trying this out it started to work as envisioned.
> But somehw I manage to get stuck in the menus and cannot navigate to
> the buttons.
>
> Consider to remove the old short-cut for the menus.
> (Most/all the first_alph thingy in menubox.c)
> That will avoid two confliting navigations principles and likely
> make the code simpler to read.
>
> I am not sure, but maybe you can get rid of all the hotkey
> support in print_item with this change too.

Hi Sam,

thank you (and also to Randy) for having a look at it.

Next, I will prepare a patch, more thorougly tested,
documentation included and with hotkey support removed.

You are right, trying to support two navigation principles makes
everything too complex and I was too eager to keep as much of today's
functionality as possible.

Dirk
