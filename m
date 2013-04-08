Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47167 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964863Ab3DHJ7v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Apr 2013 05:59:51 -0400
Message-ID: <51629515.4000702@suse.cz>
Date: Mon, 08 Apr 2013 11:59:49 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: fix ld-option function
References: <1365000153-8318-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1365000153-8318-1-git-send-email-antonynpavlov@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kbuild@vger.kernel.org

On 3.4.2013 16:42, Antony Pavlov wrote:
> The kbuild's ld-option function is broken because
> the command
>   $(CC) /dev/null -c -o "$$TMPO"
> does not create object file!
> 
> I have used a relatively old mips gcc 3.4.6 cross-compiler
> and a relatively new gcc 4.7.2 to check this fact
> but the results are the same.
> 
> EXAMPLE:
>   $ rm /tmp/1.o
>   $ mips-linux-gcc /dev/null -c -o /tmp/1.o
>   mips-linux-gcc: /dev/null: linker input file unused because linking not done
>   $ ls -la /tmp/1.o
>   ls: cannot access /tmp/1.o: No such file or directory
> 
> We can easily fix the problem by adding
> the '-x c' compiler option.
> 
> EXAMPLE:
>   $ rm /tmp/1.o
>   $ mips-linux-gcc -x c /dev/null -c -o /tmp/1.o
>   $ ls -la /tmp/1.o
>   -rw-r--r-- 1 antony antony 778 Apr  2 20:40 /tmp/1.o
> 
> Also fix wrong ld-option example.
> 
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  Documentation/kbuild/makefiles.txt |    2 +-
>  scripts/Kbuild.include             |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to kbuild.git#kbuild, thanks.

Michal
