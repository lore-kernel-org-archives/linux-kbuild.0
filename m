Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 178.115.242.59.static.drei.at ([178.115.242.59]:59151 "EHLO
        mail.osadl.at" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1753312AbdLOIXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 03:23:23 -0500
Date: Fri, 15 Dec 2017 08:23:16 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [SIL2review] [PATCH] fixdep: free memory on second error path of
 do_config_file
Message-ID: <20171215082316.GB26962@osadl.at>
References: <1513281250-9186-1-git-send-email-lukas.bulwahn@gmail.com>
 <1513281250-9186-2-git-send-email-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513281250-9186-2-git-send-email-lukas.bulwahn@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kbuild@vger.kernel.org, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Alexey Dobriyan <adobriyan@gmail.com>

On Thu, Dec 14, 2017 at 08:54:10PM +0100, Lukas Bulwahn wrote:
> Commit dee81e988674 ("fixdep: faster CONFIG_ search") introduces the memory
> leak when `map = mmap(...)` was replaced with `map = malloc(...)` and
> `read(fd, map, ...)`. It introduces a new second error path, which does not
> free the allocated memory for `map`. We now correct that behavior and free
> `map` before the do_config_file() function returns.
> 
> Facebook's static analysis tool Infer (http://fbinfer.com) found this
> memory leak:
> 
>   scripts/basic/fixdep.c:297: error: MEMORY_LEAK
>     memory dynamically allocated by call to `malloc()` at line 290, \
>     column 8 is not reachable after line 297, column 3.
> 
> Fixes: dee81e988674 ("fixdep: faster CONFIG_ search")
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Reviewed-by: Nicholas Mc Guire <der.herr@hofr.at>

> ---
>  scripts/basic/fixdep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index bbf62cb..131c450 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -296,6 +296,7 @@ static void do_config_file(const char *filename)
>  	if (read(fd, map, st.st_size) != st.st_size) {
>  		perror("fixdep: read");
>  		close(fd);
> +		free(map);

 This looks reasonable but actually it is not clear why do_config_file()
should return at all if read fails as the read error would go unnoticed
in the current code and allow the build to continue. so this probably
should be an exit(2) here and not a return which would then take care
of the free() anyway.

 Atleast I do not see the rational to allow continuation if the read 
failed as the file should not be empty nor a mismatch with st.st_size
expected. If it were due to a EINTR then it still should terminate as
EINTR was not handled and we thus could miss a valid dependency.

 Note: this probably also should be applied to the if (!map) condition
before as well, as at that point it is known that map > 0 and a malloc()
failure would allow skipping parse_config_file() for a valid config.

>  		return;
>  	}
>  	map[st.st_size] = '\0';
> -- 
> 2.7.4
> 
> _______________________________________________
> SIL2review mailing list
> SIL2review@lists.osadl.org
> https://lists.osadl.org/mailman/listinfo/sil2review
