Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud2.xs4all.net ([194.109.24.25]:39520 "EHLO
	lb2-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753359AbbIRUcx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2015 16:32:53 -0400
Message-ID: <1442608364.9205.31.camel@tiscali.nl>
Subject: Re: [PATCH 1/1] [RFC] kconfig: menuconfig make "Selected by:"
 readable
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 18 Sep 2015 22:32:44 +0200
In-Reply-To: <1442257543-6194-2-git-send-email-petr.vorel@gmail.com>
References: <1442257543-6194-1-git-send-email-petr.vorel@gmail.com>
	 <1442257543-6194-2-git-send-email-petr.vorel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>

On ma, 2015-09-14 at 21:05 +0200, Petr Vorel wrote:
> From: Paul Bolle <pebolle@tiscali.nl>

(Petr and I have been in contact about this patch. The way it's been
resubmitted is a bit odd. That's probably because I didn't give Petr's
queries about my patch the attention they deserved.)

> This is a _hack_ to show what might be a better way to do this.

That's the reason I submitted this as an RFC.

(By now I doubt whether RFC patches are worth the effort. I'm inclined
to think that one might as well send in actual patches. Reviewing RFCs
seems to be about as much work as reviewing real patches. So why bother
reviewing them when the submitter might claim "It's only an RFC!" once
things get serious?)  

> Not-yet-signed-off-by: Paul Bolle <pebolle@tiscali.nl>

I did this for a reason!	

> Tested-by: Petr Vorel <petr.vorel@gmail.com>

(Resubmitting someone else's patch can be the right thing to do. The
patch should be correctly signed off in that case - this patch wasn't! -
and the person resubmitting should sign off too. Petr didn't sign off on
this patch.)

> +static void rev_dep_gstr_print(struct expr *e, struct gstr *gs)
> +{
> +	struct gstr tmp = str_new();
> +	const char *prev, *start;
> +	char *beam;
> +
> +	expr_gstr_print(e, &tmp);

This is the main problem with my RFC. I feel that the right thing for
 rev_dep_gstr_print() would be to work on a struct expr directly,
instead of cheating by using expr_gstr_print()'s output.

Would you mind working on a v2 that tries to do that?

> +	prev = start = str_get(&tmp);
> +
> +	str_append(gs, "\n  - ");
> +
> +	while ((beam = index(start, '|'))) {
> +		char *lparen = index(start, '(');
> +
> +		/* don't split "(I || J)" */
> +		if (lparen && (lparen < beam)) {
> +			const char *rparen = matching_paren(++lparen);
> +
> +			/* skip the expression inside parentheses */
> +			start = ++rparen;
> +			continue;
> +		}
> +
> +		/* we can assume we're fed a sane string, so the space before
> +		 * the beam gets turned into a NUL */
> +		*(beam - 1) = '\0';
> +		str_append(gs, prev);
> +		str_append(gs, "\n  - ");
> +		/* assume sane string, so skip the second beam */
> +		beam++;
> +		/* trim */
> +		while (*++beam == ' ')
> +			;
> +		prev = start = beam;
> +	}
> +
> +	str_append(gs, prev);
> +
> +	str_free(&tmp);
> +}

Thanks,


Paul Bolle
