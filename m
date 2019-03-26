Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47302 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726207AbfCZUOH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Mar 2019 16:14:07 -0400
Subject: Re: [PATCH v2 3/8] livepatch: Add klp-convert tool
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-4-jmoreira@suse.de> <20190318192011.GA23157@redhat.com>
 <alpine.LSU.2.21.1903202021570.29796@pobox.suse.cz>
From: Joao Moreira <jmoreira@suse.de>
Message-ID: <04f6c9c4-88c6-41b3-fbf8-2409b3822e0b@suse.de>
Date: Tue, 26 Mar 2019 17:13:57 -0300
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1903202021570.29796@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>
Cc: live-patching@vger.kernel.org, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net



On 3/20/19 4:36 PM, Miroslav Benes wrote:
>>> [ ... snip ... ]
>>> +
>>> +/* Checks if sympos is valid, otherwise prints valid sympos list */
>>> +static bool valid_sympos(struct sympos *sp)
>>> +{
>>> +	struct symbol_entry *e;
>>> +	int counter = 0;
>>> +
>>> +	list_for_each_entry(e, &symbols, list) {
>>> +		if ((strcmp(e->symbol_name, sp->symbol_name) == 0) &&
>>> +		    (strcmp(e->object_name, sp->object_name) == 0)) {
>>> +			if (counter == sp->pos)
>>> +				return true;
>>> +			counter++;
>>> +		}
>>> +	}
>>> +
>>> +	WARN("Provided KLP_SYMPOS does not match a symbol: %s.%s,%d",
>>> +			sp->object_name, sp->symbol_name, sp->pos);
>>> +	print_valid_module_relocs(sp->symbol_name);
>>> +
>>> +	return false;
>>> +}
>>
>> I believe there is an off-by-one error condition either here, or in
>> livepatch kernel core sympos disambiguator code (in which case, external
>> tools like kpatch-build would also need to be adjusted).
>>
>> The scenarios that I've observed using klp-convert and kpatch-build:
>>
>>    sympos == 0, uniquely named symbol
>>    sympos == 1, non-unique symbol name, first instance
>>    sympos == 2, non-unique symbol name, second instance
>>    ...
> 
> Yes, that is exactly how we defined it back then.
>   
>> When I built a klp-convert selftest, I made sure that the target module
>> contained multiple symbols of the same name across two .o files.
>> However, when I tried to use a KLP_MODULE_RELOC annotation in the
>> livepatch to resolve to the second (ie, last) symbol, using a sympos=2,
>> klp-convert kept telling me that the only valid KLP_SYMPOS were 0 and 1.
>>
>> The following code adjusts klp-convert to match the sympos logic, as I
>> understand it in livepatch/core.c and kpatch-build;
>>
>>    [squash] livepatch/klp-convert: fix klp-convert off-by-one sympos
>>    https://github.com/torvalds/linux/commit/1ed8e5baa98f7920bbbaa562278b3ed44552e01f
>>
>> This change also adds a check that sympos == 0 is in fact a uniquely
>> named symbol.
> 

Nice catch, thanks for it. All looks good to me.

> Looks good to me. Maybe we can even make it simpler and use similar
> approach as in klp_find_callback() and klp_find_object_symbol() from
> kernel/livepatch/core.c. On the other hand, given that we want to print
> useful output in all cases, the code might happen to be more complicated
> and definitely ugly.

I don't have an opinion here.

>   
>>> [ ... snip ... ]
>>> +
>>> +int main(int argc, const char **argv)
>>> +{
>>> +	const char *klp_in_module, *klp_out_module, *symbols_list;
>>> +	struct rela *rela, *tmprela;
>>> +	struct section *sec, *aux;
>>> +	struct sympos sp;
>>> +	struct elf *klp_elf;
>>> +
>>> +	if (argc != 4) {
>>> +		WARN("Usage: %s <Symbols.list> <input.ko> <out.ko>", argv[0]);
>>> +		return -1;
>>> +	}
>>> +
>>> +	symbols_list = argv[1];
>>> +	klp_in_module = argv[2];
>>> +	klp_out_module = argv[3];
>>> +
>>> +	klp_elf = elf_open(klp_in_module);
>>> +	if (!klp_elf) {
>>> +		WARN("Unable to read elf file %s\n", klp_in_module);
>>> +		return -1;
>>> +	}
>>> +
>>> +	if (!load_syms_lists(symbols_list))
>>> +		return -1;
>>> +
>>> +	if (!load_usr_symbols(klp_elf)) {
>>> +		WARN("Unable to load user-provided sympos");
>>> +		return -1;
>>> +	}
>>> +
>>> +	list_for_each_entry_safe(sec, aux, &klp_elf->sections, list) {
>>> +		if (!is_rela_section(sec))
>>> +			continue;
>>> +
>>> +		list_for_each_entry_safe(rela, tmprela, &sec->relas, list) {
>>> +			if (!must_convert(rela->sym))
>>> +				continue;
>>> +
>>> +			if (!find_missing_position(rela->sym, &sp)) {
>>> +				WARN("Unable to find missing symbol");
>>
>> A really minor suggestion, but I found it useful to tell the user
>> exactly which symbol was missing:
>>
>>    [squash] livepatch/klp-convert: add missing symbol name to warning
>>    https://github.com/torvalds/linux/commit/7a41a8f3d9b9e11f0c75914cb925af1486c1ecc6
> 
> I think that Joao has exactly the same hunk staged somewhere
> already. You are right. The message is not much informative.
> 

Yes, someone had the same idea for the klp-convert which we use inside 
SUSE. But it did not make it to this patch-set.

Nice that Joe added it here :)

> Miroslav
> 
