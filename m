Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:37412 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755270AbbJ1Cq1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 22:46:27 -0400
Received: by wmff134 with SMTP id f134so3306425wmf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 19:46:26 -0700 (PDT)
Date: Wed, 28 Oct 2015 03:38:13 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH v2 1/1] kconfig: menuconfig make "selected by:" readable
Message-ID: <20151028023812.GA27149@t61>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <1444249244-4592-1-git-send-email-petr.vorel@gmail.com>
 <1445245133.2581.22.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445245133.2581.22.camel@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> You want to have that line there because the above text will be dropped
> by the git tools (because it comes are after a --- marker, which signals
> "end of commit explanation"). Note that the text, which I think was
> written by me, was basically a comment. Ie, because it came after that
> marker I used it to say things that I thought were not appropriate for a
> commit explanation.
Thanks for explanation, I'll fix my Signed-off-by: in v3. And also clean up comments.

> > --- a/scripts/kconfig/expr.c
> > +++ b/scripts/kconfig/expr.c
> > @@ -1070,7 +1070,7 @@ struct expr *expr_simplify_unmet_dep(struct expr

> > -void expr_print(struct expr *e, void (*fn)(void *, struct symbol *,
> > const char *), void *data, int prevtoken)
> > +static void expr_print_impl(struct expr *e, void (*fn)(void *, struct

> What does _impl stand for?
_impl is for implementation. I didn't want to add new parameter which is meaningless to
most of expr_print() calls, so I created wrapper function. Ugly approach, I know.

> > @@ -1125,9 +1125,12 @@ void expr_print(struct expr *e, void (*fn)(void

> >  	case E_OR:
> > -		expr_print(e->left.expr, fn, data, E_OR);
> > -		fn(data, NULL, " || ");
> > -		expr_print(e->right.expr, fn, data, E_OR);
> > +		expr_print_impl(e->left.expr, fn, data, E_OR,
> revdep);
> > +		if (revdep)
> > +			fn(data, NULL, "\n  - ");
> > +		else
> > +			fn(data, NULL, " || ");
> > +		expr_print_impl(e->right.expr, fn, data, E_OR,
> revdep);

> >  		break;
> >  	case E_AND:
> >  		expr_print(e->left.expr, fn, data, E_AND);

> Lazy question: will the "-" only be printed for the _top level_ E_OR
> expressions in "Selected by:" lines?
Well, I don't check for it in the code. But IMHO all non top level E_OR expressions are in
parentheses, which aren't split by "-". So, yes.
Anyway, do you have an example of non top level E_OR, which is not in parentheses?

Kind regards,
Petr
