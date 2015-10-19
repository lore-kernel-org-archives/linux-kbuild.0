Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv-mh.provo.novell.com ([137.65.248.74]:37594 "EHLO
	prv-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752763AbbJSO5m convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:5:1>);
	Mon, 19 Oct 2015 10:57:42 -0400
Message-Id: <5625210102000078000AC6EA@prv-mh.provo.novell.com>
Date: Mon, 19 Oct 2015 08:57:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] kconfig: Fix copy&paste error
References: <1445266262-14082-1-git-send-email-sojkam1@fel.cvut.cz>
In-Reply-To: <1445266262-14082-1-git-send-email-sojkam1@fel.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Sojka <sojkam1@fel.cvut.cz>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, trivial@kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Walch <walch.martin@web.de>

>>> On 19.10.15 at 16:51, <sojkam1@fel.cvut.cz> wrote:
> Signed-off-by: Michal Sojka <sojkam1@fel.cvut.cz>

Oops - yes of course. Thanks.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1113,7 +1113,7 @@ void expr_print(struct expr *e, void (*fn)(void *, 
> struct symbol *, const char *
>  			fn(data, e->left.sym, e->left.sym->name);
>  		else
>  			fn(data, NULL, "<choice>");
> -		fn(data, NULL, e->type == E_LEQ ? ">=" : ">");
> +		fn(data, NULL, e->type == E_GEQ ? ">=" : ">");
>  		fn(data, e->right.sym, e->right.sym->name);
>  		break;
>  	case E_UNEQUAL:



