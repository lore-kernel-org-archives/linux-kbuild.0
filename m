Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:52393 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752719Ab3JFPSn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Oct 2013 11:18:43 -0400
Date: Sun, 6 Oct 2013 23:18:21 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: Re: [PATCH]kconfig:mconf: avoid unneeded memcpy
Message-ID: <20131006151821.GA3346@udknight>
References: <20131005175715.GA28091@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131005175715.GA28091@udknight>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, bpoirier@suse.de, walch.martin@web.de, jdelvare@suse.de, linux-kernel@vger.kernel.org

On Sun, Oct 06, 2013 at 01:57:15AM +0800, Wang YanQing wrote:
> In function update_text we assign jump key label
> per page (1)-(9) cycled, and use three space char
> as the header after k exceed JUMP_NB.
> 
> We don't need to call memcpy with header of three
> space char, because it changes nothing, it just
> copy what was there.
> 
> I don't think we need to clear old jump key label in
> current implementation, I can't image out any case
> which a search result could change its jump key label,
> unless user search new string, but then we will re-assign
> jump key label, and it will be fix after that.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>
> ---
>  scripts/kconfig/mconf.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 2c39631..ff9d737 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -379,11 +379,8 @@ static void update_text(char *buf, size_t start, size_t end, void *_data)
>  				data->keys[k] = key;
>  				data->targets[k] = pos->target;
>  				k++;
> -			} else {
> -				sprintf(header, "   ");
> +				memcpy(buf + pos->offset, header, sizeof(header) - 1);
>  			}
> -
> -			memcpy(buf + pos->offset, header, sizeof(header) - 1);
>  		}
>  	}
>  	data->keys[k] = 0;
> -- 
> 1.7.12.4.dirty

Hi all, please ignore this patch.

I image out that we need to clear old jump label when we run 
make menuconfig in a x11 terminal with high resolution that
could show more than 9 item in one page.

Sorry.
