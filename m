Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:16825 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932772Ab1ESQNZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 May 2011 12:13:25 -0400
Date: Thu, 19 May 2011 09:13:09 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 1/2] gconfig: enable rules hint for main treeviews
Message-Id: <20110519091309.ebeacbfb.randy.dunlap@oracle.com>
In-Reply-To: <1305808621.11775.3.camel@monotop>
References: <1305808621.11775.3.camel@monotop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eduardo Silva <edsiper@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 19 May 2011 08:37:01 -0400 Eduardo Silva wrote:

> Due to the large amount of rows in the treeviews, is difficult to
> match columns with rows, setting the rules hint to 'true' allows the
> treeview to alternate background colors in the rows making the data
> more readable.
> 
> Signed-off-by: Eduardo Silva <edsiper@gmail.com>

Tested-by: Randy Dunlap <randy.dunlap@oracle.com>

Nice.  Thanks.


> ---
>  scripts/kconfig/gconf.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 4558961..0c8db7d 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -253,7 +253,7 @@ void init_left_tree(void)
>  
>  	gtk_tree_view_set_model(view, model1);
>  	gtk_tree_view_set_headers_visible(view, TRUE);
> -	gtk_tree_view_set_rules_hint(view, FALSE);
> +	gtk_tree_view_set_rules_hint(view, TRUE);
>  
>  	column = gtk_tree_view_column_new();
>  	gtk_tree_view_append_column(view, column);
> @@ -298,7 +298,7 @@ void init_right_tree(void)
>  
>  	gtk_tree_view_set_model(view, model2);
>  	gtk_tree_view_set_headers_visible(view, TRUE);
> -	gtk_tree_view_set_rules_hint(view, FALSE);
> +	gtk_tree_view_set_rules_hint(view, TRUE);
>  
>  	column = gtk_tree_view_column_new();
>  	gtk_tree_view_append_column(view, column);
> -- 

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
