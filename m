Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57804 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759311AbcCDWwB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 17:52:01 -0500
Subject: Re: [PATCH v5 5/8] kbuild: add fine grained build dependencies for
 exported symbols
References: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org>
 <1457070050-1564-6-git-send-email-nicolas.pitre@linaro.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56DA118E.20106@suse.com>
Date: Fri, 4 Mar 2016 23:51:58 +0100
MIME-Version: 1.0
In-Reply-To: <1457070050-1564-6-git-send-email-nicolas.pitre@linaro.org>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 4.3.2016 v 06:40 Nicolas Pitre napsal(a):
> +cmd_and_fixdep =                                                             \
> +	$(echo-cmd) $(cmd_$(1));                                             \
> +	$(ksym_dep_filter) |                                                 \
> +		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
> +			> $(dot-target).tmp;	                             \
> +	rm -f $(depfile);                                                    \
> +	mv -f $(dot-target).tmp $(dot-target).cmd;

While trying this, I got a SIGBUS from fixdep once. My theory is that
the depfile is mmap()ed by fixdep and modified by the preprocesor run at
the same time. I could not reproduce this so far (still trying). But if
it's really this race, the fix would be to disable dependency generation
in the preprocessor by passing -Wp,MD,/dev/null or somesuch. But we
never had this problem with genksyms, which is weird. It could as well
be that my build machine's memory is faulty :(.

Michal
