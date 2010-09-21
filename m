Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:45484 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754323Ab0IUSD2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 14:03:28 -0400
Received: by wwi17 with SMTP id 17so276859wwi.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Sep 2010 11:03:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1285088619.12653.22.camel@e102109-lin.cambridge.arm.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	<AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	<1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
	<AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
	<tnxtyljhxr9.fsf@e102109-lin.cambridge.arm.com>
	<AANLkTi=2JjY_0FwkMgDqpR3uOVci5Ljc1WswgmShBs+U@mail.gmail.com>
	<tnxpqw7hw8b.fsf@e102109-lin.cambridge.arm.com>
	<AANLkTi=LceTkH+PsWg4ORMPO33c=sdY9nA3NA102DK9L@mail.gmail.com>
	<1285088619.12653.22.camel@e102109-lin.cambridge.arm.com>
Date: Tue, 21 Sep 2010 14:03:26 -0400
Message-ID: <AANLkTi=oMniVb8qdwV8u2A=GgbmQRs=yV2V=pa=_O_s8@mail.gmail.com>
Subject: Re: Stale expression reference causing use-after-free
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "mmarek@suse.cz" <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hi,

On Tue, Sep 21, 2010 at 1:03 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Tue, 2010-09-21 at 12:57 -0400, Arnaud Lacombe wrote:
>> On Tue, Sep 21, 2010 at 12:55 PM, Catalin Marinas
>> <catalin.marinas@arm.com> wrote:
>> > Arnaud Lacombe <lacombar@gmail.com> wrote:
>> >> FYI, just this line makes the crash disappear, still I understand the
>> >> expr_free(). However, wouldn't there be a better place to initialize
>> >> `dir_dep' and avoid the need to use expr_free() ?
>> >
>> > dir_dep would need to be initialised somewhere, unless there is a memset
>> > on the whole structure (I'm not familiar enough with kbuild). But I
>> > think we still need the expr_free() in case dir_dep gets overwritten
>> > (e.g. multiple 'depends on' lines where the full expression is re-built
>> > on the previous line via expr_alloc_and()).
>>
>> this is a huge shoot in the dark, but does not seem to cause any regression:
>>
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index 23acbdb..9eee093 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -107,7 +107,6 @@ static struct expr *menu_check_dep(struct expr *e)
>>  void menu_add_dep(struct expr *dep)
>>  {
>>         current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
>> -       current_entry->dir_dep = current_entry->dep;
>>  }
>>
>>  void menu_set_type(int type)
>> @@ -268,6 +267,7 @@ void menu_finalize(struct menu *parent)
>>                         basedep = expr_alloc_and(expr_copy(parentdep), basedep);
>>                         basedep = expr_eliminate_dups(basedep);
>>                         menu->dep = basedep;
>> +                       menu->dir_dep = expr_copy(basedep);
>>                         if (menu->sym)
>>                                 prop = menu->sym->prop;
>>                         else
>
> I'm not sure this would have the same effect as what I intended. The
> dir_dep should only store the "depends on" clauses but the basedep at
> this point may include some "select" clauses as well.
>
I'm not sure of that. "select" statement are appended to the
(selected?) symbol property list and simplified after `basedep' has
been computed, before being assigned to the symbol reverse dependency.
So, as far as I understand, `basedep' dependency's list is free from
any reverse dependency. Maybe a kconfig's guru can confirm. That would
simplify a lot.

> Thinking about it, my original patch may not be fully correct. Maybe
> something like below:
>
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 7298806..e43d8d0 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -107,7 +107,8 @@ static struct expr *menu_check_dep(struct expr *e)
>  void menu_add_dep(struct expr *dep)
>  {
>        current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
> -       current_entry->dir_dep = current_entry->dep;
> +       current_entry->dir_dep = expr_alloc_and(current_entry->dir_dep,
> +                                               menu_check_dep(dep));
>  }
>
This alone re-introduce the use-after-free. I cannot really dig
further right now.

 - Arnaud
