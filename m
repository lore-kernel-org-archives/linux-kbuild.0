Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:60322 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751692AbaFFPiz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 11:38:55 -0400
Date: Fri, 6 Jun 2014 11:38:51 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 0/7] scripts: objdiff: various clean-up, fix and new
 features
Message-ID: <20140606153851.GM8664@titan.lakedaemon.net>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

Masahiro,

On Fri, May 30, 2014 at 08:11:48PM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> 
> Masahiro Yamada (7):
>   scripts: objdiff: get the path to .tmp_objdiff more simply
>   scripts: objdiff: direct error messages to stderr
>   scripts: objdiff: remove unnecessary code
>   scripts: objdiff: improve path flexibility for record command
>   scripts: objdiff: change the extension of disassembly from .o to .dis
>   scripts: objdiff: fix a comment
>   scripts: objdiff: support directories for the augument of record
>     command
> 
>  scripts/objdiff | 74 +++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 46 insertions(+), 28 deletions(-)

Other than the few minor things I noted on the individual patches,

Acked-by: Jason Cooper <jason@lakedaemon.net>

Great patch series!

thx,

Jason.
