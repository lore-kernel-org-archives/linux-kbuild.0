Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:33301 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753016AbbLEJng (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Dec 2015 04:43:36 -0500
Subject: Re: [PATCH] fixdep: constify strrcmp arguments
References: <1447870035-14677-1-git-send-email-nicolas.iooss_linux@m4x.org>
From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Message-ID: <5662B1C4.5050104@m4x.org>
Date: Sat, 5 Dec 2015 10:43:32 +0100
MIME-Version: 1.0
In-Reply-To: <1447870035-14677-1-git-send-email-nicolas.iooss_linux@m4x.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hello,
I sent the path below a few weeks ago and did not have any feedback.
Could you please review it?

Thanks,
Nicolas

On 11/18/2015 07:07 PM, Nicolas Iooss wrote:
> strrcmp only performs read access to the memory addressed by its
> arguments so make them const pointers.
> 
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
> ---
>  scripts/basic/fixdep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index c68fd61fdc42..5b327c67a828 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -251,7 +251,7 @@ static void parse_config_file(const char *map, size_t len)
>  }
>  
>  /* test is s ends in sub */
> -static int strrcmp(char *s, char *sub)
> +static int strrcmp(const char *s, const char *sub)
>  {
>  	int slen = strlen(s);
>  	int sublen = strlen(sub);
> 

