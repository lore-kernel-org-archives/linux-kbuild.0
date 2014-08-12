Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40249 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752865AbaHLRDv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Aug 2014 13:03:51 -0400
Message-ID: <53EA48F2.6060003@infradead.org>
Date: Tue, 12 Aug 2014 10:03:46 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] Documentation: kbuild: Improve grammar
References: <1407511390-5429-1-git-send-email-geert@linux-m68k.org> <1407511390-5429-4-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1407511390-5429-4-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/08/14 08:23, Geert Uytterhoeven wrote:
>   - singular versus plural,
>   - "by" versus "of",
>   - missing "if", "it", "the",
>   - consistent use of "xxx-specific" versus "xxx specific".
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/kbuild/makefiles.txt | 58 +++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Michal, are you going to pick up Geert's 4 kbuild doc. patches
or should I do it?

Thanks,
-- 
~Randy
