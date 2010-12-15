Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:47262 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753603Ab0LON6v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 08:58:51 -0500
Date: Wed, 15 Dec 2010 14:58:50 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/2] kconfig/conf: kill deadcode
Message-ID: <20101215135850.GC18269@pobox.suse.cz>
References: <1291531935-6183-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291531935-6183-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 05, 2010 at 01:52:14AM -0500, Arnaud Lacombe wrote:
> This is likely to break the swith statement if the one of the enum member ever
> reach 63 ('?').
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/conf.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 8e33aa7..057f49a 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -503,10 +503,6 @@ int main(int ac, char **av)
>  			srand(seed);
>  			break;
>  		}
> -		case '?':
> -			fprintf(stderr, _("See README for usage info\n"));
> -			exit(1);
> -			break;

This code is correct, getopt_long() returns '?' if it encounters an
unknown option. At least the glibc implementation does so.

Michal
