Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35064 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdL0Mj5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Dec 2017 07:39:57 -0500
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 27 Dec 2017 13:39:54 +0100 (CET)
Subject: Re: [SIL2review] [PATCH] fixdep: free memory on second error path
 of do_config_file
In-Reply-To: <CAK7LNAQY74x_c+1VBrjwR_1UvC42Fkr4CuFm7kJrr8c3+qZ5Lw@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1712210808110.20260@hsp>
References: <1513281250-9186-1-git-send-email-lukas.bulwahn@gmail.com> <1513281250-9186-2-git-send-email-lukas.bulwahn@gmail.com> <20171215082316.GB26962@osadl.at> <CAK7LNAQY74x_c+1VBrjwR_1UvC42Fkr4CuFm7kJrr8c3+qZ5Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>


On Mon, 18 Dec 2017, Masahiro Yamada wrote:

> 2017-12-15 17:23 GMT+09:00 Nicholas Mc Guire <der.herr@hofr.at>:
>> On Thu, Dec 14, 2017 at 08:54:10PM +0100, Lukas Bulwahn wrote:
>>> Commit dee81e988674 ("fixdep: faster CONFIG_ search") introduces the memory
>>> leak when `map = mmap(...)` was replaced with `map = malloc(...)` and
>>> `read(fd, map, ...)`. It introduces a new second error path, which does not
>>> free the allocated memory for `map`. We now correct that behavior and free
>>> `map` before the do_config_file() function returns.
>>>
>>> Facebook's static analysis tool Infer (http://fbinfer.com) found this
>>> memory leak:
>>>
>>>   scripts/basic/fixdep.c:297: error: MEMORY_LEAK
>>>     memory dynamically allocated by call to `malloc()` at line 290, \
>>>     column 8 is not reachable after line 297, column 3.
>>>
>>> Fixes: dee81e988674 ("fixdep: faster CONFIG_ search")
>>>
>>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> Reviewed-by: Nicholas Mc Guire <der.herr@hofr.at>
>>
>>> ---
>>>  scripts/basic/fixdep.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
>>> index bbf62cb..131c450 100644
>>> --- a/scripts/basic/fixdep.c
>>> +++ b/scripts/basic/fixdep.c
>>> @@ -296,6 +296,7 @@ static void do_config_file(const char *filename)
>>>       if (read(fd, map, st.st_size) != st.st_size) {
>>>               perror("fixdep: read");
>>>               close(fd);
>>> +             free(map);
>>
>>  This looks reasonable but actually it is not clear why do_config_file()
>> should return at all if read fails as the read error would go unnoticed
>> in the current code and allow the build to continue. so this probably
>> should be an exit(2) here and not a return which would then take care
>> of the free() anyway.
>
> I agree.
>
> This should be exit(2).
>
> You can also remove close() as well since
> the operation system will close it anyway.
>
>
>
>>  Atleast I do not see the rational to allow continuation if the read
>> failed as the file should not be empty nor a mismatch with st.st_size
>> expected. If it were due to a EINTR then it still should terminate as
>> EINTR was not handled and we thus could miss a valid dependency.
>>
>>  Note: this probably also should be applied to the if (!map) condition
>> before as well, as at that point it is known that map > 0 and a malloc()
>> failure would allow skipping parse_config_file() for a valid config.
>
> I agree.  We should change this too.
>

I created a new patch with your requested changes, but I did not consider 
it a second version of this patch by the time of writing. You can find the 
new patch at:

v1: https://patchwork.kernel.org/patch/10126547/
v2: https://patchwork.kernel.org/patch/10128297/

This patch here is now superseded by the new patch. So, this patch here 
can be abandoned.

Lukas
