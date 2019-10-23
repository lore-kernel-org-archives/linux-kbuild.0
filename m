Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35835 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfJWMWZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 08:22:25 -0400
Date: Wed, 23 Oct 2019 12:22:22 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 0/4] export/modpost: avoid renaming __ksymtab entries
 for symbol namespaces
Message-ID: <20191023122222.GA27861@42.do-not-panic.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191018093143.15997-1-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018093143.15997-1-maennich@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org

On Fri, Oct 18, 2019 at 10:31:39AM +0100, Matthias Maennich wrote:
> The introduction of the symbol namespace patches changed the way symbols are
> named in the ksymtab entries. That caused userland tools to fail (such as
> kmod's depmod). As depmod is used as part of the kernel build it was worth
> having another look whether this name change can be avoided.

Why have this as a default feature? What about having an option to
disable this feature? The benefit being that without a full swing of
tests to avoid regressions its not clear what other issues may creep
up. With this as optional, those wanting the mechanism can enable it
and happilly find the issues for those more conservative.

  Luis
