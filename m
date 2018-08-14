Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:44110 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbeHNQio (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 12:38:44 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH 1/2] kconfig: report recursive dependency involving 'imply'
In-Reply-To: <gh8t59utb2.fsf@lena.gouders.net> (Dirk Gouders's message of
        "Tue, 14 Aug 2018 12:38:25 +0200")
References: <1534229021-8056-1-git-send-email-yamada.masahiro@socionext.com>
        <gh8t59utb2.fsf@lena.gouders.net>
Date: Tue, 14 Aug 2018 15:44:39 +0200
Message-ID: <gh4lfxukoo.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org

Dirk Gouders <dirk@gouders.net> writes:

> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> Currently, Kconfig does not report anything about the recursive
>> dependency where 'imply' keywords are involved.
>>
>> [Test Code]
>>
>>   config A
>>           bool "a"
>>
>>   config B
>>           bool "b"
>>           imply A
>>           depends on A
>
> Hello Masahiro,
>
> obviously, it is hard to find a reason why one wants to use dependencies
> like above but I also wonder how e.g. menuconfig handles this case:
>
> First, only "a" is visible, if I then select "a", "b" does not become
> visible but when I then reset "a" to "n", "b" becomes visible.  If I then
> try to select "b", it becomes invisible...
>
> Perhaps it would be better to just error out instead of giving users the
> impression, Kconfig thinks such questionable behavior is OK.
>
> Side note: perhaps, the documentation could be better when it comes to
>            recursive dependencies.  The documentation says "select" and
>            "imply" can be used to specify lower limits whereas direct
>            dependencies specify upper limits for symbol values and with
>            this in mind, one might wonder why it is a problem to work
>            with both limits in a recursive way.
>
>            Not very unlikely that it is just me who still has to
>            understand recursive dependencies or problems with reading
>            English text, though.
>
> What definitely seems to get void with your patches is item c) in
> "Practical solutions to kconfig recursive issue" in
> Documentation/kbuild/kconfig-language:
>
>         c) Consider the use of "imply" instead of "select"

Just some more information that adds to me feeling unsure about the
correct definition of recursive dependencies:

With commit 29c434f367ea (kconfig: tests: test if recursive dependencies
are detected) a test case similar to the example above was introduced,
explicitely stating it is _no_ recursive dependency:

+# depends on and imply
+# This is not recursive dependency
+
+config E1
+       bool "E1"
+       depends on E2
+       imply E2
+
+config E2
+       bool "E2"


Dirk

>
>> In the code above, Kconfig cannot calculate the symbol values correctly
>> due to the circular dependency.  For example, allyesconfig followed by
>> syncconfig results in an odd behavior because CONFIG_B becomes visible
>> in syncconfig.
>>
>>   $ make allyesconfig
>>   scripts/kconfig/conf  --allyesconfig Kconfig
>>   #
>>   # configuration written to .config
>>   #
>>   $ cat .config
>>   #
>>   # Automatically generated file; DO NOT EDIT.
>>   # Main menu
>>   #
>>   CONFIG_A=y
>>   $ make syncconfig
>>   scripts/kconfig/conf  --syncconfig Kconfig
>>   *
>>   * Restart config...
>>   *
>>   *
>>   * Main menu
>>   *
>>   a (A) [Y/n/?] y
>>     b (B) [N/y/?] (NEW)
>>
>> To report this correctly, sym_check_expr_deps() should recurse to
>> not only sym->rev_dep.expr but also sym->implied.expr .
>>
>> At this moment, sym_check_print_recursive() cannot distinguish
>> 'select' and 'imply' since it does not know the precise context
>> where the recursive dependency is hit.  This will be solved by
>> the next commit.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  scripts/kconfig/symbol.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>> index 4ec8b1f..7de7463a 100644
>> --- a/scripts/kconfig/symbol.c
>> +++ b/scripts/kconfig/symbol.c
>> @@ -1098,7 +1098,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
>>  				sym->name ? sym->name : "<choice>",
>>  				next_sym->name ? next_sym->name : "<choice>");
>>  		} else {
>> -			fprintf(stderr, "%s:%d:\tsymbol %s is selected by %s\n",
>> +			fprintf(stderr, "%s:%d:\tsymbol %s is selected or implied by %s\n",
>>  				prop->file->name, prop->lineno,
>>  				sym->name ? sym->name : "<choice>",
>>  				next_sym->name ? next_sym->name : "<choice>");
>> @@ -1161,8 +1161,13 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
>>  	if (sym2)
>>  		goto out;
>>  
>> +	sym2 = sym_check_expr_deps(sym->implied.expr);
>> +	if (sym2)
>> +		goto out;
>> +
>>  	for (prop = sym->prop; prop; prop = prop->next) {
>> -		if (prop->type == P_CHOICE || prop->type == P_SELECT)
>> +		if (prop->type == P_CHOICE || prop->type == P_SELECT ||
>> +		    prop->type == P_IMPLY)
>>  			continue;
>>  		stack.prop = prop;
>>  		sym2 = sym_check_expr_deps(prop->visible.expr);
