Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:45496 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752061AbdBHIIB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Feb 2017 03:08:01 -0500
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/2] kconfig/mconf: add jumping tip in title of search result textbox
In-Reply-To: <20170208030939.10146-2-changbin.du@intel.com>
References: <20170208030939.10146-1-changbin.du@intel.com> <20170208030939.10146-2-changbin.du@intel.com>
Date: Wed, 08 Feb 2017 10:07:58 +0200
Message-ID: <87d1etumu9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: changbin.du@intel.com, mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jim.epost@gmail.com

On Wed, 08 Feb 2017, changbin.du@intel.com wrote:
> From: Changbin Du <changbin.du@intel.com>
>
> Prompt user how to quickly jump to the item he/she is interested in.
>
> Signed-off-by: Changbin Du <changbin.du@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@linux.intel.com>

This is assuming too much... but I looked at it now, and it looks good
to me.

Thanks,
Jani.

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
>  		again = false;
>  		for (i = 0; i < JUMP_NB && keys[i]; i++)
>  			if (dres == keys[i]) {

-- 
Jani Nikula, Intel Open Source Technology Center
