Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:42205 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790Ab3EFNxc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 May 2013 09:53:32 -0400
Received: by mail-wi0-f172.google.com with SMTP id hm14so2564090wib.17
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2013 06:53:31 -0700 (PDT)
Date: Mon, 6 May 2013 15:53:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Wish: exact matches displayed first
Message-ID: <20130506135327.GC3958@free.fr>
References: <1367826629.4494.30.camel@chaos.site>
 <20130506100007.GA3958@free.fr>
 <20130506125459.GB3958@free.fr>
 <20130506150446.7e39f644@skate>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130506150446.7e39f644@skate>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jean Delvare <jdelvare@suse.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Roland Eggner <edvx1@systemanalysen.net>, Wang YanQing <udknight@gmail.com>

Thomas, All,

On Mon, May 06, 2013 at 03:04:46PM +0200, Thomas Petazzoni wrote:
> On Mon, 6 May 2013 14:54:59 +0200, Yann E. MORIN wrote:
> > BTW, did you know that you can search using extended regular expressions?
> > Searching for ^PCI$ will yield only the CONFIG_PCI symbol.
> 
> Wow, I didn't know that. Is this documented/advertised somewhere?

Yes. In Documentation/kbuild/kconfig.txt:

    [...] This will tell you that you can also use
    regular expressions (regexes) in the search string, [...]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
