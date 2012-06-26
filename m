Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48672 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752176Ab2FZKlA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jun 2012 06:41:00 -0400
Message-ID: <4FE991B8.2080706@suse.cz>
Date: Tue, 26 Jun 2012 12:40:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] kbuild: remove useless warning
References: <20120505080640.GA13773@merkur.ravnborg.org> <1336205926-13946-8-git-send-email-sam@ravnborg.org>
In-Reply-To: <1336205926-13946-8-git-send-email-sam@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

On 5.5.2012 10:18, Sam Ravnborg wrote:
>  ifneq ($(KCPPFLAGS),)
> -        $(call warn-assign,CPPFLAGS)
>          KBUILD_CPPFLAGS += $(KCPPFLAGS)
>  endif
>  ifneq ($(KAFLAGS),)
> -        $(call warn-assign,AFLAGS)
>          KBUILD_AFLAGS += $(KAFLAGS)
>  endif
>  ifneq ($(KCFLAGS),)
> -        $(call warn-assign,CFLAGS)
>          KBUILD_CFLAGS += $(KCFLAGS)
>  endif

The tests for non-empty can be dropped now.

Michal

