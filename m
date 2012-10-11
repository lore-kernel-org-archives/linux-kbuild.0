Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44279 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751668Ab2JKUKk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Oct 2012 16:10:40 -0400
Message-ID: <507727BB.9070505@suse.cz>
Date: Thu, 11 Oct 2012 22:10:35 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH][RESEND] ignore generated binary file scripts/basic/hash
References: <1349975049-6317-1-git-send-email-hamo.by@gmail.com>
In-Reply-To: <1349975049-6317-1-git-send-email-hamo.by@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yang Bai <hamo.by@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 11.10.2012 19:04, Yang Bai napsal(a):
> Signed-off-by: Yang Bai <hamo.by@gmail.com>
> ---
>  scripts/basic/.gitignore |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/basic/.gitignore b/scripts/basic/.gitignore
> index a776371..b372870 100644
> --- a/scripts/basic/.gitignore
> +++ b/scripts/basic/.gitignore
> @@ -1 +1,2 @@
>  fixdep
> +hash

scripts/basic/hash.c has been removed two years ago.

Michal
