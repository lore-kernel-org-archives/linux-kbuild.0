Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55234 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751158AbdGPQ6L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Jul 2017 12:58:11 -0400
Subject: Re: [PATCH v2] kbuild: trivial cleanups on the comments
References: <1499938671-13376-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <1500199925-5542-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9444a558-cd91-f47a-952a-a48c520c44ee@infradead.org>
Date: Sun, 16 Jul 2017 09:58:03 -0700
MIME-Version: 1.0
In-Reply-To: <1500199925-5542-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com

On 07/16/2017 03:12 AM, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  Makefile               | 6 +++---
>  scripts/Kbuild.include | 7 +++----
>  scripts/basic/Makefile | 2 +-
>  3 files changed, 7 insertions(+), 8 deletions(-)


> @@ -310,7 +309,7 @@ if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
>  	$(rule_$(1)), @:)
>  
>  ###
> -# why - tell why a a target got build
> +# why - tell why a target got build

	tell why a target got built
or
	tell why a target was built

>  #       enabled by make V=2
>  #       Output (listed in the order they are checked):
>  #          (1) - due to target is PHONY


-- 
~Randy
