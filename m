Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:37408 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752099Ab0IVLIT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Sep 2010 07:08:19 -0400
Subject: Re: Stale expression reference causing use-after-free
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <AANLkTi=oMniVb8qdwV8u2A=GgbmQRs=yV2V=pa=_O_s8@mail.gmail.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	 <AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	 <1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
	 <AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
	 <tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
	 <AANLkTi=2JjY_0FwkMgDqpR3uOVci5Ljc1WswgmShBs+U@mail.gmail.com>
	 <tnxpqw7hw8b.fsf@e102109-lin.cambridge.arm.com>
	 <AANLkTi=LceTkH+PsWg4ORMPO33c=sdY9nA3NA102DK9L@mail.gmail.com>
	 <1285088619.12653.22.camel@e102109-lin.cambridge.arm.com>
	 <AANLkTi=oMniVb8qdwV8u2A=GgbmQRs=yV2V=pa=_O_s8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Sep 2010 12:08:13 +0100
Message-ID: <1285153693.10456.11.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Tue, 2010-09-21 at 19:03 +0100, Arnaud Lacombe wrote:
> On Tue, Sep 21, 2010 at 1:03 PM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > On Tue, 2010-09-21 at 12:57 -0400, Arnaud Lacombe wrote:
> >> this is a huge shoot in the dark, but does not seem to cause any regression:
> >>
> >> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> >> index 23acbdb..9eee093 100644
> >> --- a/scripts/kconfig/menu.c
> >> +++ b/scripts/kconfig/menu.c
> >> @@ -107,7 +107,6 @@ static struct expr *menu_check_dep(struct expr *e)
> >>  void menu_add_dep(struct expr *dep)
> >>  {
> >>         current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
> >> -       current_entry->dir_dep = current_entry->dep;
> >>  }
> >>
> >>  void menu_set_type(int type)
> >> @@ -268,6 +267,7 @@ void menu_finalize(struct menu *parent)
> >>                         basedep = expr_alloc_and(expr_copy(parentdep), basedep);
> >>                         basedep = expr_eliminate_dups(basedep);
> >>                         menu->dep = basedep;
> >> +                       menu->dir_dep = expr_copy(basedep);
> >>                         if (menu->sym)
> >>                                 prop = menu->sym->prop;
> >>                         else
> >
> > I'm not sure this would have the same effect as what I intended. The
> > dir_dep should only store the "depends on" clauses but the basedep at
> > this point may include some "select" clauses as well.
> 
> I'm not sure of that. "select" statement are appended to the
> (selected?) symbol property list and simplified after `basedep' has
> been computed, before being assigned to the symbol reverse dependency.
> So, as far as I understand, `basedep' dependency's list is free from
> any reverse dependency. Maybe a kconfig's guru can confirm. That would
> simplify a lot.

You may be right. I did some tests and it looks like it indeed does the
trick (warning on selecting symbols with unmet dependencies). You can
submit it with my ack:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

In your patch, could you also remove the additional expr_copy() when
transforming dir_dep (my first patch which wasn't solving the problem
but an extra copy is superfluous).

Thanks.

-- 
Catalin

