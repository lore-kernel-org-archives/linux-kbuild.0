Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:49231 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754417Ab0IUQW6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 12:22:58 -0400
From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Stale expression reference causing use-after-free
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	<AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	<1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
	<AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
Date: Tue, 21 Sep 2010 17:22:50 +0100
In-Reply-To: <AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
	(Arnaud Lacombe's message of "Tue, 21 Sep 2010 10:36:43 -0400")
Message-ID: <tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Arnaud Lacombe <lacombar@gmail.com> wrote:
> On Tue, Sep 21, 2010 at 8:32 AM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>>
>> Commit 246cf9c26b introduced the tracking of direct dependency to
>> provide additional warning when they are not met. With some complex
>> dependencies, the expr_copy() function called on such expressions may
>> cause stack exhaustion. The patch removes the superfluous expr_copy()
>> call since expr_transform handles symbol duplication already.
>
> I'm afraid this is just moving the problem from expr_copy() to
> expr_transform() as the first thing the latter do is to recurse. on
> the sub-expressions. I'm not sure that the expression causing the
> stack exhaustion is even correct, or its reference is still valid.

It may actually be just accessing freed symbols and the data being
corrupted in ends up in a loop. You Kconfig example doesn't seem to have
any dependency loops that would cause such problems.

Does the patch below make it any better (together with the previous
one)?


diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 7298806..e707aa2 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -107,7 +107,9 @@ static struct expr *menu_check_dep(struct expr *e)
 void menu_add_dep(struct expr *dep)
 {
 	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
-	current_entry->dir_dep = current_entry->dep;
+	if (current_entry->dir_dep)
+		expr_free(current_entry->dir_dep);
+	current_entry->dir_dep = expr_copy(current_entry->dep);
 }
 
 void menu_set_type(int type)


Thanks.

-- 
Catalin
