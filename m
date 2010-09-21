Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52634 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757980Ab0IUQqt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 12:46:49 -0400
Received: by wyf22 with SMTP id 22so5584537wyf.19
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Sep 2010 09:46:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	<AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	<1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
	<AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
	<tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
Date: Tue, 21 Sep 2010 12:46:47 -0400
Message-ID: <AANLkTi=2JjY_0FwkMgDqpR3uOVci5Ljc1WswgmShBs+U@mail.gmail.com>
Subject: Re: Stale expression reference causing use-after-free
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hi,

On Tue, Sep 21, 2010 at 12:22 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> Arnaud Lacombe <lacombar@gmail.com> wrote:
>> On Tue, Sep 21, 2010 at 8:32 AM, Catalin Marinas
>> <catalin.marinas@arm.com> wrote:
>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>
>>> Commit 246cf9c26b introduced the tracking of direct dependency to
>>> provide additional warning when they are not met. With some complex
>>> dependencies, the expr_copy() function called on such expressions may
>>> cause stack exhaustion. The patch removes the superfluous expr_copy()
>>> call since expr_transform handles symbol duplication already.
>>
>> I'm afraid this is just moving the problem from expr_copy() to
>> expr_transform() as the first thing the latter do is to recurse. on
>> the sub-expressions. I'm not sure that the expression causing the
>> stack exhaustion is even correct, or its reference is still valid.
>
> It may actually be just accessing freed symbols and the data being
> corrupted in ends up in a loop. You Kconfig example doesn't seem to have
> any dependency loops that would cause such problems.
>
exactly.

> Does the patch below make it any better (together with the previous
> one)?
>
just this one is enough. I added back the memory poisoning in
expr_free() and did not get any message of invalid expression.

Michal, should all the weak warning "can't copy/free expr" be replaced
by more aggressive abort() by dropping a few EXPR_CHECK() in expr.c ?

>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 7298806..e707aa2 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -107,7 +107,9 @@ static struct expr *menu_check_dep(struct expr *e)
>  void menu_add_dep(struct expr *dep)
>  {
>        current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
> -       current_entry->dir_dep = current_entry->dep;
> +       if (current_entry->dir_dep)
> +               expr_free(current_entry->dir_dep);
the test is not needed, expr_free() will return immediately if (e == NULL).

> +       current_entry->dir_dep = expr_copy(current_entry->dep);
FYI, just this line makes the crash disappear, still I understand the
expr_free(). However, wouldn't there be a better place to initialize
`dir_dep' and avoid the need to use expr_free() ?

Thanks,
 - Arnaud
