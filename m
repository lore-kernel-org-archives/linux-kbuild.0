Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:58684 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbeKQGFd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Nov 2018 01:05:33 -0500
Date: Fri, 16 Nov 2018 20:51:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] modpost: drop unused command line switches
Message-ID: <20181116195137.GA15240@ravnborg.org>
References: <20181115005602.30746-1-paul.walmsley@sifive.com>
 <20181115005602.30746-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115005602.30746-2-paul.walmsley@sifive.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Paul Walmsley <paul@pwsan.com>

On Wed, Nov 14, 2018 at 04:56:01PM -0800, Paul Walmsley wrote:
> Drop modpost command line switches that are no longer used by
> makefile.modpost, upon request from Sam Ravnborg <sam@ravnborg.org>,
> who wrote:
> 
>     modpost is not supposed to be used outside the kernel build. [...]
>     I checked if there were any options supported by modpost that
>     was not configurable in makefile.modpost.
>     And I could see that the -M and -K options in getopt() was leftovers.
>     The code that used these option was was dropped in:
>     commit a8773769d1a1 ("Kbuild: clear marker out of modpost")
> 
>     Could you add a patch that delete these on top of what you already have.
> 
> https://lore.kernel.org/lkml/20181020140835.GA3351@ravnborg.org/
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>


> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0d998c54564d..85bd93c63180 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2416,7 +2416,7 @@ int main(int argc, char **argv)
>  	struct ext_sym_list *extsym_iter;
>  	struct ext_sym_list *extsym_start = NULL;
>  
> -	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:E")) != -1) {
> +	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awE")) != -1) {
>  		switch (opt) {
>  		case 'i':
>  			kernel_read = optarg;
> -- 
> 2.19.1
