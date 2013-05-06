Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:41355 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753366Ab3EFKAM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 May 2013 06:00:12 -0400
Received: by mail-wg0-f43.google.com with SMTP id c11so3363436wgh.22
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2013 03:00:11 -0700 (PDT)
Date: Mon, 6 May 2013 12:00:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: Wish: exact matches displayed first
Message-ID: <20130506100007.GA3958@free.fr>
References: <1367826629.4494.30.camel@chaos.site>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1367826629.4494.30.camel@chaos.site>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Roland Eggner <edvx1@systemanalysen.net>, Wang YanQing <udknight@gmail.com>

Jean, All,

On Mon, May 06, 2013 at 09:50:29AM +0200, Jean Delvare wrote:
> I wish a search in "make menuconfig" would return an exact match, if it
> exists, first in the list. At the moment, looking for "PCI", for
> example, returns several dozen entries (anything matching "PCI") and
> CONFIG_PCI is far away from the top. Ideally I would expect this query
> to return CONFIG_PCI first.

Indeed, this has bugged me a few times, too.
I'll see what I can do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
