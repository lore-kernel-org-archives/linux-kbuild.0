Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41557 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729926AbfJHGP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 02:15:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id q9so17846869wrm.8
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Oct 2019 23:15:23 -0700 (PDT)
Date: Tue, 8 Oct 2019 07:15:21 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH] doc: move namespaces.rst from kbuild/ to core-api/
Message-ID: <20191008061521.GD23938@google.com>
References: <20191008031009.17364-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191008031009.17364-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Adam Zerella <adam.zerella@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 08, 2019 at 12:10:09PM +0900, Masahiro Yamada wrote:
>We discussed a better location for this file, and agreed that
>core-api/ is a good fit. Rename it to symbol-namespaces.rst
>for disambiguation, and also add it to index.rst and MAINTAINERS.

Acked-by: Matthias Maennich <maennich@google.com>

Thank you!

Cheers,
Matthias
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> Documentation/core-api/index.rst                                 | 1 +
> .../{kbuild/namespaces.rst => core-api/symbol-namespaces.rst}    | 0
> MAINTAINERS                                                      | 1 +
> 3 files changed, 2 insertions(+)
> rename Documentation/{kbuild/namespaces.rst => core-api/symbol-namespaces.rst} (100%)
>
>diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
>index fa16a0538dcb..ab0eae1c153a 100644
>--- a/Documentation/core-api/index.rst
>+++ b/Documentation/core-api/index.rst
>@@ -38,6 +38,7 @@ Core utilities
>    protection-keys
>    ../RCU/index
>    gcc-plugins
>+   symbol-namespaces
>
>
> Interfaces for kernel debugging
>diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
>similarity index 100%
>rename from Documentation/kbuild/namespaces.rst
>rename to Documentation/core-api/symbol-namespaces.rst
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 55199ef7fa74..a0ca64057b0d 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -11547,6 +11547,7 @@ NSDEPS
> M:	Matthias Maennich <maennich@google.com>
> S:	Maintained
> F:	scripts/nsdeps
>+F:	Documentation/core-api/symbol-namespaces.rst
>
> NTB AMD DRIVER
> M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>-- 
>2.17.1
>
