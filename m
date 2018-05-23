Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:48223 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750765AbeEWEqQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 May 2018 00:46:16 -0400
Date: Wed, 23 May 2018 06:46:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH 1/1] kconfig: drop localization support
Message-ID: <20180523044609.GA23800@ravnborg.org>
References: <20180522194928.GA29900@ravnborg.org>
 <CAK7LNAQUF6YbHRTJOtQ9F91M-iqF1U+PemDAbsdx3qzcqg4Ufw@mail.gmail.com>
 <CAK7LNAQWHeR71=H5Z94jAMjRjE-kmjFaPrQy6_cd5=G_WHEpUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQWHeR71=H5Z94jAMjRjE-kmjFaPrQy6_cd5=G_WHEpUw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>

Hi Masahiro.

> > Ulf Magnusson originally mentioned this removal some time ago.
> >
> > So, here is his tag.
> > Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
Added.

> PHONY += xconfig gconfig menuconfig config syncconfig update-po-config \
>      localmodconfig localyesconfig
> 
> 
> The 'update-po-config' is left-over in the PHONY assignment.
Good catch.

> This is simple, so I can fix it up locally.
Fine

If there is any other feedback I will respin the patch.

	Sam
