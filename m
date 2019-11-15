Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:39137 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727097AbfKOJp5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 04:45:57 -0500
Subject: Re: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort
 concurrently
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
 <20191115091945.GT4114@hirez.programming.kicks-ass.net>
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <2a6aa1ca-f26b-3dfd-ecbf-61e37a2a8242@linux.alibaba.com>
Date: Fri, 15 Nov 2019 17:45:50 +0800
MIME-Version: 1.0
In-Reply-To: <20191115091945.GT4114@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org



On 2019/11/15 17:19, Peter Zijlstra wrote:
> On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:
>
>> @@ -141,21 +306,44 @@ static int do_sort(Elf_Ehdr *ehdr,
>>   		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
>>   			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
>>   						      _r(&s->sh_offset));
>> -	}
>>   
>> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
>> +		/* locate the ORC unwind tables */
>> +		if (!strcmp(secstrings + idx, ".orc_unwind_ip")) {
>> +			orctable.orc_ip_size = s->sh_size;
>> +			g_orc_ip_table = (int *)((void *)ehdr +
>> +						   s->sh_offset);
>> +		}
>> +		if (!strcmp(secstrings + idx, ".orc_unwind")) {
>> +			orctable.orc_size = s->sh_size;
>> +			g_orc_table = (struct orc_entry *)((void *)ehdr +
>> +							     s->sh_offset);
>> +		}
>> +#endif
>> +	} /* for loop */
>> +
>> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
> Maybe something like:
>
> 	if (g_orc_table && g_orc_ip_table) {
> 		 if (pthread_create(...))
> 		...
> 	} else if (g_orc_table || g_orc_up_table) {
> 		fprintf(stderr, "incomplete ORC tables...\n");
> 	}
>
>> +	/* create thread to sort ORC unwind tables concurrently */
>> +	if (pthread_create(&orc_sort_thread, NULL, sort_orctable, &orctable)) {
>> +		fprintf(stderr,
>> +			"pthread_create orc_sort_thread failed '%s': %s\n",
>> +			strerror(errno), fname);
>> +		goto out;
>> +	}
>> +#endif
>>   	if (!extab_sec) {
>>   		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
>> -		return -1;
>> +		goto out;
>>   	}
>>   
>>   	if (!symtab_sec) {
>>   		fprintf(stderr,	"no .symtab in file: %s\n", fname);
>> -		return -1;
>> +		goto out;
>>   	}
>>   
>>   	if (!strtab_sec) {
>>   		fprintf(stderr,	"no .strtab in file: %s\n", fname);
>> -		return -1;
>> +		goto out;
>>   	}
>>   
>>   	extab_image = (void *)ehdr + _r(&extab_sec->sh_offset);
>> @@ -192,7 +380,7 @@ static int do_sort(Elf_Ehdr *ehdr,
>>   		fprintf(stderr,
>>   			"no main_extable_sort_needed symbol in file: %s\n",
>>   			fname);
>> -		return -1;
>> +		goto out;
>>   	}
>>   
>>   	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
>> @@ -205,6 +393,20 @@ static int do_sort(Elf_Ehdr *ehdr,
>>   
>>   	/* extable has been sorted, clear the flag */
>>   	w(0, sort_needed_loc);
>> +	rc = 0;
>>   
>> -	return 0;
>> +out:
>> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
>> +	{ /* to avoid gcc warning about declaration */
>> +	void *retval = NULL;
> and then here:
>
> 	if (orc_sort_thread) {
> 		void *retval = NULL;
> 		pthread_join(...);
> 		...
> 	}


Thank you for your kindly advice! I'll change it in next version.

>> +
>> +	/* wait for ORC tables sort done */
>> +	pthread_join(orc_sort_thread, &retval);
>> +	if (retval) {
>> +		fprintf(stderr, "%s in file: %s\n", (char *)retval, fname);
>> +		rc = -1;
>> +	}
>> +	}
>> +#endif
>> +	return rc;
>>   }
