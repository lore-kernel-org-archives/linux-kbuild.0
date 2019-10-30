Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbfJ3UON (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 16:14:13 -0400
Date: Wed, 30 Oct 2019 21:14:04 +0100
From: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH 0/4] More nsdeps improvements
Message-ID: <20191030201402.GD13413@linux-8ccs>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

+++ Masahiro Yamada [29/10/19 21:38 +0900]:
>This series improves nsdeps more by addressing the root problem.
>
>Based on linux-next.
>
>This series does NOT apply to the Linus tree because
>I updates modpost from my Kbuild tree.
>
>I can pick up this series to kbuild tree if there is no objection.
>If it goes to the module tree, we need to discuss how to deal with
>the conflicts.

Please feel free to take these through the kbuild tree. Thanks!

>The modpost is actively touched these days
>from both kbuild and module trees.
>
>
>
>Masahiro Yamada (4):
>  modpost: do not invoke extra modpost for nsdeps
>  modpost: dump missing namespaces into a single modules.nsdeps file
>  scripts/nsdeps: support nsdeps for external module builds
>  mospost: remove unneeded local variable in contains_namespace()
>
> .gitignore                                   |  2 +-
> Documentation/core-api/symbol-namespaces.rst |  3 ++
> Documentation/dontdiff                       |  1 +
> Makefile                                     | 10 ++--
> scripts/Makefile.modpost                     |  8 ++-
> scripts/mod/modpost.c                        | 55 ++++++++------------
> scripts/mod/modpost.h                        |  4 +-
> scripts/nsdeps                               | 29 ++++++-----
> 8 files changed, 53 insertions(+), 59 deletions(-)
>
>-- 
>2.17.1
>
