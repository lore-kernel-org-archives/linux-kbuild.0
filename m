Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55024 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBELxh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 06:53:37 -0500
Received: by mail-wm1-f68.google.com with SMTP id g1so2150831wmh.4
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2020 03:53:36 -0800 (PST)
Date: Wed, 5 Feb 2020 11:53:31 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200205115331.GA74296@google.com>
References: <20200129181541.105335-1-qperret@google.com>
 <20200131131508.GH102066@google.com>
 <20200131174055.GA8425@google.com>
 <20200204144415.GC42496@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204144415.GC42496@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org

On Tuesday 04 Feb 2020 at 14:44:15 (+0000), 'Matthias Maennich' via kernel-team wrote:
> That definitely looks like I would expect that config option to work.

Good, thank you, I'll send an update.

And while at it, I realized we could actually pre-populate autoksyms.h
very early on with the content of the whitelist instead of having it
empty. That way, there's a whole lot of things that will be compiled
'correctly' from the start (that is, adjust_autoksyms.sh won't need to
re-compile them later on). And in fact, if all symbols used by in-tree
modules happen to already be on the whitelist, you'll build a trimmed
kernel in a single pass, which should improve build time a bit I hope.

I'll add something to v3 in addition to your suggestion.

Thanks,
Quentin
