Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38278 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbfIGF2U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Sep 2019 01:28:20 -0400
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
From: Denis Efremov <efremov@linux.com>
References: <20190906151059.1077708-1-arnd@arndb.de>
 <7fc19dd4-93fb-fa15-3d36-3079cd42cf7c@linux.com>
Message-ID: <17ee4877-d24a-12ad-5836-411e3e525933@linux.com>
Date: Sat, 7 Sep 2019 08:28:15 +0300
MIME-Version: 1.0
In-Reply-To: <7fc19dd4-93fb-fa15-3d36-3079cd42cf7c@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sam Ravnborg <sam@ravnborg.org>, WANG Chao <chao.wang@ucloud.cn>, Sami Tolvanen <samitolvanen@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org



On 07.09.2019 01:39, Denis Efremov wrote:
> Hi,
> 
> On 06.09.2019 18:10, Arnd Bergmann wrote:
>> On architectures such as ARM that have a list of symbols exported from
>> assembler in a separate C file, we get a lot of new warnings:
>>
>> WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
>> WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
>> WARNING: "__udivsi3" [vmlinux] is a static (unknown)
>> WARNING: "_change_bit" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
>> WARNING: "__umodsi3" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
>> WARNING: "__muldi3" [vmlinux] is a static (unknown)
>> WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
>> WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
>> WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
>> ...
>>
>> This is not helpful, as these are clearly not static symbols
>> at all. Suppress the warning in a case like this.
>>
> 
> It looks very similar to this discussion https://lkml.org/lkml/2019/7/30/112
> 
> Could you please write the steps to reproduce the warnings?
> Now, I'm trying to build linux-next (host Ubuntu 19.04 x86_64) with:
> $ make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
> But I can't get these warnings.

Tried defconfig, allyesconfig.
 
> 
> I would like to check the type of this asm symbols. It seems like they
> are STT_NOTYPE. In this case the fix could also involve ELF_ST_TYPE check.
> 

Ah, I forgot that we don't check the type at all, so this is not the case.
But still, I would like to test what if the remove binding check at all?
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 76c221dd9b2b..97dbcebf2338 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1987,14 +1987,12 @@ static void read_symbols(const char *modname)
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		unsigned char bind = ELF_ST_BIND(sym->st_info);
 
-		if (bind == STB_GLOBAL || bind == STB_WEAK) {
 			struct symbol *s =
 				find_symbol(remove_dot(info.strtab +
 						       sym->st_name));
 
 			if (s)
 				s->is_static = 0;
-		}
 	}
 
 	if (!is_vmlinux(modname) || vmlinux_section_warnings)


Thanks,
Denis

> 
>> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  scripts/mod/modpost.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index 76c221dd9b2b..4265dd924933 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
>>  		struct symbol *s = symbolhash[n];
>>  
>>  		while (s) {
>> -			if (s->is_static)
>> +			if (s->is_static && s->export != export_unknown)
>>  				warn("\"%s\" [%s] is a static %s\n",
>>  				     s->name, s->module->name,
>>  				     export_str(s->export));
>>
