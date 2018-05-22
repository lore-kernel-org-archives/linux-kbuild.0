Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:37247 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751245AbeEVPtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 11:49:31 -0400
Date: Tue, 22 May 2018 17:49:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 4/5] kconfig: refactor ncurses package checks for
 building mconf
Message-ID: <20180522154924.GA23783@ravnborg.org>
References: <1526804213-8238-1-git-send-email-yamada.masahiro@socionext.com>
 <1526804213-8238-5-git-send-email-yamada.masahiro@socionext.com>
 <20180520100601.GB18441@ravnborg.org>
 <CAK7LNASfQBw4O=etKBmEJFLcvq+NqetwJjo4Dt0XzzRdmen2Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASfQBw4O=etKBmEJFLcvq+NqetwJjo4Dt0XzzRdmen2Eg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

Hi Masahiro.

> > Any chance that the ugly hack in check.sh could be ported over to use pkg-config?
> >
> Rather, I have been wondering if we could rip off the gettext stuff entirely...

I did a little research.
update-po-conifg is broken in current kernel
The part of the Makefile that implement update-po-config hasseen very little
activity the last 5+ years
There is very few hits on google for "update-po-config", first
real hit was something related to a path I made loong time ago.

So it looks like the infrastructure could be dropped in the kernel.
I did not try to check if any other users of kconfig utilize this,
but I do not recall anyone that have mentioned this.

So ack from me to kill gettext support.

	Sam
