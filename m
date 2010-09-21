Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:52147 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754985Ab0IURDo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 13:03:44 -0400
Subject: Re: Stale expression reference causing use-after-free
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <AANLkTi=LceTkH+PsWg4ORMPO33c=sdY9nA3NA102DK9L@mail.gmail.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	 <AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	 <1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
	 <AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
	 <tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
	 <AANLkTi=2JjY_0FwkMgDqpR3uOVci5Ljc1WswgmShBs+U@mail.gmail.com>
	 <tnxpqw7hw8b.fsf@e102109-lin.cambridge.arm.com>
	 <AANLkTi=LceTkH+PsWg4ORMPO33c=sdY9nA3NA102DK9L@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Sep 2010 18:03:39 +0100
Message-ID: <1285088619.12653.22.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: "mmarek@suse.cz" <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Tue, 2010-09-21 at 12:57 -0400, Arnaud Lacombe wrote:
> On Tue, Sep 21, 2010 at 12:55 PM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > Arnaud Lacombe <lacombar@gmail.com> wrote:
> >> FYI, just this line makes the crash disappear, still I understand the
> >> expr_free(). However, wouldn't there be a better place to initialize
> >> `dir_dep' and avoid the need to use expr_free() ?
> >
> > dir_dep would need to be initialised somewhere, unless there is a memset
> > on the whole structure (I'm not familiar enough with kbuild). But I
> > think we still need the expr_free() in case dir_dep gets overwritten
> > (e.g. multiple 'depends on' lines where the full expression is re-built
> > on the previous line via expr_alloc_and()).
> 
> this is a huge shoot in the dark, but does not seem to cause any regression:
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 23acbdb..9eee093 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -107,7 +107,6 @@ static struct expr *menu_check_dep(struct expr *e)
>  void menu_add_dep(struct expr *dep)
>  {
>         current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
> -       current_entry->dir_dep = current_entry->dep;
>  }
> 
>  void menu_set_type(int type)
> @@ -268,6 +267,7 @@ void menu_finalize(struct menu *parent)
>                         basedep = expr_alloc_and(expr_copy(parentdep), basedep);
>                         basedep = expr_eliminate_dups(basedep);
>                         menu->dep = basedep;
> +                       menu->dir_dep = expr_copy(basedep);
>                         if (menu->sym)
>                                 prop = menu->sym->prop;
>                         else

I'm not sure this would have the same effect as what I intended. The
dir_dep should only store the "depends on" clauses but the basedep at
this point may include some "select" clauses as well.

Thinking about it, my original patch may not be fully correct. Maybe
something like below:


diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 7298806..e43d8d0 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -107,7 +107,8 @@ static struct expr *menu_check_dep(struct expr *e)
 void menu_add_dep(struct expr *dep)
 {
 	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
-	current_entry->dir_dep = current_entry->dep;
+	current_entry->dir_dep = expr_alloc_and(current_entry->dir_dep,
+						menu_check_dep(dep));
 }
 
 void menu_set_type(int type)


-- 
Catalin

