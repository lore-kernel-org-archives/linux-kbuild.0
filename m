Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:60566 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753521AbbEZNJG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 May 2015 09:09:06 -0400
Date: Tue, 26 May 2015 13:52:11 +0200
From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH 3/3] kconfig: Extend defconfig field size from 24 to 32
Message-ID: <20150526115211.GA18353@samfundet.no>
References: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
 <1432640395-17310-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432640395-17310-3-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Haavard Skinnemoen <hskinnemoen@gmail.com>

Around Tue 26 May 2015 13:39:55 +0200 or thereabout, Geert Uytterhoeven wrote:
> next-20150526 has 12 defconfigs with names longer than 24 characters,
> breaking alignment in "make help".
> 
> The "winners" are "atngw100mkii_evklcd100_defconfig" and
> "atngw100mkii_evklcd101_defconfig", counting in at 32 characters.
> 
> Extend the defconfig field size to 32 to restore alignment.
> Don't use a larger value, to not encourage people to create even longer
> defconfig names.

(-:

They were very explicit to the ordering code.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>

Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

<snipp diff>

-- 
mvh
Hans-Christian Egtvedt
