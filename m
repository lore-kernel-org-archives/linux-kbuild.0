Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56488 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728550AbfDXVAw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 17:00:52 -0400
Subject: Re: [PATCH v3 3/9] livepatch: Add klp-convert tool
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190410155058.9437-4-joe.lawrence@redhat.com>
 <20190423203529.GA15743@redhat.com>
 <alpine.LSU.2.21.1904241941230.30239@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <4581c471-e6ac-16a8-1bee-bb03a4476bf6@redhat.com>
Date: Wed, 24 Apr 2019 17:00:50 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1904241941230.30239@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On 4/24/19 1:47 PM, Miroslav Benes wrote:
> On Tue, 23 Apr 2019, Joe Lawrence wrote:
>> diff --git a/scripts/livepatch/klp-convert.c b/scripts/livepatch/klp-convert.c
>> index 82c27d219372..126395f1c0cd 100644
>> --- a/scripts/livepatch/klp-convert.c
>> +++ b/scripts/livepatch/klp-convert.c
>> @@ -517,6 +517,7 @@ static bool convert_rela(struct section *oldsec, struct rela *r,
>>   		if (r1->sym->name == r->sym->name) {
>>   			list_del(&r1->list);
>>   			list_add(&r1->list, &sec->relas);
>> +			break;
>>   		}
>>   	}
>>   	return true;
> 
> Couldn't we remove the loop all together instead of breaking it?
> 
> 	list_del(&r->list);
> 	list_add(&r->list, &sec->relas);
> 
> could be sufficient.

Ah yea, good point.

> 
>> @@ -549,8 +550,8 @@ static bool is_converted(char *sname)
>>   }
>>   
>>   /*
>> - * Checks if symbol must be converted (conditions):
>> - * not resolved, not already converted or isn't an exported symbol
>> + * Checks if symbol must be or was already converted (conditions):
>> + * not resolved or isn't an exported symbol
>>    */
>>   static bool must_convert(struct symbol *sym)
>>   {
>> @@ -566,7 +567,7 @@ static bool must_convert(struct symbol *sym)
>>   	if (strcmp(sym->name, ".TOC.") == 0)
>>   		return false;
>>   
>> -	return (!(is_converted(sym->name) || is_exported(sym->name)));
>> +	return (!is_exported(sym->name));
>>   }
>>   
>>   /* Checks if a section is a klp rela section */
>> @@ -640,7 +641,8 @@ int main(int argc, const char **argv)
>>   			if (!must_convert(rela->sym))
>>   				continue;
>>   
>> -			if (!find_missing_position(rela->sym, &sp)) {
>> +			if (!is_converted(rela->sym->name) &&
>> +			    !find_missing_position(rela->sym, &sp)) {
>>   				WARN("Unable to find missing symbol: %s",
>>   						rela->sym->name);
>>   				return -1;
> 
> Looks good.

There were a few additional spots I needed to update (like main's 
section walk doesn't need to re-convert klp_rela_sections, and likewise, 
convert_rela doesn't need to re-convert_klp_symbol), but I will include 
with v4 for a real review.

Thanks,

-- Joe
