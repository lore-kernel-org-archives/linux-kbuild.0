Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:58004 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728252AbgEBS3z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 14:29:55 -0400
Date: Sat, 2 May 2020 20:29:43 +0200
From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH kbuild RFC] kbuild: fix modpost throwing away module
 symvers when linking vmlinux.o
Message-ID: <20200502202943.0c13a451@nic.cz>
In-Reply-To: <20200501224300.1012-1-marek.behun@nic.cz>
References: <20200501224300.1012-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Just to note how this breaks things:

On OpenWRT this may happen
1. make modules is run
   - Module.symvers contains symbols from modules
2. make Image/bzImage is run (as part of another OpenWRT make target)
   - Module.symvers is rewritten to contain only vmlinux.o symbols
3. external kernel modules try to build (wireguard, mac80211)
   - this now fails because external modules may depend on symbols from
     other modules and this information isn't in Module.symvers anymore

Marek
