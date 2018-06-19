Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:41142 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966646AbeFSRQT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jun 2018 13:16:19 -0400
Subject: Re: [RFC v7 1/1] mconf: global i-search in menu prompts
References: <20180617121534.4809-1-dirk@gouders.net>
 <20180617121534.4809-2-dirk@gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6e23227d-f3ed-2197-7458-b060b8c90b64@infradead.org>
Date: Tue, 19 Jun 2018 10:16:14 -0700
MIME-Version: 1.0
In-Reply-To: <20180617121534.4809-2-dirk@gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>

Hi Dirk,

On 06/17/2018 05:15 AM, Dirk Gouders wrote:
> 
> At any time, at most one i-search is active and the navigation path to
> the current menu is displayed in the subtitle, the second line in the
> menu window.

Nice.

And the highlight of the current menu item is also nice when TAB is used to
switch to the buttons.  As well as toggling the help text based on context.


> Navigation example:
> 
> To navigate to options concerning NFS file systems, simply type 'n',
> 'f' and 's'.
> 
> Hint: use the 'z' key with focus on buttons to search for invisible
>       prompts.

I think what this says is that the 'z' key is a toggle for the display of
some (invisible) prompts.  Is that correct?



I reliably (consistently) get a segfault.  I have hit it several times.
Here is one way to get it:

$ make menuconfig
and then enter:
/debug\



thanks,
-- 
~Randy
