Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:59686 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753922Ab0IUMdH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 08:33:07 -0400
Subject: Re: Stale expression reference causing use-after-free
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	 <AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Sep 2010 13:32:59 +0100
Message-ID: <1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hi Arnaud,

On Sun, 2010-09-19 at 22:54 -0400, Arnaud Lacombe wrote:
> It would seem that this issue is responsible for the crash I've seen
> randomly happening with gconf (2.6.36-rc6, before my generalization's
> branch). So far, I've traced it to the following line in
> menu_finalize():
> 
> sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
> 
> The crash happen in expr_copy(). expr_transform() is never being
> called. The trace is the following:
> 
> Program received signal SIGSEGV, Segmentation fault.
[...]
> so we're dying from stack exhaustion, because expr_copy() is given a
> really nasty symbol:
[...]
> Reverting 246cf9c26bf11f2bffbecea6e5bd222eee7b1df8 fixes the crash.

Thanks for investigating this. The expr_copy() is a recursive function
and it could indeed run out of stack.

I wonder if we really need the expr_copy() here. It looks to me like
expr_transform() already does some memory allocations:


kbuild: Avoid additional copy of the 'depends' expression

From: Catalin Marinas <catalin.marinas@arm.com>

Commit 246cf9c26b introduced the tracking of direct dependency to
provide additional warning when they are not met. With some complex
dependencies, the expr_copy() function called on such expressions may
cause stack exhaustion. The patch removes the superfluous expr_copy()
call since expr_transform handles symbol duplication already.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Reported-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/menu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4fb5902..7298806 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -292,7 +292,7 @@ void menu_finalize(struct menu *parent)
 			menu_finalize(menu);
 	} else if (sym) {
 		/* ignore inherited dependencies for dir_dep */
-		sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
+		sym->dir_dep.expr = expr_transform(parent->dir_dep);
 		sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
 
 		basedep = parent->prompt ? parent->prompt->visible.expr : NULL;


-- 
Catalin

