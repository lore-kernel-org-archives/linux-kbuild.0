Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:60660 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751093AbdBFMBJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 07:01:09 -0500
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] kconfig/mconf: add jumping tip in title of search result textbox
In-Reply-To: <20170206074648.23896-2-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com> <20170206074648.23896-2-changbin.du@intel.com>
Date: Mon, 06 Feb 2017 14:00:51 +0200
Message-ID: <87a89zbkb0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: changbin.du@intel.com, mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 06 Feb 2017, changbin.du@intel.com wrote:
> From: Changbin Du <changbin.du@intel.com>
>
> Prompt user how to quickly jump to the item he/she is interested in.

:o

All these years. I... I didn't know. Thanks!

> Signed-off-by: Changbin Du <changbin.du@intel.com>
> ---
>  scripts/kconfig/mconf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 315ce2c..23d5681 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -443,10 +443,10 @@ static void search_conf(void)
>  
>  		res = get_relations_str(sym_arr, &head);
>  		set_subtitle();
> -		dres = show_textbox_ext(_("Search Results"), (char *)
> -					str_get(&res), 0, 0, keys, &vscroll,
> -					&hscroll, &update_text, (void *)
> -					&data);
> +		dres = show_textbox_ext(
> +				_("Search Results (type the number to jump)"),
> +				(char *)str_get(&res), 0, 0, keys, &vscroll,
> +				&hscroll, &update_text, (void *)&data);

It would be even better and discoverable if this could be turned into a
dialog menu, so that you could navigate the search results using arrow
keys and hit enter to choose. But this is already an improvement.

>  		again = false;
>  		for (i = 0; i < JUMP_NB && keys[i]; i++)
>  			if (dres == keys[i]) {

-- 
Jani Nikula, Intel Open Source Technology Center
