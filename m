Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:51797 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752531Ab0IUQz4 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 12:55:56 -0400
From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Stale expression reference causing use-after-free
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	<AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	<1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
	<AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
	<tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
	<AANLkTi=2JjY_0FwkMgDqpR3uOVci5Ljc1WswgmShBs+U@mail.gmail.com>
Date: Tue, 21 Sep 2010 17:55:48 +0100
In-Reply-To: <AANLkTi=2JjY_0FwkMgDqpR3uOVci5Ljc1WswgmShBs+U@mail.gmail.com>
	(Arnaud Lacombe's message of "Tue, 21 Sep 2010 12:46:47 -0400")
Message-ID: <tnxpqw7hw8b.fsf@e102109-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Arnaud Lacombe <lacombar@gmail.com> wrote:
> On Tue, Sep 21, 2010 at 12:22 PM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
>> Arnaud Lacombe <lacombar@gmail.com> wrote:
>>> On Tue, Sep 21, 2010 at 8:32 AM, Catalin Marinas
>>> <catalin.marinas@arm.com> wrote:
>>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>>
>>>> Commit 246cf9c26b introduced the tracking of direct dependency to
>>>> provide additional warning when they are not met. With some complex
>>>> dependencies, the expr_copy() function called on such expressions may
>>>> cause stack exhaustion. The patch removes the superfluous expr_copy()
>>>> call since expr_transform handles symbol duplication already.
[...]
>> Does the patch below make it any better (together with the previous
>> one)?
>>
> just this one is enough. I added back the memory poisoning in
> expr_free() and did not get any message of invalid expression.

Thanks for testing. I would add the other patch as well, maybe as a
separate one since it's a clean-up.

>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index 7298806..e707aa2 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -107,7 +107,9 @@ static struct expr *menu_check_dep(struct expr *e)
>>  void menu_add_dep(struct expr *dep)
>>  {
>>        current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
>> -       current_entry->dir_dep = current_entry->dep;
>> +       if (current_entry->dir_dep)
>> +               expr_free(current_entry->dir_dep);
> the test is not needed, expr_free() will return immediately if (e == NULL).
>
>> +       current_entry->dir_dep = expr_copy(current_entry->dep);
> 
> FYI, just this line makes the crash disappear, still I understand the
> expr_free(). However, wouldn't there be a better place to initialize
> `dir_dep' and avoid the need to use expr_free() ?

dir_dep would need to be initialised somewhere, unless there is a memset
on the whole structure (I'm not familiar enough with kbuild). But I
think we still need the expr_free() in case dir_dep gets overwritten
(e.g. multiple 'depends on' lines where the full expression is re-built
on the previous line via expr_alloc_and()).

I'll post some patches tomorrow to be reviewed (have to go now).

-- 
Catalin
