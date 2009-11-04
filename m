Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:51208 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbZKDJpk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 04:45:40 -0500
Message-ID: <4AF14D45.4020804@tuffmail.co.uk>
Date: Wed, 04 Nov 2009 09:45:41 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 06/10] module: refactor symbol tables and try to reduce
 code size of each_symbol()
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <1257242782-10496-7-git-send-email-alan-jenkins@tuffmail.co.uk> <200911041858.28285.rusty@rustcorp.com.au>
In-Reply-To: <200911041858.28285.rusty@rustcorp.com.au>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org

Rusty Russell wrote:
>> +typedef bool each_symbol_fn_t (enum export_type type,
>> +			       const struct kernel_symbol *sym,
>> +			       const unsigned long *crc,
>> +			       struct module *owner,
>> +			       void *data);
>> +
>>  /* Walk the exported symbol table */
>> -bool each_symbol(bool (*fn)(const struct symsearch *arr, struct module *owner,
>> -			    unsigned int symnum, void *data), void *data);
>> +bool each_symbol(each_symbol_fn_t *fn, void *data);
>>     
>
> I really hate throwaway typedefs like this.  But it's used in two other
> places, so I'll suppress my distaste :)
>   

"const struct kernel_symbol *sym" was pushing lines over 80 columns in 
those other two places.


>> +static struct ksymtab ksymtab[EXPORT_TYPE_MAX];
>> +
>> +static int __init init_ksymtab(void)
>> +{
>> +	struct ksymtab tmp[EXPORT_TYPE_MAX] = {
>> +		[EXPORT_TYPE_PLAIN] = {
>> +			__start___ksymtab, __start___kcrctab,
>> +			__stop___ksymtab - __start___ksymtab,
>> +		},
>>     

>> +	};
>> +
>> +	memcpy(ksymtab, tmp, sizeof(ksymtab));
>>     
>
> This works, but I'd prefer you to open-code the assignments.  Simpler and
> marginally more efficient.
>   

Ok.

>> @@ -322,9 +322,9 @@ static bool find_symbol_in_section(const struct symsearch *syms,
>>  	}
>>  #endif
>>  
>> +	fsa->sym = sym;
>> +	fsa->crc = crc;
>>  	fsa->owner = owner;
>> -	fsa->crc = symversion(syms->crcs, symnum);
>> -	fsa->sym = &syms->start[symnum];
>>  	return true;
>>     
>
> Strange gratuitous reorder here?
>
>   

I can't see why I did that either.  I'll put it back in the original order.

>> +static const char *export_section_names[EXPORT_TYPE_MAX] = {
>> +	[EXPORT_TYPE_PLAIN] = "__ksymtab",
>> +	[EXPORT_TYPE_GPL] = "__ksymtab_gpl",
>> +#ifdef CONFIG_UNUSED_SYMBOLS
>> +	[EXPORT_TYPE_UNUSED] = "__ksymtab_unused",
>> +	[EXPORT_TYPE_UNUSED_GPL] = "__ksymtab_unused_gpl",
>> +#endif
>> +	[EXPORT_TYPE_GPL_FUTURE] = "__ksymtab_gpl_future",
>> +};
>> +
>> +static const char *crc_section_names[EXPORT_TYPE_MAX] = {
>> +	[EXPORT_TYPE_PLAIN] = "__kcrctab",
>> +	[EXPORT_TYPE_GPL] = "__kcrctab_gpl",
>> +#ifdef CONFIG_UNUSED_SYMBOLS
>> +	[EXPORT_TYPE_UNUSED] = "__kcrctab_unused",
>> +	[EXPORT_TYPE_UNUSED_GPL] = "__kcrctab_unused_gpl",
>> +#endif
>> +	[EXPORT_TYPE_GPL_FUTURE] = "__kcrctab_gpl_future",
>> +};
>>     
>
> You can use [] here for size instead of explicit EXPORT_TYPE_MAX.  We should
> have named these sections better :(
>
>   
>> +	for (export_type = 0; export_type < EXPORT_TYPE_MAX; export_type++) {
>>     
>
> Then use ARRAY_SIZE(export_section_names) here.
>
>   
>> +	for (export_type = 0; export_type < EXPORT_TYPE_MAX; export_type++) {
>> +		if (mod->syms[export_type].syms &&
>>     
>
> Similar ARRAY_SIZE(mod->syms).  It's less indirect, IMHO.
>   

The idea was to highlight EXPORT_TYPE when the loop variable is 
shortened to the less obvious "type".  But that only affects two sites 
(in patch 9), and in both cases it's fairly easy to see the definition

enum export_type type;

so on balance I have to agree.  I'll switch to using ARRAY_SIZE() 
throughout.

> But all minor nitpicks; code is excellent!
>
> Thanks,
> Rusty.
>   

Thanks for the close review
Alan
