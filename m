Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:36774 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933545AbdERQuQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2017 12:50:16 -0400
Date: Thu, 18 May 2017 10:50:14 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation, kbuild: fix typo "minimun" -> "minimum"
Message-ID: <20170518105014.400353a6@lwn.net>
In-Reply-To: <20170518121729.14776-1-tklauser@distanz.ch>
References: <20170518121729.14776-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

On Thu, 18 May 2017 14:17:29 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

>  Documentation/kbuild/makefiles.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index e18daca65ccd..659afd56ecdb 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -1331,7 +1331,7 @@ See subsequent chapter for the syntax of the Kbuild file.
>  	--- 7.5 mandatory-y
>  
>  	mandatory-y is essentially used by include/uapi/asm-generic/Kbuild.asm
> -	to define the minimun set of headers that must be exported in
> +	to define the minimum set of headers that must be exported in
>  	include/asm.

Applied to the docs tree, thanks.

jon
