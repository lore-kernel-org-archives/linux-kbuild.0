Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:48090 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966646AbeFSR1I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jun 2018 13:27:08 -0400
Subject: Re: [RFC v7 0/1] mconf: global i-search in menu prompts
References: <20180617121534.4809-1-dirk@gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <87d68443-ad2c-50e0-ef10-f6a9f349c050@infradead.org>
Date: Tue, 19 Jun 2018 10:27:03 -0700
MIME-Version: 1.0
In-Reply-To: <20180617121534.4809-1-dirk@gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>

On 06/17/2018 05:15 AM, Dirk Gouders wrote:
> Hello,
> 
> Most noticeable changes are that the exact starting position before
> doing i-search is now remebered and i-search stays on the current item
> if a character was added and the new string also matches this item.

Nice.

> Also, compiler warnings were eliminated and A_UNDERLINE was replaced
> with A_STANDOUT to mark active menu items when the focus is on the
> buttons, because I tested mconf on a tty where underlines were not
> visible.  For a complete list of changes see below.

This highlight/standout is good, helpful.

> Dirk
> 
> Changes in v7:
> 
> 
> * Rework i-search instructions text

For the (old) menu_instructions[] string:  that has a hard time fitting in
80x25 or 80x30 console.  I.e., it is being truncated.  I had to resize the
console to 90x30 to see all of it.  Oh well.

> * Remember exact starting position in menu
> 
> * Stay on menu item if it matches pattern with a character added
> 
> * Fix print_autowrap for short texts
> 
> * Focus on buttons: use A_STANDOUT for current menu item

:)

[snip]


I like it.

thanks,
-- 
~Randy
