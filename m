Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45671 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGF7h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 01:59:37 -0400
Date: Mon, 7 Oct 2019 16:59:26 +1100
From: Adam Zerella <adam.zerella@gmail.com>
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007055926.GA9631@gmail.com>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007043611.31036-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Jessica Yu <jeyu@kernel.org>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 07, 2019 at 01:36:11PM +0900, Masahiro Yamada wrote:
> I did not notice this document was added to Documentation/kbuild/,
> and I do not understand how it is related to the build system.
> 
> Kick it out of the kbuild directory.

Should we delete the file entirely or does it belong somewhere else? It
was added in c4f4af4094d6c7dbca3acd8d04df2759d268a116 and is referenced
in `Documentation/kernel-hacking/hacking.rst`.

Can we put into the `kernel-hacking` directory?

> I am not sure if this is the perfect place, but I added its index
> close to the module-signing.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Documentation/admin-guide/index.rst                  | 1 +
>  Documentation/{kbuild => admin-guide}/namespaces.rst | 0
>  MAINTAINERS                                          | 1 +
>  3 files changed, 2 insertions(+)
>  rename Documentation/{kbuild => admin-guide}/namespaces.rst (100%)
> 
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 34cc20ee7f3a..ca632fda700f 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -65,6 +65,7 @@ configure specific aspects of kernel behavior to your liking.
>     parport
>     md
>     module-signing
> +   namespaces
>     rapidio
>     sysrq
>     unicode
> diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/admin-guide/namespaces.rst
> similarity index 100%
> rename from Documentation/kbuild/namespaces.rst
> rename to Documentation/admin-guide/namespaces.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55199ef7fa74..91815dcc5914 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11547,6 +11547,7 @@ NSDEPS
>  M:	Matthias Maennich <maennich@google.com>
>  S:	Maintained
>  F:	scripts/nsdeps
> +F:	Documentation/admin-guide/namespaces.rst
>  
>  NTB AMD DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> -- 
> 2.17.1
> 
