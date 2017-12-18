Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:65518 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751217AbdLRN7g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 08:59:36 -0500
MIME-Version: 1.0
In-Reply-To: <20171215082316.GB26962@osadl.at>
References: <1513281250-9186-1-git-send-email-lukas.bulwahn@gmail.com>
 <1513281250-9186-2-git-send-email-lukas.bulwahn@gmail.com> <20171215082316.GB26962@osadl.at>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Dec 2017 22:58:49 +0900
Message-ID: <CAK7LNAQY74x_c+1VBrjwR_1UvC42Fkr4CuFm7kJrr8c3+qZ5Lw@mail.gmail.com>
Subject: Re: [SIL2review] [PATCH] fixdep: free memory on second error path of do_config_file
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>

2017-12-15 17:23 GMT+09:00 Nicholas Mc Guire <der.herr@hofr.at>:
> On Thu, Dec 14, 2017 at 08:54:10PM +0100, Lukas Bulwahn wrote:
>> Commit dee81e988674 ("fixdep: faster CONFIG_ search") introduces the memory
>> leak when `map = mmap(...)` was replaced with `map = malloc(...)` and
>> `read(fd, map, ...)`. It introduces a new second error path, which does not
>> free the allocated memory for `map`. We now correct that behavior and free
>> `map` before the do_config_file() function returns.
>>
>> Facebook's static analysis tool Infer (http://fbinfer.com) found this
>> memory leak:
>>
>>   scripts/basic/fixdep.c:297: error: MEMORY_LEAK
>>     memory dynamically allocated by call to `malloc()` at line 290, \
>>     column 8 is not reachable after line 297, column 3.
>>
>> Fixes: dee81e988674 ("fixdep: faster CONFIG_ search")
>>
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Reviewed-by: Nicholas Mc Guire <der.herr@hofr.at>
>
>> ---
>>  scripts/basic/fixdep.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
>> index bbf62cb..131c450 100644
>> --- a/scripts/basic/fixdep.c
>> +++ b/scripts/basic/fixdep.c
>> @@ -296,6 +296,7 @@ static void do_config_file(const char *filename)
>>       if (read(fd, map, st.st_size) != st.st_size) {
>>               perror("fixdep: read");
>>               close(fd);
>> +             free(map);
>
>  This looks reasonable but actually it is not clear why do_config_file()
> should return at all if read fails as the read error would go unnoticed
> in the current code and allow the build to continue. so this probably
> should be an exit(2) here and not a return which would then take care
> of the free() anyway.

I agree.

This should be exit(2).

You can also remove close() as well since
the operation system will close it anyway.



>  Atleast I do not see the rational to allow continuation if the read
> failed as the file should not be empty nor a mismatch with st.st_size
> expected. If it were due to a EINTR then it still should terminate as
> EINTR was not handled and we thus could miss a valid dependency.
>
>  Note: this probably also should be applied to the if (!map) condition
> before as well, as at that point it is known that map > 0 and a malloc()
> failure would allow skipping parse_config_file() for a valid config.

I agree.  We should change this too.



-- 
Best Regards
Masahiro Yamada
