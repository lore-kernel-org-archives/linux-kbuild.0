Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54998 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751613AbaHRCuh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Aug 2014 22:50:37 -0400
Date: Mon, 18 Aug 2014 11:50:16 +0900 (JST)
Message-Id: <20140818.115016.704988435865155160.yamato@redhat.com>
Subject: Re: [PATCH 1/3] scripts/tags.sh: Don't specify kind-spec for
 emacs' ctags/etags
From: Masatake YAMATO <yamato@redhat.com>
In-Reply-To: <1408168618-6269-2-git-send-email-dirk@gouders.net>
References: <gh61htovas.fsf@quad.gouders.net>
	<1408168618-6269-1-git-send-email-dirk@gouders.net>
	<1408168618-6269-2-git-send-email-dirk@gouders.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dirk@gouders.net
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, nasa4836@gmail.com

Warnings are gone.

Tested-by: Masatake YAMATO <yamato@redhat.com>

On Sat, 16 Aug 2014 07:56:56 +0200, Dirk Gouders <dirk@gouders.net> wrote:
> Emacs' ctags/etags don't know about kind-spec in --regex and
> produce warnings:
> 
> etags: invalid regexp modifier `v', ignoring
> etags: invalid regexp modifier `/', ignoring
> 
> Fix it by removing kind-spec for the emacs case.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Inspired-by: Masatake YAMATO <yamato@redhat.com>
> ---
>  scripts/tags.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index cbfd269..7279897 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -263,7 +263,7 @@ emacs()
>  	--regex='/_PE(\([^,)]*\).*/PEVENT_ERRNO__\1/'		\
>  	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
>  	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
> -	--regex='/DEFINE_HASHTABLE\((\w*)/\1/v/'
> +	--regex='/DEFINE_HASHTABLE\((\w*)/\1/'
>  
>  	all_kconfigs | xargs $1 -a                              \
>  	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
> -- 
> 2.0.2
> 


