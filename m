Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34118 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753252Ab1EENcF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2011 09:32:05 -0400
Date: Thu, 5 May 2011 15:32:03 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [RFC 7/9] kbuild: merge parser generation rules
Message-ID: <20110505133203.GE13293@sepie.suse.cz>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
 <1304561004-2684-8-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304561004-2684-8-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Hi Arnaud,

nice cleanup, I only have a few random comments to this and other patches.

On Wed, May 04, 2011 at 10:03:22PM -0400, Arnaud Lacombe wrote:
>  # Shipped files
>  # ===========================================================================
>  
>  quiet_cmd_shipped = SHIPPED $@
>  cmd_shipped = cat $< > $@
>  
> -$(obj)/%:: $(src)/%_shipped
> +$(obj)/%.tab.c: $(src)/%.tab.c_shipped
> +	$(call cmd,shipped)
> +
> +$(obj)/lex.%.c: $(src)/lex.%.c_shipped
> +	$(call cmd,shipped)
> +
> +$(obj)/%.hash.c: $(src)/%.hash.c_shipped
>  	$(call cmd,shipped)

Please don't change this rule, there are other uses of _shipped files in the
tree than just bison/lex/gperf generated files.
