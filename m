Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52282 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfJGGGS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 02:06:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so11115093wmh.2
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Oct 2019 23:06:16 -0700 (PDT)
Date: Mon, 7 Oct 2019 07:06:14 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007060614.GA142813@google.com>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191007043611.31036-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Zerella <adam.zerella@gmail.com>, Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi!

On Mon, Oct 07, 2019 at 01:36:11PM +0900, Masahiro Yamada wrote:
>I did not notice this document was added to Documentation/kbuild/,
>and I do not understand how it is related to the build system.
>
>Kick it out of the kbuild directory.
>
>I am not sure if this is the perfect place, but I added its index
>close to the module-signing.

When searching for a place for this documentation, kbuild/ was the
closest I could find. admin-guide/ seems to target system administrators
while the symbol namespace feature documentation is relevant for kernel
developers. I am ok to take maintainership for the file, but the new
location suggested seems not to be a good fit either.

Cheers,
Matthias

>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> Documentation/admin-guide/index.rst                  | 1 +
> Documentation/{kbuild => admin-guide}/namespaces.rst | 0
> MAINTAINERS                                          | 1 +
> 3 files changed, 2 insertions(+)
> rename Documentation/{kbuild => admin-guide}/namespaces.rst (100%)
>
>diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
>index 34cc20ee7f3a..ca632fda700f 100644
>--- a/Documentation/admin-guide/index.rst
>+++ b/Documentation/admin-guide/index.rst
>@@ -65,6 +65,7 @@ configure specific aspects of kernel behavior to your liking.
>    parport
>    md
>    module-signing
>+   namespaces
>    rapidio
>    sysrq
>    unicode
>diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/admin-guide/namespaces.rst
>similarity index 100%
>rename from Documentation/kbuild/namespaces.rst
>rename to Documentation/admin-guide/namespaces.rst
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 55199ef7fa74..91815dcc5914 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -11547,6 +11547,7 @@ NSDEPS
> M:	Matthias Maennich <maennich@google.com>
> S:	Maintained
> F:	scripts/nsdeps
>+F:	Documentation/admin-guide/namespaces.rst
>
> NTB AMD DRIVER
> M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>-- 
>2.17.1
>
