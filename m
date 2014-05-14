Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47994 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752251AbaENKRG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 May 2014 06:17:06 -0400
Message-ID: <5373429F.70807@suse.cz>
Date: Wed, 14 May 2014 12:17:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 02/34] kbuild: Introduce KCONFIG_AUTOCONFIGDEP variable
 for conf tool
References: <1400018609-20486-1-git-send-email-alexis.berlemont@gmail.com> <1400018609-20486-3-git-send-email-alexis.berlemont@gmail.com>
In-Reply-To: <1400018609-20486-3-git-send-email-alexis.berlemont@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexis Berlemont <alexis.berlemont@gmail.com>, linux-kernel@vger.kernel.org
Cc: Jiri Olsa <jolsa@redhat.com>, acme@ghostprotocols.net, dsahern@gmail.com, mingo@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, Paul Mackerras <paulus@samba.org>, Corey Ashford <cjashfor@linux.vnet.ibm.com>, Frederic Weisbecker <fweisbec@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-kbuild@vger.kernel.org, Stephane Eranian <eranian@google.com>

On 2014-05-14 00:02, Alexis Berlemont wrote:
> From: Jiri Olsa <jolsa@redhat.com>
> 
> Introducing KCONFIG_AUTOCONFIGDEP variable for conf tool
> allowing to specify custom auto.conf.cmd file.
> 
> Signed-off-by: Jiri Olsa <jolsa@redhat.com>
> Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
> Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Cc: Ingo Molnar <mingo@elte.hu>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Corey Ashford <cjashfor@linux.vnet.ibm.com>
> Cc: Frederic Weisbecker <fweisbec@gmail.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Stephane Eranian <eranian@google.com>
> ---
>  scripts/kconfig/confdata.c | 11 ++++++++++-
>  scripts/kconfig/lkc.h      |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index f88d90f..7afb2a7 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -75,6 +75,14 @@ const char *conf_get_autoconfig_name(void)
>  	return name ? name : "include/config/auto.conf";
>  }
>  
> +const char *conf_get_autoconfigdep_name(void)
> +{
> +	char *name = getenv("KCONFIG_AUTOCONFIGDEP");
> +
> +	return name ? name : "include/config/auto.conf.cmd";
> +}

In both the kernel and perf usage case, the name of the dep file will be
$KCONFIG_AUTOCONFIG.dep. buildroot does not seem to use it at all. So
I'd just append the .cmd suffix here instead of introducing another knob.

Michal
