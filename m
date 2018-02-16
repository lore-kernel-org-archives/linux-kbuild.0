Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750940AbeBPWuO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 17:50:14 -0500
Date: Fri, 16 Feb 2018 17:50:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/3] Kconfig: disable PROFILE_ALL_BRANCHES for compile
 testing
Message-ID: <20180216175011.2f18dfd6@gandalf.local.home>
In-Reply-To: <CAK8P3a1U-FWXOAut9322BoK3H8drRvHh8E8CcsEq7HG2cv635Q@mail.gmail.com>
References: <20180216214117.1947175-1-arnd@arndb.de>
        <20180216214117.1947175-2-arnd@arndb.de>
        <20180216170346.497114b3@gandalf.local.home>
        <CAK8P3a1ZvA3dk8qRXaF_yjirYTYkvuCggh8x7QU_p+vMxpTPNA@mail.gmail.com>
        <CAK8P3a1U-FWXOAut9322BoK3H8drRvHh8E8CcsEq7HG2cv635Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, stable <stable@vger.kernel.org>

On Fri, 16 Feb 2018 23:40:22 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

>      ((CAPI_MSG *) msg)->info.facility_req.structs[1] =
> LI_REQ_SILENT_UPDATE & 0xff;
>      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/isdn/hardware/eicon/message.c:11163:54: error: array subscript
> is above array bounds [-Werror=array-bounds]
>      ((CAPI_MSG *) msg)->info.facility_req.structs[2] =
> LI_REQ_SILENT_UPDATE >> 8;
>      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/isdn/hardware/eicon/message.c:11164:54: error: array subscript
> is above array bounds [-Werror=array-bounds]
>      ((CAPI_MSG *) msg)->info.facility_req.structs[3] = 0;
> 
> All those are nonsense AFAICT, and we see them only because the "if()" override
> ends up confusing gcc's value-range tracking in the same way it used to cause
> lots of -Wmaybe-uninitialized warnings (which we just disable these days
> with PROFILE_ALL_BRANCHES).

I'm fine with your patch then.

-- Steve
