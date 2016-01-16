Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:33367 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752469AbcAPTOI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Jan 2016 14:14:08 -0500
Received: by mail-yk0-f177.google.com with SMTP id k129so553976931yke.0
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Jan 2016 11:14:08 -0800 (PST)
Date: Sat, 16 Jan 2016 14:14:27 -0500
From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] kbuild: fixdep: Check fstat(2) return value
Message-ID: <20160116191427.GU3359@bill-the-cat>
References: <1449523568-31084-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449523568-31084-1-git-send-email-trini@konsulko.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, lk <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

On Mon, Dec 7, 2015 at 4:26 PM, Tom Rini <trini@konsulko.com> wrote:

> Coverity has recently added a check that will find when we don't check
> the return code from fstat(2).  Copy/paste the checking logic that
> print_deps() has with an appropriate re-wording of the perror() message.
>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tom Rini <trini@konsulko.com>
>
> ---
> Note that I don't have a CID here was I found this in U-Boot and the
> kernel hasn't yet done a build with this test being enabled.
> ---
>  scripts/basic/fixdep.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index c68fd61..e3d9678 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -274,7 +274,11 @@ static void do_config_file(const char *filename)
>                 perror(filename);
>                 exit(2);
>         }
> -       fstat(fd, &st);
> +       if (fstat(fd, &st) < 0) {
> +               fprintf(stderr, "fixdep: error fstat'ing config file: ");
> +               perror(filename);
> +               exit(2);
> +       }
>         if (st.st_size == 0) {
>                 close(fd);
>                 return;

Adding stable@ since this applies to 4.4.  Any comments?  Thanks!

-- 
Tom
