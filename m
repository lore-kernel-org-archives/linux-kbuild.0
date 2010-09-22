Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:57730 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352Ab0IVRcg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Sep 2010 13:32:36 -0400
Received: by wwi17 with SMTP id 17so129876wwi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Sep 2010 10:32:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1285153693.10456.11.camel@e102109-lin.cambridge.arm.com>
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
Date: Wed, 22 Sep 2010 13:32:34 -0400
Message-ID: <AANLkTi=kFJruk_RqJsZCMM8HnuFrb8ZXXavvxpMOg8DE@mail.gmail.com>
Subject: Re: Stale expression reference causing use-after-free
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org

Hi Catalin,

On Wed, Sep 22, 2010 at 7:08 AM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> In your patch, could you also remove the additional expr_copy() when
> transforming dir_dep (my first patch which wasn't solving the problem
> but an extra copy is superfluous).
>
isn't there more superfluous stuff ? The following:

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4fb5902..176618a 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -107,7 +107,6 @@ static struct expr *menu_check_dep(struct expr *e)
 void menu_add_dep(struct expr *dep)
 {
        current_entry->dep = expr_alloc_and(current_entry->dep,
menu_check_dep(dep));
-       current_entry->dir_dep = current_entry->dep;
 }

 void menu_set_type(int type)
@@ -292,8 +291,7 @@ void menu_finalize(struct menu *parent)
                        menu_finalize(menu);
        } else if (sym) {
                /* ignore inherited dependencies for dir_dep */
-               sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
-               sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
+               sym->dir_dep = parent->dep;

                basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
                basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);


still seems not to introduce regression, ie. same output with
`silentoldconfig' based on a `randconfig' with this or with the
previous I submitted. The
"expr_eliminate_dups(expr_transform(parent->dep))" has already been
done when computing `basedep'.

Thanks,
 - Arnaud
