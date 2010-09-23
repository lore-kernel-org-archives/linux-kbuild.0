Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:45535 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753155Ab0IWK6R convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Sep 2010 06:58:17 -0400
Subject: Re: Stale expression reference causing use-after-free
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <AANLkTi=kFJruk_RqJsZCMM8HnuFrb8ZXXavvxpMOg8DE@mail.gmail.com>
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
	 <1285153693.10456.11.camel@e102109-lin.cambridge.arm.com>
	 <AANLkTi=kFJruk_RqJsZCMM8HnuFrb8ZXXavvxpMOg8DE@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 11:58:08 +0100
Message-ID: <1285239489.27572.41.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Wed, 2010-09-22 at 18:32 +0100, Arnaud Lacombe wrote:
> On Wed, Sep 22, 2010 at 7:08 AM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > In your patch, could you also remove the additional expr_copy() when
> > transforming dir_dep (my first patch which wasn't solving the problem
> > but an extra copy is superfluous).
> 
> isn't there more superfluous stuff ? The following:
[...]
> @@ -292,8 +291,7 @@ void menu_finalize(struct menu *parent)
>                         menu_finalize(menu);
>         } else if (sym) {
>                 /* ignore inherited dependencies for dir_dep */
> -               sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
> -               sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
> +               sym->dir_dep = parent->dep;

With this change I get:

/work/Linux/linux-2.6-arm/scripts/kconfig/menu.c: In function ‘menu_finalize’:
/work/Linux/linux-2.6-arm/scripts/kconfig/menu.c:301: error: incompatible types 
	when assigning to type ‘struct expr_value’ from type ‘struct expr *’

-- 
Catalin

