Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:53186 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfJOXDF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 19:03:05 -0400
Subject: Re: [PATCH] :scripts: prune-kernel : prunning kernel generalize way
References: <20191015145548.24165-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c075bcce-0d6d-abee-7fb5-80821f2ae3a2@infradead.org>
Date: Tue, 15 Oct 2019 16:03:04 -0700
MIME-Version: 1.0
In-Reply-To: <20191015145548.24165-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Subject: s/prunning/pruning/
Subject:  s/:scripts:/scripts:/

On 10/15/19 7:55 AM, Bhaskar Chowdhury wrote:
> This patch will remove old kernels from system selective way.

                                                 in a selective way.

> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/prune-kernel | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index 74143f229f84..28fae6c91218 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -33,7 +33,7 @@ printf "\t\n Enlist the installed kernels \n\n\n"
>  cd $boot_dir && pwd
> 
>  #Bash experts not recomend to run ls inside script,but you can by running that too
> -# ls -1 vmlinuz-*
> +# ls -1 vmlinuz-*
> 
>  #This is the recommended way , little complex but that's what people want to see!
> 
> @@ -42,10 +42,10 @@ find $boot_dir -name "vmlinuz-*" -type f -print0 -exec ls -1 {} \;
>  printf "\n\n\n Well, we need to purge some kernel to gain some space.\n\n\n"
> 
> 
> -printf "Please give the kernel version to remove: %s"
> +printf "Please give the kernel version to remove: %s"
>  read kernel_version
> 
> -remove_old_kernel
> +remove_old_kernel
> 
>  printf "\n\n Remove associated modules too ... \n\n"
> 
> @@ -54,7 +54,7 @@ cd $modules_dir && pwd
>  printf "\n\n\n Enlist the installed modules \n\n\n"
> 
>  #This is (-1) minus one not l(el)
> -# ls -1
> +# ls -1
> 
>  find $modules_dir -name "$kernel_version-*" -type f -print0 -exec ls -1 {} \;
> 
> @@ -66,14 +66,14 @@ rm -rf $modules_version
>  printf "\n\n Done \n\n"
> 
>  printf "\n\n Want to remove another?[Yn] : %s"
> -read response
> +read response
> 
> 
>  if [[ $response == "Y" ]]; then
> - printf "Please give another version to remove : %s"
> + printf "Please give another version to remove : %s"
>   read kernel_version
> 
> -remove_old_kernel
> +remove_old_kernel
> 
>  elif [[ $response == "n" ]]; then
> 
> @@ -81,4 +81,4 @@ elif [[ $response == "n" ]]; then
> 
>  fi
> 
> -exit 0
> +exit 0
> --
> 2.21.0
> 

Trying to apply this patch with 'patch --verbose' says:

checking file scripts/prune-kernel
Using Plan A...
Hunk #1 FAILED at 33.
Hunk #2 FAILED at 42.
Hunk #3 FAILED at 54.
Hunk #4 FAILED at 66.
Hunk #5 FAILED at 81.
5 out of 5 hunks FAILED
Hmm...  Ignoring the trailing garbage.
done


Those + and - lines with the same content don't make any sense.

And probably Cc: the author of the script:
J. Bruce Fields <bfields@fieldses.org>

-- 
~Randy
