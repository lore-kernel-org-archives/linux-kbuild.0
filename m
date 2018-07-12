Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51345 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbeGLLRT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 07:17:19 -0400
Date: Thu, 12 Jul 2018 13:08:06 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] kbuild: suppress warnings from 'getconf LFS_*'
Message-ID: <20180712110806.dql44ngo4nysozj6@pengutronix.de>
References: <1531391916-24086-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1531391916-24086-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Thu, Jul 12, 2018 at 07:38:36PM +0900, Masahiro Yamada wrote:
> Suppress warnings for systems that do not recognize LFS_*.
> 
>  getconf: no such configuration parameter `LFS_CFLAGS'
>  getconf: no such configuration parameter `LFS_LDFLAGS'
>  getconf: no such configuration parameter `LFS_LIBS'
> 
> Fixes: d7f14c66c273 ("kbuild: Enable Large File Support for hostprogs")
> Reported-by: Chen Feng <puck.chen@hisilicon.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Which is the system that doesn't know about LFS_* and you care about?
Irrespective of that:

Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
