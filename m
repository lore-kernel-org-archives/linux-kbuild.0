Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 178.115.242.59.static.drei.at ([178.115.242.59]:34341 "EHLO
        mail.osadl.at" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1753760AbdLUPdX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Dec 2017 10:33:23 -0500
Date: Thu, 21 Dec 2017 15:33:14 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH] fixdep: exit with error code in error branches of
 do_config_file()
Message-ID: <20171221153314.GC17019@osadl.at>
References: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kbuild@vger.kernel.org, sil2review@lists.osadl.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Wed, Dec 20, 2017 at 09:27:02PM +0100, Lukas Bulwahn wrote:
> do_config_file() should exit with an error code, and not return if it fails
> as then the error in do_config_file() would go unnoticed in the current
> code and allow the build to continue. The exit with error code will make
> the build fail in those very exceptional cases. If this occurs, this
> actually indicates a deeper problem in the execution of the kernel build
> process.
> 
> Now, that the function exists, we do not explicitly free memory and close
> the file handlers in do_config_file(), as this is covered by exit().
> 
> This issue in the fixdep script was present already before its initial
> import into the git repository in 2005 (Linux-2.6.12-rc2). Hence, the Fixes
> tag would be imprecise and we do not include a Fixes tag to this commit.
> 

In that case you simply go into the git history tree - thats what it is there
for https://git.kernel.org/cgit/linux/kernel/git/history/history.git/

The problems fixed here were introduced by Kai Germaschewski on
Jun 5 2002 - so

Fixes: commit 04bd72170653 ("kbuild: Make dependencies at compile time")

> This issue was identified during the review of a previous patch that
> intended to address a memory leak detected by a static analysis tool.
> 
> Link: https://lkml.org/lkml/2017/12/14/736
> 
> Suggested-by: Nicholas Mc Guire <der.herr@hofr.at>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Reviewed-by: Nicholas Mc Guire <der.herr@hofr.at>

> ---
> compile tested on top of next-20171220 with clang and gcc
> 
>  scripts/basic/fixdep.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index bbf62cb..4274610 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -284,19 +284,18 @@ static void do_config_file(const char *filename)
>  		exit(2);
>  	}
>  	if (st.st_size == 0) {
> -		close(fd);
> -		return;
> +		fprintf(stderr, "fixdep: error empty file config file: ");
> +		perror(filename);
> +		exit(2);

yup ! the .cmd file should never be empty

>  	}
>  	map = malloc(st.st_size + 1);
>  	if (!map) {
>  		perror("fixdep: malloc");
> -		close(fd);
> -		return;
> +		exit(2);
>  	}
>  	if (read(fd, map, st.st_size) != st.st_size) {
>  		perror("fixdep: read");
> -		close(fd);
> -		return;
> +		exit(2);
>  	}
>  	map[st.st_size] = '\0';
>  	close(fd);
> -- 
> 2.7.4
> 
