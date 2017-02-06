Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35811 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752297AbdBFOmR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 09:42:17 -0500
MIME-Version: 1.0
In-Reply-To: <20170206074648.23896-3-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com> <20170206074648.23896-3-changbin.du@intel.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Mon, 6 Feb 2017 07:42:11 -0700
Message-ID: <CA+r1ZhgO-jkcsRxOvhtPa4Pd1Mz1GXnH4cpnWdreBMtXeAkoSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation/kconfig: add search jump feature description
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: changbin.du@intel.com
Cc: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Feb 6, 2017 at 12:46 AM,  <changbin.du@intel.com> wrote:
> From: Changbin Du <changbin.du@intel.com>
>
> Kernel menuconfig support direct jumping function from the search
> result. This is a very convenient feature but not documented. So
> add a short description to the kconfig documentation to let more
> developer know it.
>
> Signed-off-by: Changbin Du <changbin.du@intel.com>
> ---
>  Documentation/kbuild/kconfig.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
> index bbc99c0..9916318 100644
> --- a/Documentation/kbuild/kconfig.txt
> +++ b/Documentation/kbuild/kconfig.txt
> @@ -178,6 +178,10 @@ Searching in menuconfig:
>         first (and in alphabetical order), then come all other symbols,
>         sorted in alphabetical order.
>
> +       In the search result textbox, each symbol has a jump number on
> +       left side if the symbol is jumpable. You can type the nubmer

number  ("jumpable" reads a bit oddly, but it is understandable.)

> +       to jump to target menu to configurate that symbol.

configure?

-- 
Jim
