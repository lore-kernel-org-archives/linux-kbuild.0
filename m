Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48288 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754103Ab2FZKdg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jun 2012 06:33:36 -0400
Message-ID: <4FE98FFB.7020808@suse.cz>
Date: Tue, 26 Jun 2012 12:33:31 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] kbuild: move arch definitions from top-level Makefile
 to scripts/Kbuild.arch
References: <20120505080640.GA13773@merkur.ravnborg.org> <1336205926-13946-6-git-send-email-sam@ravnborg.org>
In-Reply-To: <1336205926-13946-6-git-send-email-sam@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On 5.5.2012 10:18, Sam Ravnborg wrote:
> diff --git a/scripts/Kbuild.arch b/scripts/Kbuild.arch
> new file mode 100644
> index 0000000..230050f
> --- /dev/null
> +++ b/scripts/Kbuild.arch
> @@ -0,0 +1,106 @@
> +#
> +# CC options etc. that requires arch/$(ARCH)/Makefile to be included
> +# before they can be defined
> +
[...]
> +# arch Makefile may override CC so keep this after arch Makefile is included

Just a nitpick, this comment is superfluous now, as the whole file is
included after the arch Makefile.


> +NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
> +CHECKFLAGS     += $(NOSTDINC_FLAGS)

Michal
