Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53331 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750921AbaFJJ1y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 05:27:54 -0400
Message-ID: <5396CF99.1070309@suse.cz>
Date: Tue, 10 Jun 2014 11:27:53 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
References: <1402368710-31648-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402368710-31648-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

On 2014-06-10 04:51, Masahiro Yamada wrote:
> CONFIG_SHELL was renamed to KBUILD_SHELL.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Marek <mmarek@suse.cz>
> ---
>  Documentation/kbuild/kbuild.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
> index 6466704..425cd2e 100644
> --- a/Documentation/kbuild/kbuild.txt
> +++ b/Documentation/kbuild/kbuild.txt
> @@ -233,3 +233,8 @@ KBUILD_VMLINUX_MAIN
>  All object files for the main part of vmlinux.
>  KBUILD_VMLINUX_INIT and KBUILD_VMLINUX_MAIN together specify
>  all the object files used to link vmlinux.
> +
> +KBUILD_SHELL
> +--------------------------------------------------
> +Specify which shell to use to run shell scripts in Kbuild.
> +Assigned by the top-level Makefile.

The variable is assinged with a ":=", not a "?=", so you can't change it
from outside, can you? IMO it should not be documented so as not to
confuse users.

Michal

