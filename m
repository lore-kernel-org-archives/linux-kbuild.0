Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:33048 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756997AbdCHG7F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Mar 2017 01:59:05 -0500
Received: by mail-ot0-f195.google.com with SMTP id 19so2982721oti.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Mar 2017 22:59:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170307234823.17093.94956.stgit@bwallan-cwp1.jf.intel.com>
References: <20170307234823.17093.94956.stgit@bwallan-cwp1.jf.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Mar 2017 07:59:03 +0100
Message-ID: <CAK8P3a3bzdV3zyU+UJD-WDe=7P-htxQ10fsYM3HKUqzCqXKL-A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: external module build warnings when KBUILD_OUTPUT
 set and W=1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bruce Allan <bruce.w.allan@intel.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>

On Wed, Mar 8, 2017 at 12:48 AM, Bruce Allan <bruce.w.allan@intel.com> wrote:
> Commit db547ef19064 ("Kbuild: don't add obj tree in additional includes")
> causes warnings (-Wmissing-include-dirs) when compiling external modules
> with KBUILD_OUTPUT set and W=1.  This is because $src can be an absolute
> path to the external module source which when prefixed with -I$(srctree)/
> generates an incorrect directory path.
>
> Signed-off-by: Bruce Allan <bruce.w.allan@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>

Looks good to me, sorry for the regression

Acked-by: Arnd Bergmann <arnd@arndb.de>
