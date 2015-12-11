Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0067.hostedemail.com ([216.40.44.67]:44703 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751940AbbLKOb3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2015 09:31:29 -0500
Date: Fri, 11 Dec 2015 09:31:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] scripts: recordmcount: break hardlinks
Message-ID: <20151211093125.50b72639@gandalf.local.home>
In-Reply-To: <E1a7MVT-0000et-62@rmk-PC.arm.linux.org.uk>
References: <20151202090517.432556a4@gandalf.local.home>
	<E1a7MVT-0000et-62@rmk-PC.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, 11 Dec 2015 12:09:03 +0000
Russell King <rmk+kernel@arm.linux.org.uk> wrote:

> recordmcount edits the file in-place, which can cause problems when
> using ccache in hardlink mode.  Arrange for recordmcount to break a
> hardlinked object.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
> Steven, sorry it took a while to get this out...

Should this be for stable, or is it fine to just add this to my 4.5
queue?

-- Steve

> 
>  scripts/recordmcount.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/scripts/recordmcount.c b/scripts/recordmcount.c
> index 698768bdc581..91705ef30402 100644
> --- a/scripts/recordmcount.c
> +++ b/scripts/recordmcount.c
> @@ -211,6 +211,20 @@ static void *mmap_file(char const *fname)
>  		addr = umalloc(sb.st_size);
>  		uread(fd_map, addr, sb.st_size);
>  	}
> +	if (sb.st_nlink != 1) {
> +		/* file is hard-linked, break the hard link */
> +		close(fd_map);
> +		if (unlink(fname) < 0) {
> +			perror(fname);
> +			fail_file();
> +		}
> +		fd_map = open(fname, O_RDWR | O_CREAT, sb.st_mode);
> +		if (fd_map < 0) {
> +			perror(fname);
> +			fail_file();
> +		}
> +		uwrite(fd_map, addr, sb.st_size);
> +	}
>  	return addr;
>  }
>  

