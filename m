Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:44788 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751465Ab3ELU3v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 16:29:51 -0400
Received: by mail-we0-f177.google.com with SMTP id q58so5644138wes.22
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2013 13:29:49 -0700 (PDT)
Date: Sun, 12 May 2013 22:29:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/2] scripts/config: replace hard-coded script name by a
 dynamic value
Message-ID: <20130512202945.GA23643@free.fr>
References: <cover.1368379475.git.chauplac@gmail.com>
 <9442eebf0117a0d975ca766ea84efec4ad58c6d0.1368379475.git.chauplac@gmail.com>
 <20130512192544.GZ17814@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20130512192544.GZ17814@two.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Clement Chauplannaz <chauplac@gmail.com>, linux-kbuild@vger.kernel.org, mmarek@suse.cz

Andy, Clément, All,

On 2013-05-12 21:25 +0200, Andi Kleen spake thusly:
> On Sun, May 12, 2013 at 09:08:51PM +0200, Clement Chauplannaz wrote:
> > The script `config' prints its name in usage() function. It is currently
> > hard-coded to value `config'. However, the script may be reused under
> > a different name in contexts other than the Linux Kernel.
> > 
> > Replace the hard-coded value `config' by the name of the script at runtime.
> > 
> > Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
> 
> Both patched are fine for me.
> Acked-by: Andi Kleen <ak@linux.intel.com>

It's too late for 3.10 now, so I'll queue them in my tree for 3.11.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
